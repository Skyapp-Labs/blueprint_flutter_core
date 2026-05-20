import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/blueprint_widgets.dart';
import 'package:blueprint_flutter_core/blueprint_notifications.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/fx_refresh_view.dart';

/// Full-screen notifications list with pull-to-refresh and pagination.
@immutable
class FxNotificationPageView extends ConsumerWidget with FxUiToolkit {
  FxNotificationPageView({
    super.key,
    this.title = 'Notifications',
    this.errorState = FxStates.error,
    this.emptyState = _defaultEmptyStateData,
    this.onTap,
  });

  final String title;

  /// Empty state data.
  final FxStateData emptyState;

  /// Error state data.
  final FxStateData errorState;

  final void Function(FxNotification)? onTap;

  static const _defaultEmptyStateData = FxStateData(
    icon: Icon(CupertinoIcons.cube_box),
    title: 'Notifications are empty',
    description: "You don't have any notifications yet.",
    actionLabel: 'Refresh',
  );

  Future<List<FxNotification>> _initialLoad(WidgetRef ref) async {
    final controller = ref.read(fxNotificationControllerProvider.notifier);
    final state = ref.read(fxNotificationControllerProvider);
    await controller.loadNotifications(refresh: true);
    await controller.loadUnreadCount();
    return state.notifications;
  }

  Future<List<FxNotification>> _onLoadMore(WidgetRef ref) async {
    final controller = ref.read(fxNotificationControllerProvider.notifier);
    final state = ref.watch(fxNotificationControllerProvider);
    await controller.loadNotifications(refresh: false);
    return state.notifications;
  }

  void _onNotificationTap(WidgetRef ref, FxNotification notification) {
    final controller = ref.read(fxNotificationControllerProvider.notifier);
    if (!notification.read) controller.markAsRead(notification.id);
    onTap?.call(notification);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final state = ref.watch(fxNotificationControllerProvider);
    final controller = ref.read(fxNotificationControllerProvider.notifier);

    return FxScaffold(
      style: const FxScaffoldStyle(padding: EdgeInsets.zero),
      appBar: FxAppBar(
        title: title,
        actions: state.unreadCount > 0
            ? [
                IconButton(
                  icon: const Icon(Icons.done_all),
                  tooltip: 'Mark all as read',
                  onPressed: controller.markAllAsRead,
                ),
              ]
            : null,
      ),
      body: FxRefreshView<List<FxNotification>>(
        onLoad: (_) => _initialLoad(ref),
        onLoadMore: () => _onLoadMore(ref),
        emptyState: emptyState,
        errorState: errorState,
        hasNextPage: state.hasNextPage,
        itemBuilder: (context, notification, index) => FxNotificationTile(
          notification: notification as FxNotification,
          onTap: () => _onNotificationTap(ref, notification),
          onDelete: () {
            final controller = ref.read(fxNotificationControllerProvider.notifier);
            controller.deleteNotification(notification.id);
          }
        ),
        builder: (data, itemCount, scrollController, itemBuilder) => ListView.separated(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: itemCount,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: itemBuilder
        )
      )
    );
  }
}
