import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';

enum FxButtonVariant { primary, secondary, outline, text, danger }

/// A fully-featured button with loading state, disabled state, and variants.
///
/// Wraps [ElevatedButton], [OutlinedButton], or [TextButton] based on [variant].
class FxButton extends StatelessWidget with FxUiToolkit {
  FxButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = FxButtonVariant.primary,
    this.isLoading = false,
    this.isFullWidth = true,
    this.prefixIcon,
    this.height = 0,
  });

  final String label;
  final VoidCallback? onPressed;
  final FxButtonVariant variant;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? prefixIcon;
  final double height;

  double get _height => height > 0 ? height : sizes.buttonMd;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final effectiveCallback = isLoading ? null : onPressed;
    final child = _buildChild();

    final buttonStyle = theme.elevatedButtonTheme.style ?? ButtonStyle();

    final style = buttonStyle.copyWith(
      minimumSize: WidgetStateProperty.all(
        Size(isFullWidth ? double.infinity : 0, _height)
      ),
    );

    return switch (variant) {
      FxButtonVariant.primary || FxButtonVariant.danger => ElevatedButton(
        onPressed: effectiveCallback,
        style: style.copyWith(
          backgroundColor: variant == FxButtonVariant.danger
            ? WidgetStateProperty.all(colorScheme.error)
            : null,
        ),
        child: child,
      ),
      FxButtonVariant.outline => OutlinedButton(
        onPressed: effectiveCallback,
        style: style,
        child: child,
      ),
      FxButtonVariant.secondary || FxButtonVariant.text => TextButton(
        onPressed: effectiveCallback,
        style: style,
        child: child,
      )
    };
  }

  Widget _buildChild() {
    if (isLoading) {
      return SizedBox(
        height: sizes.md,
        width: sizes.md,
        child: CircularProgressIndicator(
          strokeWidth: sizes.xs / 2,
          color: variant != FxButtonVariant.outline
            ? colorScheme.primary
            : colorScheme.onPrimary,
        )
      );
    }

    if (prefixIcon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        spacing: sizes.sm,
        children: [
          prefixIcon!,
          Text(label)
        ],
      );
    }

    return Text(label);
  }
}
