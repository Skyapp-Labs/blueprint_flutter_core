// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The shared authenticated [Dio] instance, owned by [AuthController].

@ProviderFor(dio)
final dioProvider = DioProvider._();

/// The shared authenticated [Dio] instance, owned by [AuthController].

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// The shared authenticated [Dio] instance, owned by [AuthController].
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'79c6513ce23c36395d2bf23fa4a26731f84bc5b0';

/// Bundles [Dio] + [ApiEndpoints] for use in all [AppService] subclasses.

@ProviderFor(serviceContext)
final serviceContextProvider = ServiceContextProvider._();

/// Bundles [Dio] + [ApiEndpoints] for use in all [AppService] subclasses.

final class ServiceContextProvider
    extends $FunctionalProvider<ServiceContext, ServiceContext, ServiceContext>
    with $Provider<ServiceContext> {
  /// Bundles [Dio] + [ApiEndpoints] for use in all [AppService] subclasses.
  ServiceContextProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serviceContextProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serviceContextHash();

  @$internal
  @override
  $ProviderElement<ServiceContext> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ServiceContext create(Ref ref) {
    return serviceContext(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServiceContext value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServiceContext>(value),
    );
  }
}

String _$serviceContextHash() => r'a1223e8bb7fb533786a2534a15309fddaf0eb2c6';
