// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_config.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Override in main.dart with your [FxConfig] implementation.

@ProviderFor(fxConfig)
final fxConfigProvider = FxConfigProvider._();

/// Override in main.dart with your [FxConfig] implementation.

final class FxConfigProvider
    extends $FunctionalProvider<FxConfig, FxConfig, FxConfig>
    with $Provider<FxConfig> {
  /// Override in main.dart with your [FxConfig] implementation.
  FxConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fxConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fxConfigHash();

  @$internal
  @override
  $ProviderElement<FxConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FxConfig create(Ref ref) {
    return fxConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FxConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FxConfig>(value),
    );
  }
}

String _$fxConfigHash() => r'8979868cf960ee87e6e3939187627ad80e359e8c';
