import 'package:blueprint_flutter_core/blueprint_theme.dart';

class AppComponentTheme extends FxComponentTheme {
  const AppComponentTheme({
    required super.colors,
    required super.sizes,
    required super.typography,
  });

  @override
  AppComponentTheme copyWith({
    FxColors? colors,
    FxSizes? sizes,
    FxTypography? typography,
  }) =>
      AppComponentTheme(
        colors: colors ?? this.colors,
        sizes: sizes ?? this.sizes,
        typography: typography ?? this.typography,
      );
}
