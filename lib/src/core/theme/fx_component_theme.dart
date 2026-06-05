import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/theme/fx_colors.dart';
import 'package:blueprint_flutter_core/src/core/theme/fx_sizes.dart';
import 'package:blueprint_flutter_core/src/core/theme/fx_typography.dart';

/// Blueprint contract for Material sub-theme builders.
///
/// Extend this in [app/theme/app_theme_data.dart] to override any sub-theme.
/// All getters receive brightness-resolved [colors], [sizes], and [typography]
/// from [FxTheme.build] — never construct raw colors here.
abstract class FxComponentTheme extends ThemeExtension<FxComponentTheme> {
  final FxColors colors;
  final FxSizes sizes;
  final FxTypography typography;

  const FxComponentTheme({
    required this.colors,
    required this.sizes,
    required this.typography,
  });

  /// Returns a copy with updated fields.
  /// Called by [FxTheme.build] with brightness-resolved instances.
  @override
  FxComponentTheme copyWith({
    FxColors? colors,
    FxSizes? sizes,
    FxTypography? typography,
  });

  @override
  FxComponentTheme lerp(FxComponentTheme? other, double t) => t < 0.5 ? this : (other ?? this);

  Widget get closeIcon => const Icon(Icons.close);

  Widget get navigateBackIcon => const Icon(Icons.arrow_back);
}
