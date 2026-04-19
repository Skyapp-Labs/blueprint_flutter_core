import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/blueprint_theme.dart';

/// Concrete size tokens for the example app.
///
/// All computed values come from [FxSizes] defaults (ScreenUtil-scaled).
/// Only [copyWith] needs to be implemented to satisfy [ThemeExtension].
class AppSizes extends FxSizes {
  AppSizes();

  @override
  AppSizes copyWith() => AppSizes();
}
