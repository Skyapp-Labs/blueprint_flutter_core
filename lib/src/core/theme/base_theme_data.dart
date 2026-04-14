import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/utils/screen_util.dart';
import 'package:blueprint_flutter_core/src/core/theme/base_colors.dart';
import 'package:blueprint_flutter_core/src/core/theme/base_sizes.dart';
import 'package:blueprint_flutter_core/src/core/theme/base_typography.dart';

/// Blueprint contract for Material sub-theme builders.
///
/// Extend this in [app/theme/app_theme_data.dart] to override any sub-theme.
/// All getters receive brightness-resolved [colors], [sizes], and [typography]
/// from [FxTheme.build] — never construct raw colors here.
abstract class FxThemeData {
  final FxColors colors;
  final FxSizes sizes;
  final FxTypography typography;

  const FxThemeData({
    required this.colors,
    required this.sizes,
    required this.typography,
  });

  /// Returns a copy with updated fields.
  /// Called by [FxTheme.build] with brightness-resolved instances.
  FxThemeData copyWith({
    FxColors? colors,
    FxSizes? sizes,
    FxTypography? typography,
  });

  AppBarTheme get appBarTheme => AppBarTheme(
    backgroundColor: colors.surface,
    elevation: sizes.elevationSm,
    foregroundColor: colors.onSurface,
    centerTitle: true,
    titleTextStyle: typography.titleLarge,
    iconTheme: IconThemeData(
      color: colors.onSurface,
      size: sizes.iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: colors.onSurface,
      size: sizes.iconMd,
    ),
  );

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colors.primary,
      foregroundColor: colors.onPrimary,
      minimumSize: Size(double.infinity, sizes.buttonMd),
      textStyle: typography.bodyMedium.copyWith(
        fontWeight: FontWeight.w600,
        fontFamily: typography.headlineFontFamily,
      ),
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: sizes.md, vertical: sizes.md),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(sizes.radiusMd),
      )
    )
  );

  OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: colors.primary,
      minimumSize: Size(double.infinity, sizes.buttonMd),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(sizes.radiusMd),
      ),
      side: BorderSide(color: colors.primary),
      textStyle: typography.bodyMedium.copyWith(
        fontWeight: FontWeight.w600,
        fontFamily: typography.headlineFontFamily,
      ),
      padding: EdgeInsets.symmetric(horizontal: sizes.md, vertical: sizes.md),
    )
  );

  TextButtonThemeData get textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: colors.primary,
      textStyle: typography.bodyMedium.copyWith(
        color: colors.primary,
        fontWeight: FontWeight.w600,
        fontFamily: typography.headlineFontFamily,
      ),
      padding: EdgeInsets.symmetric(horizontal: sizes.md),
    )
  );

  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: colors.surface,
    contentPadding: EdgeInsets.all(sizes.md),
    labelStyle: typography.labelMedium,
    hintStyle: typography.bodyMedium,
    suffixStyle: typography.bodyMedium,
    prefixStyle: typography.bodyMedium,
    errorStyle: typography.bodySmall.copyWith(color: colors.error),
    prefixIconColor: colors.onSurface,
    suffixIconColor: colors.onSurface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(sizes.radiusMd),
      borderSide: BorderSide(color: colors.outline),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(sizes.radiusMd),
      borderSide: BorderSide(color: colors.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(sizes.radiusMd),
      borderSide: BorderSide(color: colors.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(sizes.radiusMd),
      borderSide: BorderSide(color: colors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(sizes.radiusMd),
      borderSide: BorderSide(color: colors.error),
    )
  );

  DividerThemeData get dividerTheme => DividerThemeData(
    color: colors.outline,
    space: sizes.md,
    thickness: 1.0.w,
  );

  SnackBarThemeData get snackBarTheme => SnackBarThemeData(
    backgroundColor: colors.surface,
    contentTextStyle: typography.bodyMedium,
    behavior: SnackBarBehavior.floating,
    actionTextColor: colors.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(sizes.radiusMd),
    )
  );

  ChipThemeData get chipTheme => ChipThemeData(
    backgroundColor: colors.surface,
    disabledColor: colors.onSurface.withValues(alpha: 128),
    selectedColor: colors.primary,
    secondarySelectedColor: colors.secondary,
    padding: EdgeInsets.symmetric(horizontal: sizes.md),
    labelStyle: typography.bodySmall,
    secondaryLabelStyle: typography.bodySmall.copyWith(color: colors.onSurface),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(sizes.radiusMd),
      side: BorderSide(color: colors.outline),
    )
  );

  CardThemeData get cardTheme => CardThemeData(
    color: colors.surface,
    elevation: sizes.elevationSm,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(sizes.radiusLg),
    ),
  );

  CheckboxThemeData get checkboxTheme => CheckboxThemeData(
    side: BorderSide(color: colors.outline),
    checkColor: WidgetStateProperty.all(colors.onPrimary),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(sizes.radiusMd),
    ),
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) return colors.primary;
      return Colors.transparent;
    })
  );

  RadioThemeData get radioTheme => RadioThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return colors.primary;
      }
      return colors.onSurface;
    })
  );

  SwitchThemeData get switchTheme => SwitchThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) return colors.primary;
      return colors.surface;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) return colors.primary;
      return colors.surface;
    }),
    padding: EdgeInsets.zero,
    trackOutlineWidth: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.selected)) return 2.0.w;
      return 2.0.w;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) return colors.onPrimary;
      return colors.onSurface;
    })
  );

  TooltipThemeData get tooltipTheme => TooltipThemeData(
    decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(sizes.tooltipRadius),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            offset: const Offset(0, 2),
            blurRadius: 4,
          )
        ]),
    textStyle: typography.bodySmall,
    padding: EdgeInsets.all(sizes.tooltipPadding),
  );

  DialogThemeData get dialogTheme => DialogThemeData(
    backgroundColor: colors.surface,
    elevation: sizes.elevationLg,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(sizes.radiusLg),
    ),
    titleTextStyle: typography.headlineSmall,
    contentTextStyle: typography.bodyMedium,
  );

  BottomSheetThemeData get bottomSheetTheme => BottomSheetThemeData(
    backgroundColor: colors.surface,
    elevation: sizes.elevationMd,
    shape: RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(sizes.radiusLg),
        topRight: Radius.circular(sizes.radiusLg),
        bottomLeft: Radius.zero,
        bottomRight: Radius.zero,
      )
    )
  );

  ProgressIndicatorThemeData get progressIndicatorTheme => ProgressIndicatorThemeData(
    color: colors.primary,
    linearTrackColor: colors.surface,
    circularTrackColor: colors.surface,
  );
}
