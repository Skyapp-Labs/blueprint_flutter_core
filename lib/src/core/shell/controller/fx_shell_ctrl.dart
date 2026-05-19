import 'package:blueprint_flutter_core/src/core/shell/models/fx_pane.dart';
import 'package:blueprint_flutter_core/src/core/shell/state/fx_shell_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fx_shell_ctrl.g.dart';

@Riverpod(keepAlive: true)
class FxShellCtrl extends _$FxShellCtrl {
  @override
  FxShellState build() => const FxShellState();

  bool get canPop => state.canPopShell;

  bool pop() {
    if (!state.canPopShell) return false;

    final nextHistory = state.history.sublist(0, state.history.length - 1);
    final pane = state.paneByKey(nextHistory.last);

    state = state.copyWith(
      history: nextHistory,
      currentPane: pane,
    );

    return pane != null;
  }

  void goToPane(FxPane pane) {
    if (pane.isChromeOnly) return;

    final resolved = state.paneByKey(pane.key) ?? pane;
    if (resolved.builder == null && resolved.onPressed == null) return;

    final key = resolved.key;
    if (key == state.currentPane?.key) return;

    final nextHistory = state.history.isEmpty
        ? [key]
        : [...state.history, key];

    state = state.copyWith(
      currentPane: resolved,
      history: nextHistory,
    );
  }

  void syncFromWidget({
    required List<FxPane> dockPanes,
    List<FxPane> drawerPanes = const [],
    List<FxPane> endDrawerPanes = const [],
    required String initialPaneKey,
  }) {
    final merged = FxPane.mergeRegistry(
      dockPanes: dockPanes,
      drawerPanes: drawerPanes,
      endDrawerPanes: endDrawerPanes,
    );

    if (merged.isEmpty) {
      state = const FxShellState();
      return;
    }

    final registry = merged.values.toList();
    final initial = merged[state.currentPaneKey ?? initialPaneKey] ?? registry.first;

    state = FxShellState(
      dockPanes: List<FxPane>.unmodifiable(dockPanes),
      drawerPanes: List<FxPane>.unmodifiable(drawerPanes),
      endDrawerPanes: List<FxPane>.unmodifiable(endDrawerPanes),
      registry: List<FxPane>.unmodifiable(registry),
      currentPane: initial,
      history: [initial.key],
    );
  }
}