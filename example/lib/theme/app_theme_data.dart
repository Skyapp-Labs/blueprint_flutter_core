import 'package:blueprint_flutter_core/blueprint_theme.dart';

/// Concrete Material sub-theme builder for the example app.
///
/// All sub-themes (buttons, inputs, cards, …) are provided by [FxThemeData].
/// Override individual getters here to customise specific components.
class AppThemeData extends FxThemeData {
  const AppThemeData({
    required super.colors,
    required super.sizes,
    required super.typography,
  });

  @override
  AppThemeData copyWith({
    FxColors? colors,
    FxSizes? sizes,
    FxTypography? typography,
  }) =>
      AppThemeData(
        colors: colors ?? this.colors,
        sizes: sizes ?? this.sizes,
        typography: typography ?? this.typography,
      );
}
