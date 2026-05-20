import 'package:blueprint_flutter_core/blueprint_widgets.dart';
import 'package:blueprint_flutter_core/src/modules/notifications/controllers/fx_notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// App bar (or toolbar) control that shows a notification icon and unread badge.
///
/// Watches [fxNotificationControllerProvider] for [FxNotificationsState.unreadCount].
/// Call [onPressed] to navigate to notifications; optionally pass
/// [loadUnreadOnMount] so the count is fetched when the widget is first shown.
@immutable
class FxNotificationIcon extends ConsumerWidget with FxUiToolkit {
  FxNotificationIcon({
    super.key,
    this.onPressed,
    this.iconBuilder,
    this.size,
    this.offset = const Offset(0, 0),
    this.iconColor,
    this.backgroundColor,
    this.foregroundColor,
  });

  final double? size;
  final Offset offset;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final Widget Function(double size)? iconBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final unreadCount = ref.watch(
      fxNotificationControllerProvider.select((s) => s.unreadCount),
    );

    return Tooltip(
      message: unreadCount > 0 ? '$unreadCount unread' : 'No unread notifications',
      child: FxCounterBadge(
        count: unreadCount,
        size: size ?? sizes.iconLg,
        offset: offset,
        showZero: false,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: typography.labelSmall,
        child: (size) {
          if (iconBuilder != null) return iconBuilder!(size);
          return Icon(CupertinoIcons.bell, size: size, color: iconColor);
        }
      )
    );
  }
}
