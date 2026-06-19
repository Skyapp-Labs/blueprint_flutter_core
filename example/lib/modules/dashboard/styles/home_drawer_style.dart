import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/blueprint_widgets.dart';

// ─────────────────────────────────────────────
// DEV ZONE — Replace this screen with your own UI.
// ─────────────────────────────────────────────
class AppDrawerStyle with FxUiToolkit {

  AppDrawerStyle._(BuildContext context) {
    setToolkitContext(context);
  }

  static FxDrawerStyle build(BuildContext context) => AppDrawerStyle._(context).create();

  FxDrawerStyle create() => FxDrawerStyle(
    elevation: 4,
    backgroundColor: colors.surface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
      topRight: Radius.circular(sizes.md),
      bottomRight: Radius.circular(sizes.md),
    )),
    headerBuilder: (_) => DrawerHeader(
      decoration: BoxDecoration(color: colors.primary),
      child: Text('Drawer Header', style: typography.bodyLarge.copyWith(
        color: colors.onPrimary
      )),
    ),
    separatorBuilder: Divider(
      color: colors.outline,
      height: 1,
      thickness: 1,
    ),
    tileStyle: FxTileStyle(
      padding: EdgeInsets.symmetric(horizontal: sizes.md),
      iconSize: (isActive) => sizes.lg,
      backgroundColor: (active) => active ? colors.primary.withValues(alpha: .5) : Colors.transparent,
      iconColor: (active) => active ? colors.onPrimary : colors.textPrimary,
      textStyle: (isActive) => typography.bodyLarge.copyWith(
        color: isActive ? colors.onPrimary : colors.textPrimary,
        fontSize: isActive ? sizes.textMd : sizes.textSm,
        fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
      ),
    )
  );
}
