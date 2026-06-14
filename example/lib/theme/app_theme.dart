import 'package:flutter/material.dart';

import 'package:example/theme/app_colors.dart';
import 'package:example/theme/app_sizes.dart';
import 'package:example/theme/app_theme_data.dart';
import 'package:example/theme/app_typography.dart';
import 'package:example/theme/app_component_theme.dart';

import 'package:blueprint_flutter_core/blueprint_theme.dart';

// ─────────────────────────────────────────────
// DEV ZONE — Edit this file freely.
// ─────────────────────────────────────────────
//
// Wire your AppColors, AppSizes, AppTypography and AppThemeData here.
// Pass [AppTheme.light] and [AppTheme.dark] to MaterialApp.
class AppTheme extends FxTheme {
  @override
  final FxColors appColors = AppColors();

  @override
  final FxSizes appSizes = AppSizes();

  @override
  FxTypography get appTypography => AppTypography(
    colors: appColors,
    sizes: appSizes,
  );

  @override
  FxThemeData get appThemeData => AppThemeData(
    colors: appColors,
    sizes: appSizes,
    typography: appTypography,
  );

  @override
  FxComponentTheme get appComponentTheme => AppComponentTheme(
    colors: appColors,
    sizes: appSizes,
    typography: appTypography,
  );

  // Built once at startup — not rebuilt on every access.
  static final ThemeData light = AppTheme().build(Brightness.light);
  static final ThemeData dark = AppTheme().build(Brightness.dark);
}
