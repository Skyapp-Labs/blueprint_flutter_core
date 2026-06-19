import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/blueprint_widgets.dart';

// ─────────────────────────────────────────────
// DEV ZONE — Replace this screen with your own UI.
// ─────────────────────────────────────────────
class AppDockStyle with FxUiToolkit {

  AppDockStyle._(BuildContext context) {
    setToolkitContext(context);
  }

   static FxDockStyle build(BuildContext context) => AppDockStyle._(context).create();

  FxDockStyle create() => FxDockStyle(
    spacing: 0,
    tileStyle: _tileStyle,
    notchShape: CircularNotchedRectangle(),
    notchMargin: sizes.sm,
    shadowColor: Colors.black,
    clipBehavior: Clip.antiAlias,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
  );

  Color get activeColor => colors.textPrimary;
  Color get inactiveColor => colors.textPrimary.withValues(alpha: 0.4);

  Color _color(bool active) => active
    ? activeColor
    : inactiveColor;

  double _textSize(bool active) => active
    ? sizes.textMd
    : sizes.textSm;

  double _iconSize(bool active) => active
    ? sizes.lg
    : sizes.lg * .9;

  FontWeight _fontWeight(bool active) => active
    ? FontWeight.w500
    : FontWeight.w400;

  TextStyle _textStyle(bool active) => typography.bodyLarge.copyWith(
    color: _color(active),
    fontSize: _textSize(active),
    fontWeight: _fontWeight(active),
  );

  FxRowTileStyle get _tileStyle => FxRowTileStyle(
    iconSize: _iconSize,
    iconColor: _color,
    textStyle: _textStyle,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
  );
}
