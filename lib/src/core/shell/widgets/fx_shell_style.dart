import 'package:easy_copy_with_annotation/easy_copy_with_annotation.dart';
import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/shell/models/fx_pane.dart';
import 'package:blueprint_flutter_core/src/core/shell/widgets/fx_dock.dart';
import 'package:blueprint_flutter_core/src/core/shell/widgets/fx_drawer.dart';

import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';

part 'fx_shell_style.g.dart';

@CopyWith()
class FxShellStyle {
  const FxShellStyle({
    this.dockStyle = const FxDockStyle(),
    this.appBarStyle = const FxAppBarStyle(),
    this.drawerStyle = const FxDrawerStyle(),
    this.scaffoldStyle = const FxScaffoldStyle(),
    this.endDrawerStyle = const FxDrawerStyle(),
    this.animationDuration = const Duration(milliseconds: 300),
    this.floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked,
  });

  /// Shared app bar styling when [FxPane.showAppBar] is true.
  final FxAppBarStyle appBarStyle;

  /// Bottom dock styling.
  final FxDockStyle dockStyle;

  /// Start drawer styling.
  final FxDrawerStyle drawerStyle;

  /// End drawer styling.
  final FxDrawerStyle endDrawerStyle;

  /// Outer [FxScaffold] options (padding is forced to zero on the body).
  final FxScaffoldStyle scaffoldStyle;

  /// Animation duration for the body.
  final Duration animationDuration;

  /// Location of the floating action button.
  final FloatingActionButtonLocation floatingActionButtonLocation;
}
