import 'package:flutter/material.dart';

class FxPinInputTheme {

  const FxPinInputTheme({
    this.padding,
    this.borderColor,
    this.backgroundColor,
    this.errorBorderColor,
    this.focusBorderColor,
    this.textStyle,
    this.border = const OutlineInputBorder(),
    this.spacing,
  });

  final double? spacing;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? errorBorderColor;
  final Color? focusBorderColor;
  final TextStyle? textStyle;
  final InputBorder border;
  final EdgeInsetsGeometry? padding;

  factory FxPinInputTheme.fromTheme(ThemeData theme) => FxPinInputTheme(
    borderColor: theme.colorScheme.outline,
    backgroundColor: theme.colorScheme.surface,
    textStyle: theme.textTheme.titleLarge,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: theme.colorScheme.primary),
    )
  );

  FxPinInputTheme copyWith({
    double? spacing,
    Color? borderColor,
    Color? backgroundColor,
    Color? errorBorderColor,
    Color? focusBorderColor,
    TextStyle? textStyle,
    InputBorder? border,
    EdgeInsetsGeometry? padding,
  }) => FxPinInputTheme(
    spacing: spacing ?? this.spacing,
    borderColor: borderColor ?? this.borderColor,
    backgroundColor: backgroundColor ?? this.backgroundColor,
    errorBorderColor: errorBorderColor ?? this.errorBorderColor,
    focusBorderColor: focusBorderColor ?? this.focusBorderColor,
    textStyle: textStyle ?? this.textStyle,
    border: border ?? this.border,
    padding: padding ?? this.padding,
  );
}
