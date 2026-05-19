// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_dock_style.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

typedef FxDockStyleCopyWithFn =
    FxDockStyle Function({
      double? height,
      NotchedShape? notchShape,
      Color? shadowColor,
      Widget? Function(FxPane, bool, void Function())? itemBuilder,
      Color? backgroundColor,
      EdgeInsetsGeometry padding,
      Clip clipBehavior,
      Color? surfaceTintColor,
      double spacing,
      FxRowTileStyle tileStyle,
      double elevation,
      double notchMargin,
      MainAxisSize mainAxisSize,
      MainAxisAlignment mainAxisAlignment,
      CrossAxisAlignment crossAxisAlignment,
      Widget Function(Widget, Animation<double>) animationBuilder,
      Duration animationDuration,
    });

const Object _fxDockStyleCopyWithPlaceholder = Object();

extension FxDockStyleCopyWith on FxDockStyle {
  FxDockStyleCopyWithFn get copyWith {
    final instance = this;
    FxDockStyle copyWithFn({
      Object? height = _fxDockStyleCopyWithPlaceholder,
      Object? notchShape = _fxDockStyleCopyWithPlaceholder,
      Object? shadowColor = _fxDockStyleCopyWithPlaceholder,
      Object? itemBuilder = _fxDockStyleCopyWithPlaceholder,
      Object? backgroundColor = _fxDockStyleCopyWithPlaceholder,
      Object padding = _fxDockStyleCopyWithPlaceholder,
      Object clipBehavior = _fxDockStyleCopyWithPlaceholder,
      Object? surfaceTintColor = _fxDockStyleCopyWithPlaceholder,
      Object spacing = _fxDockStyleCopyWithPlaceholder,
      Object tileStyle = _fxDockStyleCopyWithPlaceholder,
      Object elevation = _fxDockStyleCopyWithPlaceholder,
      Object notchMargin = _fxDockStyleCopyWithPlaceholder,
      Object mainAxisSize = _fxDockStyleCopyWithPlaceholder,
      Object mainAxisAlignment = _fxDockStyleCopyWithPlaceholder,
      Object crossAxisAlignment = _fxDockStyleCopyWithPlaceholder,
      Object animationBuilder = _fxDockStyleCopyWithPlaceholder,
      Object animationDuration = _fxDockStyleCopyWithPlaceholder,
    }) {
      return FxDockStyle(
        height: identical(height, _fxDockStyleCopyWithPlaceholder)
            ? instance.height
            : height as double?,
        notchShape: identical(notchShape, _fxDockStyleCopyWithPlaceholder)
            ? instance.notchShape
            : notchShape as NotchedShape?,
        shadowColor: identical(shadowColor, _fxDockStyleCopyWithPlaceholder)
            ? instance.shadowColor
            : shadowColor as Color?,
        itemBuilder: identical(itemBuilder, _fxDockStyleCopyWithPlaceholder)
            ? instance.itemBuilder
            : itemBuilder as Widget? Function(FxPane, bool, void Function())?,
        backgroundColor:
            identical(backgroundColor, _fxDockStyleCopyWithPlaceholder)
            ? instance.backgroundColor
            : backgroundColor as Color?,
        padding: identical(padding, _fxDockStyleCopyWithPlaceholder)
            ? instance.padding
            : padding as EdgeInsetsGeometry,
        clipBehavior: identical(clipBehavior, _fxDockStyleCopyWithPlaceholder)
            ? instance.clipBehavior
            : clipBehavior as Clip,
        surfaceTintColor:
            identical(surfaceTintColor, _fxDockStyleCopyWithPlaceholder)
            ? instance.surfaceTintColor
            : surfaceTintColor as Color?,
        spacing: identical(spacing, _fxDockStyleCopyWithPlaceholder)
            ? instance.spacing
            : spacing as double,
        tileStyle: identical(tileStyle, _fxDockStyleCopyWithPlaceholder)
            ? instance.tileStyle
            : tileStyle as FxRowTileStyle,
        elevation: identical(elevation, _fxDockStyleCopyWithPlaceholder)
            ? instance.elevation
            : elevation as double,
        notchMargin: identical(notchMargin, _fxDockStyleCopyWithPlaceholder)
            ? instance.notchMargin
            : notchMargin as double,
        mainAxisSize: identical(mainAxisSize, _fxDockStyleCopyWithPlaceholder)
            ? instance.mainAxisSize
            : mainAxisSize as MainAxisSize,
        mainAxisAlignment:
            identical(mainAxisAlignment, _fxDockStyleCopyWithPlaceholder)
            ? instance.mainAxisAlignment
            : mainAxisAlignment as MainAxisAlignment,
        crossAxisAlignment:
            identical(crossAxisAlignment, _fxDockStyleCopyWithPlaceholder)
            ? instance.crossAxisAlignment
            : crossAxisAlignment as CrossAxisAlignment,
        animationBuilder:
            identical(animationBuilder, _fxDockStyleCopyWithPlaceholder)
            ? instance.animationBuilder
            : animationBuilder as Widget Function(Widget, Animation<double>),
        animationDuration:
            identical(animationDuration, _fxDockStyleCopyWithPlaceholder)
            ? instance.animationDuration
            : animationDuration as Duration,
      );
    }

    return copyWithFn as FxDockStyleCopyWithFn;
  }
}
