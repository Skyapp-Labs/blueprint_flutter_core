import 'package:blueprint_flutter_core/blueprint_theme.dart';

// ─────────────────────────────────────────────
// DEV ZONE — Edit this file freely.
// ─────────────────────────────────────────────
//
// Override any sub-theme getter from FxThemeData to customise
// buttons, inputs, cards, chips, app bar, etc.
class AppThemeData extends FxThemeData {
  const AppThemeData({
    required super.colors,
    required super.sizes,
    required super.typography,
  });

  @override
  FxThemeData copyWith({
    FxColors? colors,
    FxSizes? sizes,
    FxTypography? typography,
  }) => AppThemeData(
    colors: colors ?? this.colors,
    sizes: sizes ?? this.sizes,
    typography: typography ?? this.typography,
  );
}
