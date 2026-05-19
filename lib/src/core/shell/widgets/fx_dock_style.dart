import 'package:blueprint_flutter_core/src/core/shell/models/fx_pane.dart';
import 'package:easy_copy_with_annotation/easy_copy_with_annotation.dart';
import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';

part 'fx_dock_style.g.dart';

/// Visual and layout tokens for [FxDock].
@CopyWith()
class FxDockStyle {
  const FxDockStyle({
    this.height,
    this.notchShape,
    this.shadowColor,
    this.itemBuilder,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
    this.clipBehavior = Clip.none,
    this.surfaceTintColor,
    this.spacing = 0.0,
    this.tileStyle = const FxRowTileStyle(),
    this.elevation = 4,
    this.notchMargin = 0.0,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.animationBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  // ==== Animation ==========================================================
  final Duration animationDuration;
  final Widget Function(Widget, Animation<double>) animationBuilder;

  // ==== Bottom app bar style ===============================================
  final Clip clipBehavior;
  final double notchMargin;
  final double elevation;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? height;
  final NotchedShape? notchShape;
  final EdgeInsetsGeometry padding;

  // ==== Row style ==========================================================
  final double spacing;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  // ==== Tile style ========================================================
  final FxRowTileStyle tileStyle;
  final FxTileBuilder<FxPane>? itemBuilder;
}