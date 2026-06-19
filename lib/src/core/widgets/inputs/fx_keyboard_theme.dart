import 'package:flutter/material.dart';

class FxKeyboardTheme {
  final EdgeInsetsGeometry? padding;
	final EdgeInsetsGeometry? keyPadding;
  final Size? keySize;
  final BoxConstraints? constraints;
	final Color? background;
	final Color? foreground;
  final double? keyAspectRatio;
	final double spacing;
	final TextStyle? textStyle;
	final ShapeBorder? shape;

	FxKeyboardTheme({
		this.padding,
		this.keyPadding,
		this.keySize,
		this.constraints,
		this.background,
		this.foreground,
		this.keyAspectRatio,
		this.spacing = 16,
		this.textStyle,
		this.shape,
	});

  FxKeyboardTheme copyWith({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? keyPadding,
    Size? keySize,
    BoxConstraints? constraints,
    Color? background,
    Color? foreground,
    double? spacing,
    TextStyle? textStyle,
    ShapeBorder? shape,
  }) => FxKeyboardTheme(
    padding: padding ?? this.padding,
    keyPadding: keyPadding ?? this.keyPadding,
    keySize: keySize ?? this.keySize,
    constraints: constraints ?? this.constraints,
    background: background ?? this.background,
    foreground: foreground ?? this.foreground,
    spacing: spacing ?? this.spacing,
    textStyle: textStyle ?? this.textStyle,
    shape: shape ?? this.shape,
  );
}
