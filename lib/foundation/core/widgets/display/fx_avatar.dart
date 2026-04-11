import 'package:flutter/material.dart';

import '../../utils/formatters/text_formatter.dart';
import '../fx_context.dart';

/// Displays a user avatar with image URL, initials fallback, and sizes.
class FxAvatar extends StatelessWidget with FxUiToolkit {
  FxAvatar({
    super.key,
    this.imageUrl,
    this.name,
    this.radius = 24,
    this.showOnlineIndicator = false,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String? imageUrl;
  final String? name;
  final double radius;
  final bool showOnlineIndicator;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final initials =
        name != null && name!.isNotEmpty ? TextFormatter.initials(name!) : '?';

    final avatar = CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? colorScheme.primaryContainer,
      foregroundColor: foregroundColor ?? colorScheme.onPrimaryContainer,
      backgroundImage:
          imageUrl != null && imageUrl!.isNotEmpty
              ? NetworkImage(imageUrl!)
              : null,
      child:
          (imageUrl == null || imageUrl!.isEmpty)
              ? Text(
                initials,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color:
                      foregroundColor ?? theme.colorScheme.onPrimaryContainer,
                ),
              )
              : null,
    );

    if (!showOnlineIndicator) return avatar;

    return Stack(
      children: [
        avatar,
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: sizes.sm + 2,
            height: sizes.sm + 2,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(color: theme.colorScheme.surface, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
