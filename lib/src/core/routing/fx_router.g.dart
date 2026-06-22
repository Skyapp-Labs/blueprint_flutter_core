// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Foundation [GoRouter] with auth and home-access listeners and redirects.
///
/// Apps supply routes via [fxAppRoutesProvider] and optional hooks via
/// [fxExtraHomeAccessStepsProvider] / [fxRouterRedirectHookProvider].

@ProviderFor(fxRouter)
final fxRouterProvider = FxRouterProvider._();

/// Foundation [GoRouter] with auth and home-access listeners and redirects.
///
/// Apps supply routes via [fxAppRoutesProvider] and optional hooks via
/// [fxExtraHomeAccessStepsProvider] / [fxRouterRedirectHookProvider].

final class FxRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Foundation [GoRouter] with auth and home-access listeners and redirects.
  ///
  /// Apps supply routes via [fxAppRoutesProvider] and optional hooks via
  /// [fxExtraHomeAccessStepsProvider] / [fxRouterRedirectHookProvider].
  FxRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fxRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fxRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return fxRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$fxRouterHash() => r'0f11987287dacdaec0ead91583acf8e698146935';
