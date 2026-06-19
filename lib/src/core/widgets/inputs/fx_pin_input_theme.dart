import 'package:flutter/material.dart';

class FxPinInputTheme {

  const FxPinInputTheme({
    this.spacing,
    this.width, 
    this.height,
    this.padding,
    this.border,
    this.backgroundColor, 
    this.errorBorderColor, 
    this.focusBorderColor, 
    this.textStyle, 
    this.borderWidth, 
    this.borderRadius,
    this.errorTextStyle,
  });

  final double? spacing;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Color? errorBorderColor;
  final Color? focusBorderColor;
  final double? borderWidth;
  final InputBorder? border;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final TextStyle? errorTextStyle;

  BorderRadius? get borderRadiusFromInput => switch(border) {
    UnderlineInputBorder() => (border as UnderlineInputBorder).borderRadius,
    OutlineInputBorder() => (border as OutlineInputBorder).borderRadius,
    _ => borderRadius,
  };

  BoxBorder? get primaryBorder => switch(border) {
    UnderlineInputBorder() => Border(
      bottom: BorderSide(color: border!.borderSide.color, width: border!.borderSide.width),
    ),
    OutlineInputBorder() => Border.fromBorderSide(border!.borderSide),
    _ => null,
  };
  BoxBorder? get errorBorder => switch(border) {
    UnderlineInputBorder() => Border(
      bottom: BorderSide(color: errorBorderColor!, width: border!.borderSide.width),
    ),
    OutlineInputBorder() => Border.fromBorderSide(border!.borderSide.copyWith(color: errorBorderColor!)),
    _ => null,
  };

  BoxBorder? get focusBorder => switch(border) {
    UnderlineInputBorder() => Border(
      bottom: BorderSide(color: focusBorderColor!, width: border!.borderSide.width),
    ),
    OutlineInputBorder() => Border.fromBorderSide(border!.borderSide.copyWith(color: focusBorderColor!)),
    _ => null,
  };
}
