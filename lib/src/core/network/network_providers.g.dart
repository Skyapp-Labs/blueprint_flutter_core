// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The shared authenticated [Dio] instance, owned by [AuthController].

@ProviderFor(fxDio)
final fxDioProvider = FxDioProvider._();

/// The shared authenticated [Dio] instance, owned by [AuthController].

final class FxDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// The shared authenticated [Dio] instance, owned by [AuthController].
  FxDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fxDioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fxDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return fxDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$fxDioHash() => r'c0b39e553624aa173d4df2b53db807aaa3e5514e';

/// Bundles [Dio] + [ApiEndpoints] for use in all [AppService] subclasses.

@ProviderFor(fxService)
final fxServiceProvider = FxServiceProvider._();

/// Bundles [Dio] + [ApiEndpoints] for use in all [AppService] subclasses.

final class FxServiceProvider
    extends
        $FunctionalProvider<
          FxServiceContext,
          FxServiceContext,
          FxServiceContext
        >
    with $Provider<FxServiceContext> {
  /// Bundles [Dio] + [ApiEndpoints] for use in all [AppService] subclasses.
  FxServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fxServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fxServiceHash();

  @$internal
  @override
  $ProviderElement<FxServiceContext> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FxServiceContext create(Ref ref) {
    return fxService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FxServiceContext value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FxServiceContext>(value),
    );
  }
}

String _$fxServiceHash() => r'75dda84beccf24f42da2f1f81b4da933d20846b4';
