import 'package:blueprint_flutter_core/src/core/theme/models/models.dart';
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

  Widget get visibleSuffixIcon => const Icon(Icons.visibility);
  Widget get obscuredSuffixIcon => const Icon(Icons.visibility_off);

  Widget get arrowUpIcon => const Icon(Icons.keyboard_arrow_up_rounded);

  Widget get arrowDownIcon => const Icon(Icons.keyboard_arrow_down_rounded);

  FxViewTransitionTheme get iconToggleTransition => FxViewTransitionTheme(
    duration: const Duration(milliseconds: 350),
    switchInCurve: Curves.easeOutBack,
    switchOutCurve: Curves.easeInBack,
    transitionBuilder: (child, anim) {
      // Incoming icon spins in from 180° → 0°
      final turnIn = Tween<double>(begin: 0.5, end: 0.0).animate(anim);
      // Outgoing icon spins out 0° → -90°
      final turnOut = Tween<double>(begin: 0.0, end: -0.25).animate(
        ReverseAnimation(anim),
      );
      return RotationTransition(
        turns: anim.status == AnimationStatus.reverse ? turnOut : turnIn,
        child: FadeTransition(
          opacity: anim,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.85, end: 1.0).animate(anim),
            child: child,
          )
        ),
      );
    },
  );

  Widget checkedCheckboxIcon({double? size, Color? color}) => Icon(
    Icons.check, 
    size: size, 
    color: color
  );

  Widget uncheckedCheckboxIcon({double? size, Color? color}) => Icon(
    Icons.check_box_outline_blank, 
    size: size, 
    color: color
  );

  Widget searchIcon({double? size, Color? color}) => Icon(
    Icons.search, 
    size: size, 
    color: color
  );
  
  Widget clearIcon({double? size, Color? color}) => Icon(
    Icons.cancel, 
    size: size, 
    color: color
  );

  FxViewTransitionTheme switchingViewTransition({bool isForward = true}) => FxViewTransitionTheme(
    duration: const Duration(milliseconds: 300),
    switchInCurve: Curves.easeOutBack,
    switchOutCurve: Curves.easeInBack,
    transitionBuilder: (child, anim) => SlideTransition(
      position: Tween<Offset>(
        begin: isForward
            ? const Offset(1, 0)
            : const Offset(-1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: ClampedAnimation(anim),
          curve: Curves.easeInOut,
        ),
      ),
      child: child,
    )
  );


}
