// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_drawer_style.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

typedef FxDrawerStyleCopyWithFn =
    FxDrawerStyle Function({
      double? width,
      ShapeBorder? shape,
      FxSafeAreaInsets safeArea,
      double elevation,
      Color? shadowColor,
      Color? backgroundColor,
      Color? surfaceTintColor,
      EdgeInsetsGeometry padding,
      ScrollPhysics physics,
      bool shrinkWrap,
      Widget Function(BuildContext)? headerBuilder,
      Widget Function(BuildContext)? footerBuilder,
      FxTileStyle tileStyle,
      Widget? Function(FxTile, bool, void Function())? tileBuilder,
      Widget separatorBuilder,
      Widget Function(Widget, Animation<double>) animationBuilder,
      Duration animationDuration,
    });

const Object _fxDrawerStyleCopyWithPlaceholder = Object();

extension FxDrawerStyleCopyWith on FxDrawerStyle {
  FxDrawerStyleCopyWithFn get copyWith {
    final instance = this;
    FxDrawerStyle copyWithFn({
      Object? width = _fxDrawerStyleCopyWithPlaceholder,
      Object? shape = _fxDrawerStyleCopyWithPlaceholder,
      Object safeArea = _fxDrawerStyleCopyWithPlaceholder,
      Object elevation = _fxDrawerStyleCopyWithPlaceholder,
      Object? shadowColor = _fxDrawerStyleCopyWithPlaceholder,
      Object? backgroundColor = _fxDrawerStyleCopyWithPlaceholder,
      Object? surfaceTintColor = _fxDrawerStyleCopyWithPlaceholder,
      Object padding = _fxDrawerStyleCopyWithPlaceholder,
      Object physics = _fxDrawerStyleCopyWithPlaceholder,
      Object shrinkWrap = _fxDrawerStyleCopyWithPlaceholder,
      Object? headerBuilder = _fxDrawerStyleCopyWithPlaceholder,
      Object? footerBuilder = _fxDrawerStyleCopyWithPlaceholder,
      Object tileStyle = _fxDrawerStyleCopyWithPlaceholder,
      Object? tileBuilder = _fxDrawerStyleCopyWithPlaceholder,
      Object separatorBuilder = _fxDrawerStyleCopyWithPlaceholder,
      Object animationBuilder = _fxDrawerStyleCopyWithPlaceholder,
      Object animationDuration = _fxDrawerStyleCopyWithPlaceholder,
    }) {
      return FxDrawerStyle(
        width: identical(width, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.width
            : width as double?,
        shape: identical(shape, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.shape
            : shape as ShapeBorder?,
        safeArea: identical(safeArea, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.safeArea
            : safeArea as FxSafeAreaInsets,
        elevation: identical(elevation, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.elevation
            : elevation as double,
        shadowColor: identical(shadowColor, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.shadowColor
            : shadowColor as Color?,
        backgroundColor:
            identical(backgroundColor, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.backgroundColor
            : backgroundColor as Color?,
        surfaceTintColor:
            identical(surfaceTintColor, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.surfaceTintColor
            : surfaceTintColor as Color?,
        padding: identical(padding, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.padding
            : padding as EdgeInsetsGeometry,
        physics: identical(physics, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.physics
            : physics as ScrollPhysics,
        shrinkWrap: identical(shrinkWrap, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.shrinkWrap
            : shrinkWrap as bool,
        headerBuilder:
            identical(headerBuilder, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.headerBuilder
            : headerBuilder as Widget Function(BuildContext)?,
        footerBuilder:
            identical(footerBuilder, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.footerBuilder
            : footerBuilder as Widget Function(BuildContext)?,
        tileStyle: identical(tileStyle, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.tileStyle
            : tileStyle as FxTileStyle,
        tileBuilder: identical(tileBuilder, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.tileBuilder
            : tileBuilder as Widget? Function(FxTile, bool, void Function())?,
        separatorBuilder:
            identical(separatorBuilder, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.separatorBuilder
            : separatorBuilder as Widget,
        animationBuilder:
            identical(animationBuilder, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.animationBuilder
            : animationBuilder as Widget Function(Widget, Animation<double>),
        animationDuration:
            identical(animationDuration, _fxDrawerStyleCopyWithPlaceholder)
            ? instance.animationDuration
            : animationDuration as Duration,
      );
    }

    return copyWithFn as FxDrawerStyleCopyWithFn;
  }
}
