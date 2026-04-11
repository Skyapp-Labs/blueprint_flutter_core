import 'package:flutter/material.dart';

import 'base_colors.dart';
import 'base_sizes.dart';
import 'base_theme_data.dart';
import 'base_typography.dart';

/// Blueprint theme builder.
///
/// Extend this once in [app/theme/app_theme.dart] — never edit this file.
/// Override [appColors], [appSizes], [appTypography], and [appThemeData]
/// to wire your brand into the full Material [ThemeData].
abstract class FxTheme {
  FxColors get appColors;
  FxSizes get appSizes;
  FxTypography get appTypography;
  FxThemeData get appThemeData;

  ThemeData build(Brightness brightness) {
    final colors      = appColors.copyWith(brightness: brightness);
    final sizes       = appSizes;
    final typography  = appTypography.copyWith(colors: colors, sizes: sizes);
    final themeData   = appThemeData.copyWith(colors: colors, sizes: sizes, typography: typography);

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.secondary,
      onSecondary: colors.onSecondary,
      error: colors.error,
      onError: colors.onError,
      surface: colors.surface,
      onSurface: colors.onSurface,
      outline: colors.outline,
      shadow: colors.shadow,
      surfaceContainerHighest: colors.surfaceVariant,
    );

    final theme = ThemeData(
			useMaterial3: true,
			brightness: colorScheme.brightness,
			fontFamily: appTypography.bodyFontFamily,
			colorScheme: colorScheme,
			primaryColorLight: colorScheme.primary.withValues(alpha: .5),
			visualDensity: VisualDensity.adaptivePlatformDensity,
			scaffoldBackgroundColor: colors.background,
      dividerColor: colors.outline,
		);

    final textTheme = theme.textTheme
      .apply(
        fontFamily: appTypography.bodyFontFamily,
        displayColor: colors.textSecondary,
        bodyColor: colors.textPrimary,
      )
      .copyWith(
        displayLarge: typography.displayLarge,
        displayMedium: typography.displayMedium,
        displaySmall: typography.displaySmall,
        headlineLarge: typography.headlineLarge,
        headlineMedium: typography.headlineMedium,
        headlineSmall: typography.headlineSmall,
        titleLarge: typography.titleLarge,
        titleMedium: typography.titleMedium,
        titleSmall: typography.titleSmall,
        bodyLarge: typography.bodyLarge,
        bodyMedium: typography.bodyMedium,
        bodySmall: typography.bodySmall,
        labelLarge: typography.labelLarge,
        labelMedium: typography.labelMedium,
        labelSmall: typography.labelSmall,
      );

    return theme.copyWith(
      textTheme: textTheme,
			appBarTheme: themeData.appBarTheme,
			elevatedButtonTheme: themeData.elevatedButtonTheme,
			outlinedButtonTheme: themeData.outlinedButtonTheme,
			textButtonTheme: themeData.textButtonTheme,
			inputDecorationTheme: themeData.inputDecorationTheme,
			snackBarTheme: themeData.snackBarTheme,
			dividerTheme: themeData.dividerTheme,
			chipTheme: themeData.chipTheme,
			checkboxTheme: themeData.checkboxTheme,
			radioTheme: themeData.radioTheme,
			switchTheme: themeData.switchTheme,
			tooltipTheme: themeData.tooltipTheme,
			dialogTheme: themeData.dialogTheme,
			bottomSheetTheme: themeData.bottomSheetTheme,
			progressIndicatorTheme: themeData.progressIndicatorTheme,
      cardTheme: themeData.cardTheme,

      extensions: {
        sizes,       // retrieve with: Theme.of(context).extension<FxSizes>()!
        typography,  // retrieve with: Theme.of(context).extension<FxTypography>()!
      },
    );
  }
}
