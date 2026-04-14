import 'package:flutter/material.dart' show ThemeExtension;

import 'package:blueprint_flutter_core/src/core/utils/screen_util.dart';

/// Spacing, radius, and elevation constants.
///
/// These are fixed values consumed by all Fx* widgets.
/// Override individual values in your own component by passing explicit sizes.
abstract class FxSizes extends ThemeExtension<FxSizes>  {
  // Spacing scale
	double get xs => 4.0.sp;
	double get sm => 8.0.sp;
	double get md => 16.0.sp;
	double get lg => 24.0.sp;
	double get xl => 32.0.sp;
	double get xxl => 48.0.sp;

  // Border radius scale
	double get radiusXs => 4.0.r;
	double get radiusSm => 8.0.r;
	double get radiusMd => 12.0.r;
	double get radiusLg => 16.0.r;
	double get radiusXl => 24.0.r;
	double get radiusFull => 999.0.r;

  // overlay
  double get overlayRadius => 48.0.r;
  double get overlayBorderWidth => 5.0.w;
  double get overlayHandleHeight => 8.0.h;
  double get overlayHandleMargin => 12.0.h;
  double get overlayHandleWidth => 64.0.w;

  // Icon sizes
	double get iconXs => 16.0.sp;
	double get iconSm => 20.0.sp;
	double get iconMd => 24.0.sp;
	double get iconLg => 32.0.sp;
	double get iconXl => 40.0.sp;
	double get icon45 => 45.0.sp;
	double get icon50 => 50.0.sp;
	double get icon64 => 64.0.sp;

  // Button heights
	double get buttonSm => 36.0.h;
	double get buttonMd => 48.0.h;
	double get buttonLg => 56.0.h;
  double get buttonRadius => 8.0.r;

	// Input Sizes
	double get inputHeight => 48.0.h;
	double get inputRadius => 8.0.r;
	double get inputBorderWidth => 1.0.w;

	// Card Sizes
	double get cardRadius => 12.0.r;
	double get cardElevation => 2.0.h;
	double get cardPadding => 16.0.w;

	// Avatar Sizes
	double get avatarXs => 24.0.sp;
	double get avatarSm => 32.0.sp;
	double get avatarMd => 40.0.sp;
	double get avatarLg => 48.0.sp;
	double get avatarXl => 64.0.sp;

  // App bar height
  double get appBarHeight => 56.0.h;

  // Elevation
	double get elevationNone => 0.0.h;
	double get elevationSm => 2.0.h;
	double get elevationMd => 4.0.h;
	double get elevationLg => 8.0.h;

  // Text sizes — base scale (phone)
  /// labelSmall
  double get textXs  => 11.0.sp;
  /// labelMedium, bodySmall
  double get textSm  => 12.0.sp;
  /// bodyMedium, labelLarge, titleSmall
  double get textMd  => 14.0.sp;
  /// bodyLarge, titleMedium
  double get textLg  => 16.0.sp;
  /// titleLarge
  double get textXl  => 22.0.sp;
  /// headlineSmall
  double get text2xl => 24.0.sp;
  /// headlineMedium
  double get text3xl => 28.0.sp;
  /// headlineLarge
  double get text4xl => 32.0.sp;
  /// displaySmall
  double get text5xl => 36.0.sp;
  /// displayMedium
  double get text6xl => 45.0.sp;
  /// displayLarge
  double get text7xl => 57.0.sp;

	// Checkbox
	double get checkboxSize => 24.0.sp;
	double get checkboxRadius => 4.0.r;

	// Radio Button
	double get radioSize => 24.0.sp;
	double get radioRadius => 12.0.r;

	// Switch
	double get switchWidth => 52.0.w;
	double get switchHeight => 32.0.h;
	double get switchThumbRadius => 14.0.r;

	// Badge
	double get badgeSize => 16.0.sp;
	double get badgeRadius => 8.0.r;
	double get badgePadding => 4.0.w;

	// Tooltip
	double get tooltipRadius => 4.0.r;
	double get tooltipPadding => 8.0.w;

	// Snackbar
	double get snackbarRadius => 8.0.r;
	double get snackbarPadding => 16.0.w;

  // Required by ThemeExtension — copyWith already exists ✓
  // lerp controls animation between two themes (e.g. theme switching animation)
  @override
  FxSizes lerp(FxSizes? other, double t) => t < 0.5 ? this : (other ?? this);
}
