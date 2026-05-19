import 'package:blueprint_flutter_core/src/core/shell/widgets/fx_shell_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/shell/models/fx_enum.dart';
import 'package:blueprint_flutter_core/src/core/shell/models/fx_pane.dart';
import 'package:blueprint_flutter_core/src/core/shell/widgets/fx_dock.dart';
import 'package:blueprint_flutter_core/src/core/shell/widgets/fx_drawer.dart';
import 'package:blueprint_flutter_core/src/core/shell/widgets/fx_shell_scope.dart';
import 'package:blueprint_flutter_core/src/core/shell/controller/fx_shell_ctrl.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';

/// Root layout for post-login **home / dashboard / main** flows.
///
/// Composes:
/// - [FxScaffold] (outer scaffold)
/// - Optional shared [FxAppBar] per [FxPane.showAppBar]
/// - [FxDock] bottom bar ([FxSite.dock])
/// - [FxDrawer] / end drawer ([FxSite.drawer], [FxSite.endDrawer])
/// - Body: active [FxPane.builder], switched with [AnimatedSwitcher]
///
/// State lives in [fxShellCtrlProvider] ([FxShellCtrl]). Panes are synced after
/// the first frame so Riverpod is not written during [build].
///
/// ### Nested scaffolds
///
/// If a pane uses its own `Scaffold` + `AppBar`, set [FxPane.showAppBar] to
/// `false` for that pane. The shell then sets `primary: false` on the outer
/// [FxScaffold] so the inner app bar receives correct status-bar padding.
///
/// ### Example
///
/// ```dart
/// FxShell(
///   initialPaneKey: 'home',
///   panes: [
///     FxPane(
///       key: 'home',
///       title: 'Home',
///       icon: FxPaneState.onlyActive(Icons.home),
///       sites: const [FxSite.dock],
///       builder: (_) => const HomeTab(),
///     ),
///     FxPane(
///       key: 'settings',
///       title: 'Settings',
///       showAppBar: false,
///       builder: (_) => SettingsScaffold(), // owns its own AppBar
///     ),
///   ],
/// )
/// ```
class FxShell extends ConsumerStatefulWidget {
  const FxShell({
    super.key,
    required this.initialPaneKey,
    this.dockPanes,
    this.drawerPanes,
    this.endDrawerPanes,
    this.bottomSheet,
    this.floatingActionButton,
    this.bodyAnimationBuilder,
    this.persistentFooterButtons,
    this.style = const FxShellStyle(),
  })  : assert(
        dockPanes != null || drawerPanes != null || endDrawerPanes != null,
        'dockPanes, drawerPanes, or endDrawerPanes must be provided',
      );

  /// [FxPane.key] to select on first sync.
  final String initialPaneKey;

  /// Panes for the dock. [FxSite.dock] and [FxSite.spacer]
  /// [FxSite.spacer] is used as a vertical gap in a dock.
  /// It is used to separate the panes in a dock.
  final List<FxPane>? dockPanes;

  /// Panes for the drawer. [FxSite.drawer] and [FxSite.stickyBottom]
  /// [FxSite.stickyBottom] is used as the last item in a drawer or end drawer list.
  /// It appears above the footer in a drawer or end drawer list.
  final List<FxPane>? drawerPanes;

  /// Panes for the end drawer. [FxSite.endDrawer] and [FxSite.stickyBottom]
  /// [FxSite.stickyBottom] is used as the last item in a drawer or end drawer list.
  /// It appears above the footer in a drawer or end drawer list.
  final List<FxPane>? endDrawerPanes;

  /// Shared app bar styling when [FxPane.showAppBar] is true.
  final FxShellStyle style;

  /// Animation builder for the body.
  final Widget Function(Widget, Animation<double>)? bodyAnimationBuilder;

  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;

  @override
  ConsumerState<FxShell> createState() => _FxShellState();
}


class _FxShellState extends ConsumerState<FxShell> with FxUiToolkit {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _assertPaneSites(widget.dockPanes, FxSite.dock, [FxPaneType.content, FxPaneType.spacer]);
    _assertPaneSites(widget.drawerPanes, FxSite.drawer, [FxPaneType.content, FxPaneType.stickyBottom, FxPaneType.divider]);
    _assertPaneSites(widget.endDrawerPanes, FxSite.endDrawer, [FxPaneType.content, FxPaneType.stickyBottom, FxPaneType.divider]);
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncPanes());
  }

  @override
  void didUpdateWidget(covariant FxShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_configChanged(oldWidget, widget)) return;
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncPanes());
  }

  static bool _configChanged(FxShell a, FxShell b) {
    if (a.initialPaneKey != b.initialPaneKey) return true;
    bool listsDiffer(List<FxPane>? x, List<FxPane>? y) {
      x ??= const [];
      y ??= const [];
      if (x.length != y.length) return true;
      for (var i = 0; i < x.length; i++) {
        if (x[i].key != y[i].key) return true;
      }
      return false;
    }
    return listsDiffer(a.dockPanes, b.dockPanes) ||
        listsDiffer(a.drawerPanes, b.drawerPanes) ||
        listsDiffer(a.endDrawerPanes, b.endDrawerPanes);
  }

  void _syncPanes() {
    if (!mounted) return;
    ref.read(fxShellCtrlProvider.notifier).syncFromWidget(
          dockPanes: widget.dockPanes ?? const [],
          drawerPanes: widget.drawerPanes ?? const [],
          endDrawerPanes: widget.endDrawerPanes ?? const [],
          initialPaneKey: widget.initialPaneKey,
        );
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);
    
    return FxShellScope(
      scaffoldKey: _scaffoldKey,
      hasDrawer: widget.drawerPanes?.isNotEmpty == true,
      hasEndDrawer: widget.endDrawerPanes?.isNotEmpty == true,
      canPopShell: ref.watch(fxShellCtrlProvider.select((s) => s.canPopShell)),
      popShell: ref.read(fxShellCtrlProvider.notifier).pop,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          final scope = FxShellScope.of(context);
          if (!scope.handleBack(context)) return scope.exitApp();
        },
        child: _buildBody()
      )
    );
  }

  Widget _buildBody() {
    final pane = ref.watch(fxShellCtrlProvider.select((s) => s.currentPane));
    final showDock = pane?.showDock == true && widget.dockPanes?.isNotEmpty == true;

    return FxScaffold(
      scaffoldKey: _scaffoldKey,
      style: widget.style.scaffoldStyle.copyWith(
        primary: pane?.showAppBar == true,
        padding: EdgeInsets.zero,
        safeArea: null,
        extendBody: pane?.extendBody == true,
      ),
      appBar: _appBar(pane),
      drawer: _drawer(pane),
      endDrawer: _endDrawer(pane),
      bottomNavigationBar: FxDock(
        style: widget.style.dockStyle,
        visible: showDock,
        onPanePressed: _onPaneTap,
      ),
      body: _buildContent(pane),
      floatingActionButtonLocation: widget.style.floatingActionButtonLocation,
      floatingActionButton: pane?.showFloatingActionButton == true ? widget.floatingActionButton : null,
      persistentFooterButtons: widget.persistentFooterButtons,
      bottomSheet: widget.bottomSheet,
    );
  }

  Widget _buildContent(FxPane? pane) {
    if (pane?.builder == null) return const SizedBox.shrink();
    
    return AnimatedSwitcher(
      duration: widget.style.animationDuration,
      transitionBuilder: widget.bodyAnimationBuilder ?? transitionBuilder,
      child: KeyedSubtree(
        key: ValueKey<String>(pane!.key),
        child: pane.builder!(context, pane),
      ),
    );
  }

  PreferredSizeWidget? _appBar(FxPane? pane) {
    if ((pane?.showAppBar ?? false) == false) return null;
    return FxAppBar.fromStyle(widget.style.appBarStyle, title: pane?.title);
  }

  Widget? _drawer(FxPane? pane) {
    final showDrawer = pane?.showDrawer == true && widget.drawerPanes?.isNotEmpty == true;
    if (!showDrawer) return null;

    return FxDrawer(
      style: widget.style.drawerStyle,
      onPanePressed: (p) => _onPaneTap(p, closeDrawer: true),
    );
  }

  Widget? _endDrawer(FxPane? pane) {
    final showEndDrawer = pane?.showEndDrawer == true && widget.endDrawerPanes?.isNotEmpty == true;

    if (!showEndDrawer) return null;

    return FxDrawer.end(
      style: widget.style.endDrawerStyle,
      onPanePressed: (p) => _onPaneTap(p, closeDrawer: true),
    );
  }

  void _assertPaneSites(List<FxPane>? panes, FxSite site, List<FxPaneType> expectedTypes) {
    if (panes?.isEmpty == true) return;

    String getName(String name) => 'FxPane.$name';

    final siteStr = getName(site.name);
    final paneGroupName = '${site.name}Panes';
    final expectedTypesStr = expectedTypes
      .where((e) => e != FxPaneType.content)
      .map((e) => getName(e.name)).join(', ');

    for (final p in (panes ?? <FxPane>[])) {
      final condition = expectedTypes.contains(p.type) && p.site == site;

      if(condition) continue;
      
      final paneSiteName = p.isChromeOnly ? getName(p.type.name) : getName(p.site.name);
      
      assert(
        condition,
        '\n\nCANNOT ADD PANE: $paneSiteName in $paneGroupName because $paneGroupName only supports: \n[$siteStr, $expectedTypesStr]\n',
      );
    }
  }

  void _onPaneTap(FxPane pane, {bool closeDrawer = false}) {
    final handler = pane.onPressed;

    if (pane.isChromeOnly) {
      handler?.call(context, pane);
      return;
    }

    if (closeDrawer && canPop) Navigator.of(context).pop();
    
    if (handler != null) return handler(context, pane);

    ref.read(fxShellCtrlProvider.notifier).goToPane(pane);
  }

  Widget transitionBuilder(Widget child, Animation<double> animation) {
    final isForward = ref.read(fxShellCtrlProvider.select((s) => s.isForward));
    return SlideTransition(
      position: Tween<Offset>(
        begin: isForward ? const Offset(1, 0) : const Offset(-1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
      child: child,
    );
  }
}
