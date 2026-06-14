part of 'fx_overlay.dart';

class FxOverlayTileThemeData {
  const FxOverlayTileThemeData({
    this.margin,
    this.visualDensity = VisualDensity.compact,
    this.dense = false,
    this.shape,
    this.contentPadding,
    this.minTileHeight,
    this.horizontalTitleGap,
    this.foregroundColor,
    this.titleStyle,
    this.subtitleStyle,
    this.backgroundColor,
    this.showSelectionIndicator,
  });

  final EdgeInsets? margin;
  final ShapeBorder? shape;
  final VisualDensity? visualDensity;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool dense;
  final EdgeInsets? contentPadding;
  final double? minTileHeight;
  final double? horizontalTitleGap;
  final Color Function(bool isSelected)? foregroundColor;
  final Color Function(bool isSelected)? backgroundColor;
  final bool? showSelectionIndicator;
}

class FxOverlayThemeData {
  const FxOverlayThemeData({
    this.searchPadding,
    this.margin,
    this.shape,
    this.contentPadding,
    this.horizontalTitleGap,
    this.titleStyle,
    this.dividerTheme = const FxDottedDividerThemeData(),
  });

  final EdgeInsetsGeometry? searchPadding;
  final EdgeInsets? margin;
  final ShapeBorder? shape;
  final TextStyle? titleStyle;
  final EdgeInsets? contentPadding;
  final double? horizontalTitleGap;
  final FxDottedDividerThemeData? dividerTheme;
}