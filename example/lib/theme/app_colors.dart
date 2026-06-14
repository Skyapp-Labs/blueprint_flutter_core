import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/blueprint_theme.dart' show FxColors, FxColorMode;

class AppColors extends FxColors {

  AppColors({super.brightness = Brightness.light});

  @override
  FxColors copyWith({ Brightness? brightness }) =>
    AppColors(brightness: brightness ?? super.brightness);

  // ── Primary ──────────────────────────────────────────────────────────────
  @override
  FxColorMode get primaryMode => FxColorMode(
    light: const Color(0xFF132B50),   // Google Blue — replace with your brand
    dark:  const Color(0xFF4DA3FF),
  );

  @override
  FxColorMode get onPrimaryMode => FxColorMode(
    light: const Color(0xFFFFFFFF),
    dark:  const Color(0xFF003060),
  );

  // ── Secondary ────────────────────────────────────────────────────────────
  @override
  FxColorMode get secondaryMode => FxColorMode(
    light: const Color(0xFFF8B94D),
    dark:  const Color(0xFF03DAC6),
  );

  @override
  FxColorMode get onSecondaryMode => FxColorMode(
    light: const Color(0xFF000000),
    dark:  const Color(0xFF000000),
  );

  // ── Error ─────────────────────────────────────────────────────────────────
  @override
  FxColorMode get errorMode => FxColorMode(
    light: const Color(0xFFDD2B2B),
    dark:  const Color(0xFFCF6679),
  );

  @override
  FxColorMode get onErrorMode => FxColorMode(
    light: const Color(0xFFFFFFFF),
    dark:  const Color(0xFF000000),
  );

  // ── Background / Surface ─────────────────────────────────────────────────
  @override
  FxColorMode get backgroundMode => FxColorMode(
    light: const Color(0xFFF5F5F5),
    dark:  const Color(0xFF121212),
  );

  @override
  FxColorMode get onBackgroundMode => FxColorMode(
    light: const Color(0xFF1C1C1C),
    dark:  const Color(0xFFEEEEEE),
  );

  @override
  FxColorMode get surfaceMode => FxColorMode(
    light: const Color(0xFFFFFFFF),
    dark:  const Color(0xFF1E1E1E),
  );

  @override
  FxColorMode get onSurfaceMode => FxColorMode(
    light: const Color(0xFF1C1C1C),
    dark:  const Color(0xFFEEEEEE),
  );

  // ── Supplemental ─────────────────────────────────────────────────────────
  @override
  FxColorMode get surfaceVariantMode => FxColorMode(
    light: const Color(0xFFE8E8E8),
    dark:  const Color(0xFF2C2C2C),
  );

  @override
  FxColorMode get outlineMode => FxColorMode(
    light: const Color(0xFFBDBDBD),
    dark:  const Color(0xFF424242),
  );

  @override
  FxColorMode get shadowMode => FxColorMode(
    light: const Color(0xFF000000),
    dark:  const Color(0xFF000000),
  );

  // ── Semantic ──────────────────────────────────────────────────────────────
  @override
  FxColorMode get successMode => FxColorMode(
    light: const Color(0xFF388E3C),
    dark:  const Color(0xFF66BB6A),
  );

  @override
  FxColorMode get warningMode => FxColorMode(
    light: const Color(0xFFF59F0A),
    dark:  const Color(0xFFFFB74D),
  );

  @override
  FxColorMode get infoMode => FxColorMode(
    light: const Color(0xFF0A84FF),
    dark:  const Color(0xFF4FC3F7),
  );

  // ── Text ──────────────────────────────────────────────────────────────────
  @override
  FxColorMode get textPrimaryMode => FxColorMode(
    light: const Color(0xFF141D2E),
    dark:  const Color(0xFFEEEEEE),
  );

  @override
  FxColorMode get textSecondaryMode => FxColorMode(
    light: const Color(0xFF757575),
    dark:  const Color(0xFFAAAAAA),
  );

  @override
  FxColorMode get textDisabledMode => FxColorMode(
    light: const Color(0xFFBDBDBD),
    dark:  const Color(0xFF616161),
  );

  @override
  FxColorMode get textInverseMode => FxColorMode(
    light: const Color(0xFFFFFFFF),
    dark:  const Color(0xFF1C1C1C),
  );
}
