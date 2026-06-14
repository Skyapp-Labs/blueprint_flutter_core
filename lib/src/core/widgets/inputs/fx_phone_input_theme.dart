import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/theme/fx_sizes.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_country_flag.dart';

@immutable
class FxPhoneInputTheme {
  const FxPhoneInputTheme({
    this.spacing,
    this.flagSize,
    this.flagShape = FxFlagShape.circle,
    this.integratedDialFactor = 0.4,
    this.splitCountryFlex = 2,
    this.phoneFlex = 3,
    this.splitMinCountryWidth,
    this.splitMaxCountryWidth,
    this.dividerWidth = 1,
    this.phoneHint = 'Enter your phone number',
    this.countryHint = 'Select your country',
    this.overlayTitle = 'Select country',
    this.autoStackOnPhone = true,
  });

  final double? spacing;
  final double? flagSize;
  final FxFlagShape flagShape;

  /// Integrated layout: country prefix width as fraction of field width.
  final double integratedDialFactor;

  /// Split layout flex values.
  final int splitCountryFlex;
  final int phoneFlex;
  final double? splitMinCountryWidth;
  final double? splitMaxCountryWidth;

  final double dividerWidth;

  final String phoneHint;
  final String countryHint;
  final String overlayTitle;

  /// On narrow screens, split layout falls back to stacked.
  final bool autoStackOnPhone;

  double spacingOf(FxSizes sizes) => spacing ?? sizes.md;
  double flagSizeOf(FxSizes sizes) => flagSize ?? sizes.iconMd;

  double splitCountryWidth(double screenWidth, {required bool isPhone}) {
    final minW = splitMinCountryWidth ?? (isPhone ? 104 : 120);
    final maxW = splitMaxCountryWidth ?? (isPhone ? 132 : 160);
    final target = screenWidth * (isPhone ? 0.30 : 0.28);
    return target.clamp(minW, maxW);
  }

  double integratedDialWidth(BoxConstraints constraints, BuildContext context) {
    final base = constraints.maxWidth.isFinite
        ? constraints.maxWidth
        : MediaQuery.sizeOf(context).width;
    return base * integratedDialFactor;
  }
}