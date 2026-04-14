import 'package:blueprint_flutter_core/src/core/models/paginated_response.dart';
import 'package:blueprint_flutter_core/src/core/network/app_service.dart';
import 'package:blueprint_flutter_core/src/modules/notifications/models/app_notification.dart';
import 'package:blueprint_flutter_core/src/modules/notifications/models/device_registration.dart';

class NotificationService extends AppService {
  NotificationService(super.ctx);

  Future<void> registerDevice(DeviceRegistration device) async {
    await dio.post<dynamic>(
      endpoints.notificationDevices,
      data: {
        'fcmToken': device.fcmToken,
        'deviceType': device.deviceType.name,
        'deviceName': device.deviceName,
      },
    );
  }

  Future<void> unregisterDevice(String fcmToken) async {
    await dio.delete<dynamic>(
      endpoints.notificationDevices,
      data: {'fcmToken': fcmToken},
    );
  }

  Future<PaginatedResponse<AppNotification>> getNotifications({
    int page = 1,
    int limit = 20,
  }) async {
    final res = await dio.get<Map<String, dynamic>>(
      endpoints.notifications,
      queryParameters: {'page': page, 'limit': limit},
    );
    return PaginatedResponse.fromJson(
      res.data!,
      (item) => AppNotification.fromJson(item as Map<String, dynamic>),
    );
  }

  Future<int> getUnreadCount() async {
    final res = await dio.get<Map<String, dynamic>>(endpoints.unreadCount);
    return res.data!['count'] as int;
  }

  Future<void> markAsRead(String id) async {
    await dio.patch<dynamic>(endpoints.markRead(id));
  }

  Future<void> markAllAsRead() async {
    await dio.patch<dynamic>(endpoints.readAll);
  }

  Future<void> deleteNotification(String id) async {
    await dio.delete<dynamic>(endpoints.notificationById(id));
  }
}
