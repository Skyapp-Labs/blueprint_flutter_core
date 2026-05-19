import 'package:easy_copy_with_annotation/easy_copy_with_annotation.dart';
import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';

part 'fx_drawer_style.g.dart';

/// Visual and layout tokens for [FxDrawer] and [FxDrawer.end].
@CopyWith()
class FxDrawerStyle {
  const FxDrawerStyle({
    this.width,
    this.shape,
    this.safeArea = const FxSafeAreaInsets(top: false),
    this.elevation = 4.0,
    this.shadowColor,
    this.backgroundColor,
    this.surfaceTintColor,

    this.padding = EdgeInsets.zero,
    this.physics = const BouncingScrollPhysics(),
    this.shrinkWrap = false,

    this.headerBuilder,
    this.footerBuilder,

    this.tileStyle = const FxTileStyle(),
    this.tileBuilder,
    this.separatorBuilder = const SizedBox.shrink(),

    this.animationBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  // ==== Drawer style ======================================================
  final double elevation;
  final double? width;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final FxSafeAreaInsets safeArea;

  // ==== ListView ===========================================================
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final EdgeInsetsGeometry padding;

  // ==== Header and footer builders ========================================
  final Widget Function(BuildContext context)? headerBuilder;
  final Widget Function(BuildContext context)? footerBuilder;

  // ==== Pane style ========================================================
  final Widget separatorBuilder;
  final FxTileStyle tileStyle;
  final FxTileBuilder? tileBuilder;

  // ==== Animation ==========================================================
  final Duration animationDuration;
  final Widget Function(Widget, Animation<double>) animationBuilder;
}
