import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/blueprint_theme.dart';

class AppTypography extends FxTypography {
  const AppTypography({required super.colors, required super.sizes});

  @override String get headlineFontFamily => 'Roboto';
  @override String get bodyFontFamily     => 'Roboto';

  @override AppTypography copyWith({FxColors? colors, FxSizes? sizes}) =>
      AppTypography(colors: colors ?? this.colors, sizes: sizes ?? this.sizes);

  @override TextStyle get displayLarge  => TextStyle(fontSize: sizes.text4xl, fontWeight: FontWeight.w700, color: colors.textPrimary);
  @override TextStyle get displayMedium => TextStyle(fontSize: sizes.text3xl, fontWeight: FontWeight.w700, color: colors.textPrimary);
  @override TextStyle get displaySmall  => TextStyle(fontSize: sizes.text2xl, fontWeight: FontWeight.w700, color: colors.textPrimary);
  @override TextStyle get headlineLarge => TextStyle(fontSize: sizes.textXl,  fontWeight: FontWeight.w700, color: colors.textPrimary);
  @override TextStyle get headlineMedium=> TextStyle(fontSize: sizes.textLg,  fontWeight: FontWeight.w600, color: colors.textPrimary);
  @override TextStyle get headlineSmall => TextStyle(fontSize: sizes.textMd,  fontWeight: FontWeight.w600, color: colors.textPrimary);
  @override TextStyle get titleLarge    => TextStyle(fontSize: sizes.textMd,  fontWeight: FontWeight.w500, color: colors.textPrimary);
  @override TextStyle get titleMedium   => TextStyle(fontSize: sizes.textSm,  fontWeight: FontWeight.w500, color: colors.textPrimary);
  @override TextStyle get titleSmall    => TextStyle(fontSize: sizes.textXs,  fontWeight: FontWeight.w500, color: colors.textPrimary);
  @override TextStyle get bodyLarge     => TextStyle(fontSize: sizes.textMd,  fontWeight: FontWeight.w400, color: colors.textPrimary);
  @override TextStyle get bodyMedium    => TextStyle(fontSize: sizes.textSm,  fontWeight: FontWeight.w400, color: colors.textPrimary);
  @override TextStyle get bodySmall     => TextStyle(fontSize: sizes.textXs,  fontWeight: FontWeight.w400, color: colors.textPrimary);
  @override TextStyle get labelLarge    => TextStyle(fontSize: sizes.textSm,  fontWeight: FontWeight.w500, color: colors.textPrimary);
  @override TextStyle get labelMedium   => TextStyle(fontSize: sizes.textXs,  fontWeight: FontWeight.w500, color: colors.textPrimary);
  @override TextStyle get labelSmall    => TextStyle(fontSize: sizes.textXs,  fontWeight: FontWeight.w400, color: colors.textPrimary);
  @override TextStyle get caption       => TextStyle(fontSize: sizes.textXs,  fontWeight: FontWeight.w400, color: colors.textSecondary);
  @override TextStyle get captionMedium => TextStyle(fontSize: sizes.textXs,  fontWeight: FontWeight.w500, color: colors.textSecondary);
  @override TextStyle get captionSmall  => TextStyle(fontSize: sizes.textXs,  fontWeight: FontWeight.w400, color: colors.textSecondary);
}
