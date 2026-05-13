// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_theme_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FxThemeController)
final fxThemeControllerProvider = FxThemeControllerProvider._();

final class FxThemeControllerProvider
    extends $NotifierProvider<FxThemeController, ThemeMode> {
  FxThemeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fxThemeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fxThemeControllerHash();

  @$internal
  @override
  FxThemeController create() => FxThemeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$fxThemeControllerHash() => r'3e5e660aebcd026896bb36a94e75ef903b1802f3';

abstract class _$FxThemeController extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
