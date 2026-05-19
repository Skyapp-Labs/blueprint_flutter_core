import 'package:easy_copy_with_annotation/easy_copy_with_annotation.dart';
import 'package:flutter/material.dart';

part 'fx_pane_divider_style.g.dart';

/// Visual config for [FxPaneType.divider] rows.
@immutable
@CopyWith()
class FxPaneDividerStyle {
  const FxPaneDividerStyle({
    this.color,
    this.textStyle,
    this.decoration,
    this.align = TextAlign.start,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.spacing = 0,
    this.dashSpace = 0,
    this.dashWidth = 0,
    this.strokeWidth = 1,
  });

  final Color? color;
  final TextStyle? textStyle;
  final BoxDecoration? decoration;

  final double dashSpace;
  final double dashWidth;
  final double spacing;
  final double strokeWidth;

  final TextAlign align;
  final EdgeInsets margin;
  final EdgeInsets padding;
}