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
    this.titleAlignment = TextAlign.center,
    this.dividerTheme = const FxDottedDividerThemeData(),

    this.modalDecoration = const BoxDecoration(),
    this.dialogDecoration = const BoxDecoration(),
    this.bottomSheetDecoration = const BoxDecoration(),
    this.handleDecoration = const BoxDecoration(),
    this.barrierColor = Colors.black54,
    this.handleSize = const Size(64.0, 5.0),
    this.handleMargin = 12.0,
  });

  final EdgeInsetsGeometry? searchPadding;
  final EdgeInsets? margin;
  final ShapeBorder? shape;
  final TextStyle? titleStyle;
  final EdgeInsets? contentPadding;
  final double? horizontalTitleGap;
  final TextAlign titleAlignment;
  final FxDottedDividerThemeData? dividerTheme;
  
  final BoxDecoration dialogDecoration;
  final BoxDecoration modalDecoration;
  final BoxDecoration bottomSheetDecoration;
  final BoxDecoration handleDecoration;
  final Color barrierColor;
  final Size handleSize;
  final double handleMargin;

  FxOverlayThemeData copyWith({
    EdgeInsets? searchPadding,
    EdgeInsets? margin,
    ShapeBorder? shape,
    TextStyle? titleStyle,
    EdgeInsets? contentPadding,
    double? horizontalTitleGap,
    TextAlign? titleAlignment,
    BoxDecoration? dialogDecoration,
    BoxDecoration? modalDecoration,
    BoxDecoration? bottomSheetDecoration,
    BoxDecoration? handleDecoration,
    Color? barrierColor,
    Size? handleSize,
    double? handleMargin,
    FxDottedDividerThemeData? dividerTheme,
  }) => FxOverlayThemeData(
    searchPadding: searchPadding ?? this.searchPadding,
    margin: margin ?? this.margin,
    shape: shape ?? this.shape,
    titleStyle: titleStyle ?? this.titleStyle,
    contentPadding: contentPadding ?? this.contentPadding,
    horizontalTitleGap: horizontalTitleGap ?? this.horizontalTitleGap,
    titleAlignment: titleAlignment ?? this.titleAlignment,
    dialogDecoration: dialogDecoration ?? this.dialogDecoration,
    modalDecoration: modalDecoration ?? this.modalDecoration,
    bottomSheetDecoration: bottomSheetDecoration ?? this.bottomSheetDecoration,
    handleDecoration: handleDecoration ?? this.handleDecoration,
    barrierColor: barrierColor ?? this.barrierColor,
    handleSize: handleSize ?? this.handleSize,
    handleMargin: handleMargin ?? this.handleMargin,
    dividerTheme: dividerTheme ?? this.dividerTheme,
  );

  double get handleHeight => handleSize.height + (handleMargin * 1.8);
}