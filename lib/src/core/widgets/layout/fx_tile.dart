import 'package:flutter/material.dart';

typedef FxTileState<T> = T Function(bool active);

typedef FxTileIconBuilder = Widget Function(bool isActive, double? size, Color? color );

typedef FxTileTrailingBuilder = Widget Function(BuildContext context, bool isActive);

typedef FxTileTap<T extends FxTile> = void Function(T tile);

typedef FxTileBuilder<T extends FxTile> = Widget? Function(T tile, bool isActive, VoidCallback onTap);

typedef FxTileTapWithContext<T extends FxTile> = void Function(BuildContext context, T tile);

@immutable
class FxTile {
  const FxTile({
    required this.key,
    required this.title,
    this.subtitle,
    this.tileBuilder,
    this.iconBuilder,
    this.trailingBuilder,
    this.isExpanded = true,
  });

  final bool isExpanded;
  final String key;
  final String title;
  final String? subtitle; 
  final FxTileBuilder? tileBuilder;
  final FxTileIconBuilder? iconBuilder;
  final FxTileTrailingBuilder? trailingBuilder;

  /// True if the tile has an icon builder.
  bool get hasIcon => iconBuilder != null;

  /// True if the tile has a trailing builder.
  bool get hasTrailing => trailingBuilder != null;

  /// Builds the icon for the tile.
  /// @param [isActive] - True if the tile is active.
  /// @param [size] - The size of the icon.
  /// @param [color] - The color of the icon.
  /// @return The icon widget.
  Widget? buildIcon(bool isActive, double? size, Color? color) => iconBuilder?.call(isActive, size, color);
}

@immutable
class FxTileStyle {
  const FxTileStyle({
    this.iconSize,
    this.textStyle,
    this.subtitleStyle,
    this.iconColor,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  });


  final EdgeInsetsGeometry padding;
  final FxTileState<Color>? iconColor;
  final FxTileState<Color>? backgroundColor;
  final FxTileState<double?>? iconSize;
  final FxTileState<TextStyle>? textStyle;
  final FxTileState<TextStyle>? subtitleStyle;

  final Curve switchInCurve;
  final Curve switchOutCurve;
  final Duration duration;
  final Duration? reverseDuration;
  final Widget Function(Widget, Animation<double>) transitionBuilder;
  final Widget Function(Widget?, List<Widget>) layoutBuilder;
}

@immutable
class FxRowTileStyle extends FxTileStyle {
  const FxRowTileStyle({
    super.padding = EdgeInsets.zero,
    super.iconSize,
    super.textStyle,
    super.subtitleStyle,
    super.iconColor,
    super.backgroundColor,
    super.duration,
    super.reverseDuration,
    super.switchInCurve,
    super.switchOutCurve,
    super.transitionBuilder,
    super.layoutBuilder,
    this.spacing = 0,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  factory FxRowTileStyle.fromTileStyle(FxTileStyle style) => FxRowTileStyle(
    padding: style.padding,
    iconSize: style.iconSize,
    textStyle: style.textStyle,
    subtitleStyle: style.subtitleStyle,
    iconColor: style.iconColor,
    backgroundColor: style.backgroundColor,
    duration: style.duration,
    reverseDuration: style.reverseDuration,
    switchInCurve: style.switchInCurve,
    switchOutCurve: style.switchOutCurve,
    transitionBuilder: style.transitionBuilder,
    layoutBuilder: style.layoutBuilder,
  );

  final double spacing;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
}