import 'package:flutter/material.dart';

import 'base_colors.dart';
import 'base_sizes.dart';

/// Blueprint contract for typography.
///
/// Extend this in [app/theme/app_typography.dart].
/// Every style here is applied to Material [TextTheme] by [FxTheme.build].
///
/// [colors] is brightness-resolved before being passed in — use [colors.textPrimary]
/// etc. directly in your [TextStyle] definitions.
abstract class FxTypography extends ThemeExtension<FxTypography> {
  final FxColors colors;
  final FxSizes sizes;

  const FxTypography({ required this.colors, required this.sizes });

  /// Returns a copy with updated fields.
  /// [FxTheme.build] calls this with brightness-resolved [colors].
  @override
  FxTypography copyWith({ FxColors? colors, FxSizes? sizes });

  String get headlineFontFamily;
  String get bodyFontFamily;

  // Display styles (large hero text)
  TextStyle get displayLarge;
  TextStyle get displayMedium;
  TextStyle get displaySmall;

  // Heading styles
  TextStyle get headlineLarge;
  TextStyle get headlineMedium;
  TextStyle get headlineSmall;

  // Title styles (app bars, list headers)
  TextStyle get titleLarge;
  TextStyle get titleMedium;
  TextStyle get titleSmall;

  // Body styles (primary reading text)
  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;

  // Label styles (buttons, captions, chips)
  TextStyle get labelLarge;
  TextStyle get labelMedium;
  TextStyle get labelSmall;

  TextStyle get caption;
  TextStyle get captionSmall;
  TextStyle get captionMedium;

  @override
  FxTypography lerp(FxTypography? other, double t) => t < 0.5 ? this : (other ?? this);
}
