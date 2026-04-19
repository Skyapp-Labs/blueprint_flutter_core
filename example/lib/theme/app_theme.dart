import 'package:blueprint_flutter_core/blueprint_theme.dart';

import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_typography.dart';
import 'app_theme_data.dart';

/// Entry point for building [ThemeData] in the example app.
///
/// Pass `AppTheme().build(brightness)` to [MaterialApp.theme] and
/// [MaterialApp.darkTheme].
class AppTheme extends FxTheme {
  AppTheme();

  final _colors = const AppColors();
  final _sizes = AppSizes();

  @override
  FxColors get appColors => _colors;

  @override
  FxSizes get appSizes => _sizes;

  @override
  FxTypography get appTypography =>
      AppTypography(colors: _colors, sizes: _sizes);

  @override
  FxThemeData get appThemeData => AppThemeData(
        colors: _colors,
        sizes: _sizes,
        typography: AppTypography(colors: _colors, sizes: _sizes),
      );
}
