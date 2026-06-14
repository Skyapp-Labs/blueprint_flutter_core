import 'package:blueprint_flutter_core/blueprint_theme.dart';

class AppThemeData extends FxThemeData {
  const AppThemeData({required super.colors, required super.sizes, required super.typography});

  @override
  AppThemeData copyWith({FxColors? colors, FxSizes? sizes, FxTypography? typography}) =>
      AppThemeData(
        colors:     colors     ?? this.colors,
        sizes:      sizes      ?? this.sizes,
        typography: typography ?? this.typography,
      );
}
