// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_app_routes.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// App route tree supplied by the host application.
///
/// Override in [BlueprintFlutterCore.overrides]:
/// ```dart
/// fxAppRoutesProvider.overrideWith(
///   (ref) => appRoutes(ref.read(fxConfigProvider)),
/// ),
/// ```

@ProviderFor(fxAppRoutes)
final fxAppRoutesProvider = FxAppRoutesProvider._();

/// App route tree supplied by the host application.
///
/// Override in [BlueprintFlutterCore.overrides]:
/// ```dart
/// fxAppRoutesProvider.overrideWith(
///   (ref) => appRoutes(ref.read(fxConfigProvider)),
/// ),
/// ```

final class FxAppRoutesProvider
    extends
        $FunctionalProvider<List<RouteBase>, List<RouteBase>, List<RouteBase>>
    with $Provider<List<RouteBase>> {
  /// App route tree supplied by the host application.
  ///
  /// Override in [BlueprintFlutterCore.overrides]:
  /// ```dart
  /// fxAppRoutesProvider.overrideWith(
  ///   (ref) => appRoutes(ref.read(fxConfigProvider)),
  /// ),
  /// ```
  FxAppRoutesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fxAppRoutesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fxAppRoutesHash();

  @$internal
  @override
  $ProviderElement<List<RouteBase>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<RouteBase> create(Ref ref) {
    return fxAppRoutes(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RouteBase> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RouteBase>>(value),
    );
  }
}

String _$fxAppRoutesHash() => r'197f12cc7fa1d89cbdcdb550f67fbc69799d4616';
