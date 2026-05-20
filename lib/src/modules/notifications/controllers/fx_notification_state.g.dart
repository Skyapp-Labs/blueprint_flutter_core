// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_notification_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

typedef FxNotificationsStateCopyWithFn =
    FxNotificationsState Function({
      List<FxNotification> notifications,
      int unreadCount,
      bool isLoading,
      String? error,
      bool hasNextPage,
      int currentPage,
    });

const Object _fxNotificationsStateCopyWithPlaceholder = Object();

extension FxNotificationsStateCopyWith on FxNotificationsState {
  FxNotificationsStateCopyWithFn get copyWith {
    final instance = this;
    FxNotificationsState copyWithFn({
      Object notifications = _fxNotificationsStateCopyWithPlaceholder,
      Object unreadCount = _fxNotificationsStateCopyWithPlaceholder,
      Object isLoading = _fxNotificationsStateCopyWithPlaceholder,
      Object? error = _fxNotificationsStateCopyWithPlaceholder,
      Object hasNextPage = _fxNotificationsStateCopyWithPlaceholder,
      Object currentPage = _fxNotificationsStateCopyWithPlaceholder,
    }) {
      return FxNotificationsState(
        notifications:
            identical(notifications, _fxNotificationsStateCopyWithPlaceholder)
            ? instance.notifications
            : notifications as List<FxNotification>,
        unreadCount:
            identical(unreadCount, _fxNotificationsStateCopyWithPlaceholder)
            ? instance.unreadCount
            : unreadCount as int,
        isLoading:
            identical(isLoading, _fxNotificationsStateCopyWithPlaceholder)
            ? instance.isLoading
            : isLoading as bool,
        error: identical(error, _fxNotificationsStateCopyWithPlaceholder)
            ? instance.error
            : error as String?,
        hasNextPage:
            identical(hasNextPage, _fxNotificationsStateCopyWithPlaceholder)
            ? instance.hasNextPage
            : hasNextPage as bool,
        currentPage:
            identical(currentPage, _fxNotificationsStateCopyWithPlaceholder)
            ? instance.currentPage
            : currentPage as int,
      );
    }

    return copyWithFn as FxNotificationsStateCopyWithFn;
  }
}
