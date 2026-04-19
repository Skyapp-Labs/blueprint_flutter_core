import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/blueprint_theme.dart';

/// Typography for the example app.
///
/// Uses the system default font family. Override [headlineFontFamily] and
/// [bodyFontFamily] with a custom font once added to your assets.
class AppTypography extends FxTypography {
  const AppTypography({required super.colors, required super.sizes});

  @override
  String get headlineFontFamily => 'Roboto';

  @override
  String get bodyFontFamily => 'Roboto';

  @override
  AppTypography copyWith({FxColors? colors, FxSizes? sizes}) => AppTypography(
        colors: colors ?? this.colors,
        sizes: sizes ?? this.sizes,
      );

  // ── Display ───────────────────────────────────────────────────────────────

  @override
  TextStyle get displayLarge => TextStyle(
        fontSize: sizes.text7xl,
        fontWeight: FontWeight.w700,
        color: colors.textPrimary,
        fontFamily: headlineFontFamily,
        letterSpacing: -0.5,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        fontSize: sizes.text6xl,
        fontWeight: FontWeight.w700,
        color: colors.textPrimary,
        fontFamily: headlineFontFamily,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        fontSize: sizes.text5xl,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
        fontFamily: headlineFontFamily,
      );

  // ── Headline ──────────────────────────────────────────────────────────────

  @override
  TextStyle get headlineLarge => TextStyle(
        fontSize: sizes.text4xl,
        fontWeight: FontWeight.w700,
        color: colors.textPrimary,
        fontFamily: headlineFontFamily,
      );

  @override
  TextStyle get headlineMedium => TextStyle(
        fontSize: sizes.text3xl,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
        fontFamily: headlineFontFamily,
      );

  @override
  TextStyle get headlineSmall => TextStyle(
        fontSize: sizes.text2xl,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
        fontFamily: headlineFontFamily,
      );

  // ── Title ─────────────────────────────────────────────────────────────────

  @override
  TextStyle get titleLarge => TextStyle(
        fontSize: sizes.textXl,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
        fontFamily: headlineFontFamily,
      );

  @override
  TextStyle get titleMedium => TextStyle(
        fontSize: sizes.textLg,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      );

  @override
  TextStyle get titleSmall => TextStyle(
        fontSize: sizes.textMd,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      );

  // ── Body ──────────────────────────────────────────────────────────────────

  @override
  TextStyle get bodyLarge => TextStyle(
        fontSize: sizes.textLg,
        fontWeight: FontWeight.w400,
        color: colors.textPrimary,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        fontSize: sizes.textMd,
        fontWeight: FontWeight.w400,
        color: colors.textPrimary,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        fontSize: sizes.textSm,
        fontWeight: FontWeight.w400,
        color: colors.textSecondary,
      );

  // ── Label ─────────────────────────────────────────────────────────────────

  @override
  TextStyle get labelLarge => TextStyle(
        fontSize: sizes.textMd,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      );

  @override
  TextStyle get labelMedium => TextStyle(
        fontSize: sizes.textSm,
        fontWeight: FontWeight.w500,
        color: colors.textSecondary,
      );

  @override
  TextStyle get labelSmall => TextStyle(
        fontSize: sizes.textXs,
        fontWeight: FontWeight.w500,
        color: colors.textSecondary,
        letterSpacing: 0.4,
      );

  // ── Caption ───────────────────────────────────────────────────────────────

  @override
  TextStyle get caption => TextStyle(
        fontSize: sizes.textSm,
        fontWeight: FontWeight.w400,
        color: colors.textSecondary,
      );

  @override
  TextStyle get captionSmall => TextStyle(
        fontSize: sizes.textXs,
        fontWeight: FontWeight.w400,
        color: colors.textSecondary,
      );

  @override
  TextStyle get captionMedium => TextStyle(
        fontSize: sizes.textSm,
        fontWeight: FontWeight.w500,
        color: colors.textSecondary,
      );
}
