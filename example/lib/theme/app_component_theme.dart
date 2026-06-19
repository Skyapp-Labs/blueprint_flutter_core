import 'package:blueprint_flutter_core/blueprint_theme.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
// DEV ZONE — Edit this file freely.
// ─────────────────────────────────────────────
//
// Override any sub-theme getter from FxThemeData to customise
// buttons, inputs, cards, chips, app bar, etc.
class AppComponentTheme extends FxComponentTheme {
  const AppComponentTheme({
    required super.colors,
    required super.sizes,
    required super.typography,
  });

  @override
  FxComponentTheme copyWith({
    FxColors? colors,
    FxSizes? sizes,
    FxTypography? typography,
  }) => AppComponentTheme(
    colors: colors ?? this.colors,
    sizes: sizes ?? this.sizes,
    typography: typography ?? this.typography,
  );

  @override
  Widget get closeIcon => const Icon(CupertinoIcons.xmark);

  @override
  Widget get navigateBackIcon => const Icon(CupertinoIcons.chevron_left);
}
