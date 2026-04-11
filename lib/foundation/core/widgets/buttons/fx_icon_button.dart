import 'package:flutter/material.dart';

import '../fx_context.dart';

/// An icon button with an optional text label beneath it.
class FxIconButton extends StatelessWidget with FxUiToolkit {
  FxIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.label,
    this.tooltip,
    this.color,
    this.size = 0,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final String? label;
  final String? tooltip;
  final Color? color;
  final double size;

  double get _size => size > 0 ? size : sizes.iconMd;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final button = IconButton(
      onPressed: onPressed,
      icon: icon,
      color: color,
      iconSize: _size,
      tooltip: tooltip,
    );

    if (label != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          button,
          Text(label!, style: typography.labelSmall),
        ],
      );
    }
    return button;
  }
}
