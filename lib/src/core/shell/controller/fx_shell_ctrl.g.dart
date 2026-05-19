// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_shell_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FxShellCtrl)
final fxShellCtrlProvider = FxShellCtrlProvider._();

final class FxShellCtrlProvider
    extends $NotifierProvider<FxShellCtrl, FxShellState> {
  FxShellCtrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fxShellCtrlProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fxShellCtrlHash();

  @$internal
  @override
  FxShellCtrl create() => FxShellCtrl();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FxShellState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FxShellState>(value),
    );
  }
}

String _$fxShellCtrlHash() => r'ce0c6e969c298d9cc637f2cf595915580f30da90';

abstract class _$FxShellCtrl extends $Notifier<FxShellState> {
  FxShellState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FxShellState, FxShellState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FxShellState, FxShellState>,
              FxShellState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
