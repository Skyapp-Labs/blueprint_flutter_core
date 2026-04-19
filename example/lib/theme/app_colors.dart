import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/blueprint_theme.dart';

/// Brand color palette for the example app.
///
/// Extends [FxColors] and defines light/dark variants for every token.
class AppColors extends FxColors {
  const AppColors({super.brightness});

  @override
  AppColors copyWith({Brightness? brightness}) =>
      AppColors(brightness: brightness ?? this.brightness);

  // ── Primary — Indigo ──────────────────────────────────────────────────────
  @override
  FxColorMode get primaryMode => const FxColorMode(
        light: Color(0xFF4F46E5),
        dark: Color(0xFF818CF8),
      );

  @override
  FxColorMode get onPrimaryMode => const FxColorMode(
        light: Color(0xFFFFFFFF),
        dark: Color(0xFF1E1B4B),
      );

  // ── Secondary — Violet ────────────────────────────────────────────────────
  @override
  FxColorMode get secondaryMode => const FxColorMode(
        light: Color(0xFF7C3AED),
        dark: Color(0xFFA78BFA),
      );

  @override
  FxColorMode get onSecondaryMode => const FxColorMode(
        light: Color(0xFFFFFFFF),
        dark: Color(0xFF2E1065),
      );

  // ── Error ─────────────────────────────────────────────────────────────────
  @override
  FxColorMode get errorMode => const FxColorMode(
        light: Color(0xFFDC2626),
        dark: Color(0xFFF87171),
      );

  @override
  FxColorMode get onErrorMode => const FxColorMode(
        light: Color(0xFFFFFFFF),
        dark: Color(0xFF7F1D1D),
      );

  // ── Background ────────────────────────────────────────────────────────────
  @override
  FxColorMode get backgroundMode => const FxColorMode(
        light: Color(0xFFF9FAFB),
        dark: Color(0xFF0F172A),
      );

  @override
  FxColorMode get onBackgroundMode => const FxColorMode(
        light: Color(0xFF111827),
        dark: Color(0xFFF1F5F9),
      );

  // ── Surface ───────────────────────────────────────────────────────────────
  @override
  FxColorMode get surfaceMode => const FxColorMode(
        light: Color(0xFFFFFFFF),
        dark: Color(0xFF1E293B),
      );

  @override
  FxColorMode get onSurfaceMode => const FxColorMode(
        light: Color(0xFF111827),
        dark: Color(0xFFF1F5F9),
      );

  @override
  FxColorMode get surfaceVariantMode => const FxColorMode(
        light: Color(0xFFE0E7FF),
        dark: Color(0xFF334155),
      );

  // ── Outline / Shadow ──────────────────────────────────────────────────────
  @override
  FxColorMode get outlineMode => const FxColorMode(
        light: Color(0xFFE2E8F0),
        dark: Color(0xFF334155),
      );

  @override
  FxColorMode get shadowMode => const FxColorMode(
        light: Color(0x1A000000),
        dark: Color(0x33000000),
      );

  // ── Semantic ──────────────────────────────────────────────────────────────
  @override
  FxColorMode get successMode => const FxColorMode(
        light: Color(0xFF16A34A),
        dark: Color(0xFF4ADE80),
      );

  @override
  FxColorMode get warningMode => const FxColorMode(
        light: Color(0xFFD97706),
        dark: Color(0xFFFBBF24),
      );

  @override
  FxColorMode get infoMode => const FxColorMode(
        light: Color(0xFF0284C7),
        dark: Color(0xFF38BDF8),
      );

  // ── Text ──────────────────────────────────────────────────────────────────
  @override
  FxColorMode get textPrimaryMode => const FxColorMode(
        light: Color(0xFF111827),
        dark: Color(0xFFF1F5F9),
      );

  @override
  FxColorMode get textSecondaryMode => const FxColorMode(
        light: Color(0xFF6B7280),
        dark: Color(0xFF94A3B8),
      );

  @override
  FxColorMode get textDisabledMode => const FxColorMode(
        light: Color(0xFFD1D5DB),
        dark: Color(0xFF475569),
      );

  @override
  FxColorMode get textInverseMode => const FxColorMode(
        light: Color(0xFFFFFFFF),
        dark: Color(0xFF0F172A),
      );
}
