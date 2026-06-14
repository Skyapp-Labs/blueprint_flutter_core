import 'package:blueprint_flutter_core/blueprint_theme.dart';
import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_typography.dart';
import 'app_theme_data.dart';
import 'app_component_theme.dart';

class AppTheme extends FxTheme {
  @override FxColors      get appColors     => const AppColors();
  @override FxSizes       get appSizes      => AppSizes();
  @override FxTypography  get appTypography => AppTypography(colors: appColors, sizes: appSizes);
  @override FxThemeData   get appThemeData  => AppThemeData(
    colors: appColors, sizes: appSizes, typography: appTypography);
  @override FxComponentTheme get appComponentTheme => AppComponentTheme(
    colors: appColors, sizes: appSizes, typography: appTypography);
}
