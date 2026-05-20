import 'package:blueprint_flutter_core/src/modules/notifications/models/fx_notification.dart';
import 'package:easy_copy_with_annotation/easy_copy_with_annotation.dart';

part 'fx_notification_state.g.dart';

@CopyWith()
class FxNotificationsState {
  const FxNotificationsState({
    this.notifications = const [],
    this.unreadCount = 0,
    this.isLoading = false,
    this.error,
    this.hasNextPage = false,
    this.currentPage = 1,
  });

  final List<FxNotification> notifications;
  final int unreadCount;
  final bool isLoading;
  final String? error;
  final bool hasNextPage;
  final int currentPage;
}
