import 'package:blueprint_flutter_core/src/core/controllers/fx_controller_mixin.dart';
import 'package:blueprint_flutter_core/src/core/network/firebase/fx_firebase_client.dart';
import 'package:blueprint_flutter_core/src/core/network/firebase/fx_messaging.dart';
import 'package:blueprint_flutter_core/src/core/utils/logger.dart';
import 'package:blueprint_flutter_core/src/modules/notifications/models/app_notification.dart';
import 'package:blueprint_flutter_core/src/modules/notifications/models/device_registration.dart';
import 'package:blueprint_flutter_core/src/modules/notifications/services/notification_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_controller.g.dart';
part 'notification_state.dart';

@riverpod
class NotificationController extends _$NotificationController
  with FxControllerMixin {

  late final NotificationService _service;

  @override
  NotificationsState build() {
    _service = NotificationService(serviceContext);
    return const NotificationsState();
  }

  Future<void> loadNotifications({bool refresh = false}) async {
    if (state.isLoading) return;
    final page = refresh ? 1 : state.currentPage;
    state = state.copyWith(isLoading: true);

    try {
      final response = await _service.getNotifications(page: page);
      final merged =
          refresh ? response.data : [...state.notifications, ...response.data];

      state = state.copyWith(
        notifications: merged,
        isLoading: false,
        hasNextPage: response.hasNextPage,
        currentPage: page + 1,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadUnreadCount() async {
    try {
      final count = await _service.getUnreadCount();
      state = state.copyWith(unreadCount: count);
    } catch (_) {}
  }

  Future<void> markAsRead(String id) async {
    try {
      await _service.markAsRead(id);
      final updated =
          state.notifications.map((n) {
            return n.id == id ? n.copyWith(read: true) : n;
          }).toList();
      final newUnread = state.unreadCount > 0 ? state.unreadCount - 1 : 0;
      state = state.copyWith(notifications: updated, unreadCount: newUnread);
    } catch (_) {}
  }

  Future<void> markAllAsRead() async {
    try {
      await _service.markAllAsRead();
      final updated =
          state.notifications.map((n) => n.copyWith(read: true)).toList();
      state = state.copyWith(notifications: updated, unreadCount: 0);
    } catch (_) {}
  }

  Future<void> deleteNotification(String id) async {
    try {
      await _service.deleteNotification(id);
      final updated = state.notifications.where((n) => n.id != id).toList();
      state = state.copyWith(notifications: updated);
    } catch (_) {}
  }

  bool get canRegisterDevice {
    if (!config.enableNotifications) {
      FxLogger.d('Skipping device registration — enableNotifications is false.');
      return false;
    }

    if (!FxFirebaseClient.isInitialized) {
      FxLogger.w('Skipping device registration — Firebase is not initialized.');
      return false;
    }

    return true;
  }

  Future<void> requestNotificationPermission() async {
    if (!canRegisterDevice) return;
    final token = await FxMessaging.requestPermissionAndGetToken();
    if (token == null) return;
    final device = await _getDeviceName(token);
    await _service.registerDevice(device);
  }

  Future<void> registerDevice(String token) async {
    if (!canRegisterDevice) return;
    final device = await _getDeviceName(token);
    await _service.registerDevice(device);
  }

  Future<DeviceRegistration> _getDeviceName(String token) async {
    final deviceType = switch (defaultTargetPlatform) {
      TargetPlatform.iOS => DeviceType.ios,
      TargetPlatform.android => DeviceType.android,
      _ => DeviceType.web,
    };

    final deviceName = await DeviceInfoPlugin().deviceInfo.then((info) => info.data);

    return DeviceRegistration(
      fcmToken: token,
      deviceType: deviceType,
      deviceName: '${deviceName['name']}: ${deviceName['model']}',
    );
  }
}
