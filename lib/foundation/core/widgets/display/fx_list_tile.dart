import 'package:flutter/material.dart';

import '../fx_context.dart';

/// A list tile with configurable leading, title, subtitle, trailing,
/// and optional swipe-to-action support.
class FxListTile extends StatelessWidget with FxUiToolkit {
  FxListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.showDivider = false,
  });

  final Widget? leading;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: leading,
          title: Text(title, style: typography.bodyLarge),
          subtitle:
              subtitle != null
                  ? Text(
                    subtitle!,
                    style: typography.bodySmall.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  )
                  : null,
          trailing:
              trailing ??
              (onTap != null
                  ? Icon(Icons.chevron_right, size: sizes.iconMd)
                  : null),
          onTap: onTap,
          onLongPress: onLongPress,
          contentPadding:
              padding ??
              EdgeInsets.symmetric(
                horizontal: sizes.md,
                vertical: sizes.xs,
              ),
        ),
        if (showDivider) Divider(height: 1),
      ],
    );
  }
}
