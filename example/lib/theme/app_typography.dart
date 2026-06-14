import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/blueprint_theme.dart';

// ─────────────────────────────────────────────
// DEV ZONE — Edit this file freely.
// ─────────────────────────────────────────────
//
// Replace with your brand font. To use a Google Font:
// 1. Add `google_fonts` to pubspec.yaml
// 2. Import: import 'package:google_fonts/google_fonts.dart';
// 3. Replace TextStyle(fontFamily: fontFamily, ...) with GoogleFonts.inter(...)
class AppTypography extends FxTypography {
  const AppTypography({ required super.colors, required super.sizes });

  @override
  FxTypography copyWith({ FxColors? colors, FxSizes? sizes }) => AppTypography(
    colors: colors ?? this.colors,
    sizes: sizes ?? this.sizes,
  );

  @override
  String get headlineFontFamily => 'barlow';
  @override
  String get bodyFontFamily => 'nunito';

  @override
  TextStyle get displayLarge => TextStyle(
    fontFamily: headlineFontFamily,
    fontSize: sizes.text7xl,
    fontWeight: FontWeight.w400,
    height: 1.12,
    color: colors.textPrimary,
  );

  @override
  TextStyle get displayMedium => TextStyle(
    fontFamily: headlineFontFamily,
    fontSize: sizes.text6xl,
    fontWeight: FontWeight.w400,
    height: 1.16,
    color: colors.textPrimary,
  );

  @override
  TextStyle get displaySmall => TextStyle(
    fontFamily: headlineFontFamily,
    fontSize: sizes.text5xl,
    fontWeight: FontWeight.w400,
    height: 1.22,
    color: colors.textPrimary,
  );

  @override
  TextStyle get headlineLarge => TextStyle(
    fontFamily: headlineFontFamily,
    fontSize: sizes.text4xl,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: colors.textPrimary,
  );

  @override
  TextStyle get headlineMedium => TextStyle(
    fontFamily: headlineFontFamily,
    fontSize: sizes.text3xl,
    fontWeight: FontWeight.w600,
    height: 1.29,
    color: colors.textPrimary,
  );

  @override
  TextStyle get headlineSmall => TextStyle(
    fontFamily: headlineFontFamily,
    fontSize: sizes.text2xl,
    fontWeight: FontWeight.w600,
    height: 1.33,
    color: colors.textPrimary,
  );

  @override
  TextStyle get titleLarge => TextStyle(
    fontFamily: headlineFontFamily,
    fontSize: sizes.textXl,
    fontWeight: FontWeight.w600,
    height: 1.27,
    color: colors.textPrimary,
  );

  @override
  TextStyle get titleMedium => TextStyle(
    fontFamily: headlineFontFamily,
    fontSize: sizes.textLg,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.15,
    color: colors.textPrimary,
  );

  @override
  TextStyle get titleSmall => TextStyle(
    fontFamily: headlineFontFamily,
    fontSize: sizes.textMd,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
    color: colors.textPrimary,
  );

  @override
  TextStyle get bodyLarge => TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: sizes.textLg,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
    color: colors.textPrimary,
  );

  @override
  TextStyle get bodyMedium => TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: sizes.textMd,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
    color: colors.textPrimary,
  );

  @override
  TextStyle get bodySmall => TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: sizes.textSm,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
    color: colors.textSecondary,
  );

  @override
  TextStyle get labelLarge => TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: sizes.textMd,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
    color: colors.textPrimary,
  );

  @override
  TextStyle get labelMedium => TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: sizes.textSm,
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0.5,
    color: colors.textSecondary,
  );

  @override
  TextStyle get labelSmall => TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: sizes.textXs,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 0.5,
    color: colors.textDisabled,
  );

  @override
  TextStyle get caption => TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: sizes.textMd,
    fontWeight: FontWeight.w300,
    height: 1.33,
    letterSpacing: 0.4,
    color: colors.textSecondary,
  );

  @override
  TextStyle get captionSmall => TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: sizes.textXs,
    fontWeight: FontWeight.w300,
    height: 1.33,
    letterSpacing: 0.4,
    color: colors.textSecondary,
  );

  @override
  TextStyle get captionMedium => TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: sizes.textSm,
    fontWeight: FontWeight.w300,
    height: 1.33,
    letterSpacing: 0.4,
    color: colors.textSecondary,
  );
}
