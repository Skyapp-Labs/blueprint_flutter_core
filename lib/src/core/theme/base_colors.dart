import 'package:flutter/material.dart';

/// Holds the light and dark variants of a single color token.
/// Use [resolve] to get the correct color for the current brightness.
class FxColorMode {
  final Color light;
  final Color dark;

  const FxColorMode({ required this.light, required this.dark });

  Color resolve(Brightness brightness) => brightness == Brightness.dark ? dark : light;
}

/// Blueprint contract for brand colors.
///
/// Extend this in [app/theme/app_colors.dart] and provide your brand palette.
/// Every token is consumed by [FxTheme.build] to wire the full
/// Material [ColorScheme] automatically.
///
/// Pass [brightness] to resolve all color getters for the correct mode:
///   FxTheme.build(colors: AppColors(brightness: Brightness.dark), ...)
abstract class FxColors {
  final Brightness brightness;

  const FxColors({ this.brightness = Brightness.light });

  FxColors copyWith({ Brightness? brightness });

  Color _r(FxColorMode mode) => mode.resolve(brightness);

  // ── Abstract tokens (implement in AppColors) ──────────────────────────────
  FxColorMode get primaryMode;
  FxColorMode get onPrimaryMode;
  FxColorMode get secondaryMode;
  FxColorMode get onSecondaryMode;
  FxColorMode get errorMode;
  FxColorMode get onErrorMode;
  FxColorMode get backgroundMode;
  FxColorMode get onBackgroundMode;
  FxColorMode get surfaceMode;
  FxColorMode get onSurfaceMode;
  FxColorMode get surfaceVariantMode;
  FxColorMode get outlineMode;
  FxColorMode get shadowMode;
  FxColorMode get successMode;
  FxColorMode get warningMode;
  FxColorMode get infoMode;
  FxColorMode get textPrimaryMode;
  FxColorMode get textSecondaryMode;
  FxColorMode get textDisabledMode;
  FxColorMode get textInverseMode;

  // ── Resolved getters (brightness-aware, used by FxTheme and Fx* widgets) ──
  Color get primary        => _r(primaryMode);
  Color get onPrimary      => _r(onPrimaryMode);
  Color get secondary      => _r(secondaryMode);
  Color get onSecondary    => _r(onSecondaryMode);
  Color get error          => _r(errorMode);
  Color get onError        => _r(onErrorMode);
  Color get background     => _r(backgroundMode);
  Color get onBackground   => _r(onBackgroundMode);
  Color get surface        => _r(surfaceMode);
  Color get onSurface      => _r(onSurfaceMode);
  Color get surfaceVariant => _r(surfaceVariantMode);
  Color get outline        => _r(outlineMode);
  Color get shadow         => _r(shadowMode);
  Color get success        => _r(successMode);
  Color get warning        => _r(warningMode);
  Color get info           => _r(infoMode);
  Color get textPrimary    => _r(textPrimaryMode);
  Color get textSecondary  => _r(textSecondaryMode);
  Color get textDisabled   => _r(textDisabledMode);
  Color get textInverse    => _r(textInverseMode);
}
