import 'package:flutter/material.dart';

import 'package:skyapp_flutter_core/src/core/utils/formatters/date_formatter.dart';
import 'package:skyapp_flutter_core/src/core/widgets/fx_context.dart';
import 'package:skyapp_flutter_core/src/modules/notifications/models/app_notification.dart';

/// A notification list item with read/unread state and swipe-to-delete.
class FxNotificationTile extends StatelessWidget with FxUiToolkit {
  FxNotificationTile({
    super.key,
    required this.notification,
    this.onTap,
    this.onDelete,
  });

  final AppNotification notification;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final tile = ListTile(
      onTap: onTap,
      tileColor:
          notification.read
              ? null
              : colorScheme.primary.withValues(alpha: 0.06),
      leading: CircleAvatar(
        backgroundColor:
            notification.read
                ? colorScheme.surfaceContainerHighest
                : colorScheme.primaryContainer,
        child: Icon(
          Icons.notifications_outlined,
          size: sizes.iconMd,
          color:
              notification.read
                  ? theme.colorScheme.onSurface.withValues(alpha: 0.5)
                  : theme.colorScheme.primary,
        ),
      ),
      title: Text(
        notification.title,
        style: typography.bodyLarge.copyWith(
          fontWeight: notification.read ? FontWeight.normal : FontWeight.w600,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notification.body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: typography.bodySmall,
          ),
          const SizedBox(height: 2),
          Text(
            DateFormatter.relative(DateTime.parse(notification.createdAt)),
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
      trailing:
          !notification.read
              ? Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              )
              : null,
    );

    if (onDelete == null) return tile;

    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete!(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: sizes.lg),
        color: colorScheme.error,
        child: Icon(Icons.delete_outline, color: colorScheme.onError),
      ),
      child: tile,
    );
  }
}
