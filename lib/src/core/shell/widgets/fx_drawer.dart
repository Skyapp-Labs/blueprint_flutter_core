import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/shell/models/fx_enum.dart';
import 'package:blueprint_flutter_core/src/core/shell/models/fx_pane.dart';
import 'package:blueprint_flutter_core/src/core/shell/widgets/fx_drawer_style.dart';
import 'package:blueprint_flutter_core/src/core/shell/controller/fx_shell_ctrl.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';

export 'fx_drawer_style.dart';

/// Material [Drawer] listing panes on [FxSite.drawer].
///
/// Use [FxDrawer.end] for the end drawer ([FxSite.endDrawer]).
class FxDrawer extends ConsumerWidget with FxUiToolkit {
  
  FxDrawer({
    super.key,
    required this.onPanePressed,
    this.style = const FxDrawerStyle(),
  }) : site = FxSite.drawer;

  FxDrawer.end({
    super.key,
    required this.onPanePressed,
    this.style = const FxDrawerStyle(),
  }) : site = FxSite.endDrawer;

  final FxSite site;
  final FxDrawerStyle style;
  final void Function(FxPane pane) onPanePressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    setToolkitContext(context);

    final shellCtrl = ref.watch(fxShellCtrlProvider.select((s) => (
      items: site == FxSite.drawer ? s.drawerPanes : s.endDrawerPanes, 
      activeKey: s.currentPane?.key
    )));

    final sticky = shellCtrl.items.where(
      (p) => p.type == FxPaneType.stickyBottom
    ).toList();
    final scrollable = shellCtrl.items.where(
      (p) => p.type != FxPaneType.stickyBottom
    ).toList();

    return Drawer(
      width: style.width ?? screenWidth * 0.75,
      elevation: style.elevation,
      backgroundColor: style.backgroundColor ?? theme.scaffoldBackgroundColor,
      surfaceTintColor: style.surfaceTintColor,
      shadowColor: style.shadowColor ?? colors.shadow,
      shape: style.shape,
      child: SafeArea(
        left: style.safeArea.left,
        top: style.safeArea.top,
        right: style.safeArea.right,
        bottom: style.safeArea.bottom,
        minimum: style.safeArea.minimum,
        maintainBottomViewPadding: style.safeArea.maintainBottomViewPadding,
        child: _buildListView(
          scrollable,
          header: style.headerBuilder?.call(context),
          isScrollable: true,
          footer: _buildFooter(
            sticky, 
            style.footerBuilder?.call(context), 
            shellCtrl.activeKey
          ),
          activeKey: shellCtrl.activeKey,
        )
      ),
    );
  }

  Widget _buildFooter(List<FxPane> panes, Widget? footer, String? activeKey) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _buildListView(
        panes,
        isScrollable: false,
        activeKey: activeKey,
      ),
      ?footer,
    ],
  );

  Widget _buildListView(List<FxPane> panes, {
    String? activeKey,
    Widget? header,
    Widget? footer,
    bool isScrollable = true,
  }) => FxTileView<FxPane>(
    tiles: panes,
    header: header,
    footer: footer,
    physics: isScrollable ? style.physics : const NeverScrollableScrollPhysics(),
    padding: style.padding,
    primary: true,
    tileStyle: style.tileStyle,
    activeKey: activeKey,
    shrinkWrap: isScrollable ? style.shrinkWrap : true,
    onTilePressed: onPanePressed,
    tileBuilder: (pane, isActive, onPressed) {
      if(pane.isChromeOnly) return pane.buildDividerWidget();
      return style.tileBuilder?.call(pane, isActive, onPressed);
    },
    separatorBuilder: (_, index) {
      final nextPane = panes.elementAtOrNull(index + 1);
      final currentPane = panes.elementAt(index);

      if(nextPane == null || nextPane.isChromeOnly || currentPane.isChromeOnly) {
        return SizedBox.shrink();
      }

      return style.separatorBuilder;
    }
  );
}
