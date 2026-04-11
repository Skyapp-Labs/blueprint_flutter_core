part of 'notification_controller.dart';

class NotificationsState {
  const NotificationsState({
    this.notifications = const [],
    this.unreadCount = 0,
    this.isLoading = false,
    this.error,
    this.hasNextPage = false,
    this.currentPage = 1,
  });

  final List<AppNotification> notifications;
  final int unreadCount;
  final bool isLoading;
  final String? error;
  final bool hasNextPage;
  final int currentPage;

  NotificationsState copyWith({
    List<AppNotification>? notifications,
    int? unreadCount,
    bool? isLoading,
    String? error,
    bool? hasNextPage,
    int? currentPage,
  }) => NotificationsState(
    notifications: notifications ?? this.notifications,
    unreadCount: unreadCount ?? this.unreadCount,
    isLoading: isLoading ?? this.isLoading,
    error: error,
    hasNextPage: hasNextPage ?? this.hasNextPage,
    currentPage: currentPage ?? this.currentPage,
  );
}
