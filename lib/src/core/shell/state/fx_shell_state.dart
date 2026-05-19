import 'package:blueprint_flutter_core/src/core/shell/models/fx_enum.dart';
import 'package:blueprint_flutter_core/src/core/shell/models/fx_pane.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fx_shell_state.freezed.dart';

@freezed
abstract class FxShellState with _$FxShellState {
  const factory FxShellState({
    FxPane? currentPane,
    @Default([]) List<FxPane> dockPanes,
    @Default([]) List<FxPane> drawerPanes,
    @Default([]) List<FxPane> endDrawerPanes,
    @Default([]) List<FxPane> registry,
    @Default([]) List<String> history,
  }) = _FxShellState;

  const FxShellState._();

  String? get currentPaneKey => history.isEmpty ? null : history.last;

  String? get previousPaneKey => history.elementAtOrNull(history.length - 2);

  /// Whether the the changing pane is pop forward or back.
  bool get isForward => true;

  bool get canPopShell => history.length > 1;

  FxPane? paneByKey(String key) {
    for (final p in registry) {
      if (p.key == key) return p;
    }
    return null;
  }

  List<FxPane> panesFor(FxSite site) => switch (site) {
        FxSite.dock => dockPanes,
        FxSite.drawer => drawerPanes,
        FxSite.endDrawer => endDrawerPanes,
      };

  bool hasSite(FxSite site) => panesFor(site).isNotEmpty;
}