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
    this.suffixIcon,
    this.height = 0,
    this.foregroundColor,
    this.backgroundColor,
    this.borderColor,
    this.margin,
  });

  final String label;
  final VoidCallback? onPressed;
  final FxButtonVariant variant;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double height;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;

  double get _height => height > 0 ? height : sizes.buttonMd;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final effectiveCallback = isLoading ? null : onPressed;
    final child = _buildChild();

    final buttonStyle = {
      FxButtonVariant.primary: theme.elevatedButtonTheme.style ?? ButtonStyle(),
      FxButtonVariant.secondary: theme.textButtonTheme.style ?? ButtonStyle(),
      FxButtonVariant.outline: theme.outlinedButtonTheme.style ?? ButtonStyle(),
      FxButtonVariant.text: theme.textButtonTheme.style ?? ButtonStyle(),
      FxButtonVariant.danger: theme.elevatedButtonTheme.style ?? ButtonStyle(),
    };

    final style = buttonStyle[variant]?.copyWith(
      foregroundColor: foregroundColor != null ? WidgetStateProperty.all(foregroundColor) : null,
      backgroundColor: backgroundColor != null ? WidgetStateProperty.all(backgroundColor) : null,
      minimumSize: WidgetStateProperty.all(
        Size(isFullWidth ? double.infinity : 0, _height)
      ),
      side: borderColor != null ? WidgetStateProperty.all(BorderSide(color: borderColor!)) : null,
    );

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: switch (variant) {
        FxButtonVariant.primary || FxButtonVariant.danger => ElevatedButton(
          onPressed: effectiveCallback,
          style: style?.copyWith(
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
      }
    );
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

    if (prefixIcon != null || suffixIcon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        spacing: sizes.sm,
        children: [
          prefixIcon ?? SizedBox.shrink(),
          Text(label),
          suffixIcon ?? SizedBox.shrink(),
        ],
      );
    }

    return Text(label);
  }
}
