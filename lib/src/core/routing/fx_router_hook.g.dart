// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_router_hook.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Override to add app-specific redirects after [FxRouterRedirect.resolve].

@ProviderFor(fxRouterRedirectHook)
final fxRouterRedirectHookProvider = FxRouterRedirectHookProvider._();

/// Override to add app-specific redirects after [FxRouterRedirect.resolve].

final class FxRouterRedirectHookProvider
    extends
        $FunctionalProvider<
          FxRouterRedirectHook?,
          FxRouterRedirectHook?,
          FxRouterRedirectHook?
        >
    with $Provider<FxRouterRedirectHook?> {
  /// Override to add app-specific redirects after [FxRouterRedirect.resolve].
  FxRouterRedirectHookProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fxRouterRedirectHookProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fxRouterRedirectHookHash();

  @$internal
  @override
  $ProviderElement<FxRouterRedirectHook?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FxRouterRedirectHook? create(Ref ref) {
    return fxRouterRedirectHook(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FxRouterRedirectHook? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FxRouterRedirectHook?>(value),
    );
  }
}

String _$fxRouterRedirectHookHash() =>
    r'f02ea99a74bbbcac382e857e66117ced9a1dee15';
