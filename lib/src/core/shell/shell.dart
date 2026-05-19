/// App shell for home / dashboard / main navigation after sign-in.
///
/// ## Concepts
///
/// | Type | Role |
/// |------|------|
/// | [FxShell] | Root widget: scaffold + body + chrome |
/// | [FxPane] | One destination (body + optional dock/drawer row) |
/// | [FxSite] | Where a pane appears: dock, drawer, endDrawer |
/// | [FxShellCtrl] | Riverpod notifier: current pane + registry |
/// | [fxShellCtrlProvider] | Global provider (`keepAlive`) |
/// | [FxDock] | Bottom [BottomAppBar] for [FxSite.dock] |
/// | [FxDrawer] | Side drawer(s) for drawer / endDrawer sites |
/// | [FxPaneState] | Active vs inactive value (icon, color, …) |
///
/// ## Quick start
///
/// ```dart
/// import 'package:blueprint_flutter_core/blueprint_widgets.dart';
///
/// FxShell(
///   initialPaneKey: 'home',
///   panes: [
///     FxPane(
///       key: 'home',
///       title: 'Home',
///       icon: FxPaneState.onlyActive(Icons.home_outlined),
///       sites: const [FxSite.dock, FxSite.drawer],
///       builder: (context) => const HomePage(),
///     ),
///   ],
/// )
/// ```
///
/// ## File layout
///
/// - `models/` — [FxPane], [FxSite], [FxPaneType], [FxPaneState]
/// - `state/` — [FxShellState] (Freezed)
/// - `controller/` — [FxShellCtrl]
/// - `widgets/` — [FxShell], [FxDock], [FxDrawer], styles, body, items
///
/// | File | Role |
/// |------|------|
/// | `fx_shell.dart` | Root host |
/// | `fx_dock.dart` / `fx_dock_style.dart` / `fx_dock_item.dart` | Bottom bar |
/// | `fx_drawer.dart` / `fx_drawer_style.dart` / `fx_drawer_body.dart` / `fx_drawer_item.dart` | Drawers |
///
/// Related: [FxReveal] / [FxRevealPreferred] in `widgets/display/` for
/// animated show/hide of chrome.
library;

export 'models/fx_enum.dart';
export 'models/fx_pane.dart';
export 'models/fx_pane_divider_style.dart';

export 'state/fx_shell_state.dart';
export 'controller/fx_shell_ctrl.dart';

export 'widgets/fx_dock.dart';
export 'widgets/fx_drawer.dart';
export 'widgets/fx_shell.dart';
export 'widgets/fx_shell_style.dart';
export 'widgets/fx_shell_scope.dart';
