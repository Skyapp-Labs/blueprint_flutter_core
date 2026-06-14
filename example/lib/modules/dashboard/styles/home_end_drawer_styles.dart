import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/blueprint_widgets.dart';
import 'package:example/modules/dashboard/styles/home_drawer_style.dart';

// ─────────────────────────────────────────────
// DEV ZONE — Replace this screen with your own UI.
// ─────────────────────────────────────────────
class AppEndDrawerStyle with FxUiToolkit {

  final BuildContext context;

  AppEndDrawerStyle._(this.context) {
    setToolkitContext(context);
  }

  static FxDrawerStyle build(BuildContext context) => AppEndDrawerStyle._(context).create();

  FxDrawerStyle create() => AppDrawerStyle.build(context).copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
      topRight: Radius.circular(sizes.md),
      bottomRight: Radius.circular(sizes.md),
    ))
  );
}
