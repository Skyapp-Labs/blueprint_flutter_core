import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FxAssetIcon {
  const FxAssetIcon({required this.name});

  final String name;

  String get path => 'assets/icons/$name.svg';

  SvgPicture svg({
    double? width, double? height, 
    ColorFilter? colorFilter,
    Color? color,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    String? semanticsLabel,
    WidgetBuilder? placeholderBuilder,
    String? package,
    bool matchTextDirection = false,
    bool allowDrawingOutsideViewBox = false,
  }) {
    ColorFilter? filterFromColor;
    if (color != null) filterFromColor = ColorFilter.mode(color, BlendMode.srcIn);
    return SvgPicture.asset(
      path, 
      width: width, 
      height: height, 
      fit: fit, 
      alignment: alignment, 
      semanticsLabel: semanticsLabel, 
      placeholderBuilder: placeholderBuilder, 
      package: package, 
      matchTextDirection: matchTextDirection, 
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      colorFilter: colorFilter ?? filterFromColor,
    );
  } 
}