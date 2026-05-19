import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/shell/models/fx_enum.dart';
import 'package:blueprint_flutter_core/src/core/shell/models/fx_pane.dart';
import 'package:blueprint_flutter_core/src/core/shell/widgets/fx_dock.dart';
import 'package:blueprint_flutter_core/src/core/shell/controller/fx_shell_ctrl.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';

export 'fx_dock_style.dart';

/// Bottom dock for [FxSite.dock] panes; hosts [FxBottomNav].
///
/// Parent should hide this when [FxShell] has no dock panes.
class FxDock extends ConsumerWidget with FxUiToolkit {
  FxDock({
    super.key,
    required this.onPanePressed,
    this.style = const FxDockStyle(),
    this.visible = true,
  });

  final bool visible;
  final FxDockStyle style;
  final void Function(FxPane pane) onPanePressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final shell = ref.watch(
      fxShellCtrlProvider.select(
        (s) => (panes: s.dockPanes, activeKey: s.currentPane?.key),
      ),
    );

    return AnimatedSwitcher(
      duration: style.animationDuration,
      transitionBuilder: style.animationBuilder,
      child: !visible 
        ? const SizedBox.shrink(key: ValueKey<String>('dock_hidden'))
        : _buildBottomAppBar(shell.panes, shell.activeKey)
    );
  }

  Widget _buildBottomAppBar(List<FxPane> panes, String? activeKey) => BottomAppBar(
    key: ValueKey<String>('dock_visible'),
    padding: style.padding,
    elevation: style.elevation,
    shape: style.notchShape,
    clipBehavior: style.clipBehavior,
    notchMargin: style.notchMargin,
    surfaceTintColor: style.surfaceTintColor,
    shadowColor: style.shadowColor,
    height: style.height,
    color: style.backgroundColor,
    child: _buildRow(panes, activeKey)
  );

  Widget _buildRow(List<FxPane> panes, String? activeKey) => FxTileView.row(
    tiles: panes,
    style: style.tileStyle,
    spacing: style.spacing,
    activeKey: activeKey,
    mainAxisSize: style.mainAxisSize,
    onTilePressed: onPanePressed,
    mainAxisAlignment: style.mainAxisAlignment,
    crossAxisAlignment: style.crossAxisAlignment,
    tileBuilder: (pane, isActive, onPressed) {
      if (pane.isChromeOnly == true) return SizedBox.shrink();
      return style.itemBuilder?.call(pane, isActive, onPressed);
    }
  );
}