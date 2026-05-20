// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_notification_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FxNotificationController)
final fxNotificationControllerProvider = FxNotificationControllerProvider._();

final class FxNotificationControllerProvider
    extends $NotifierProvider<FxNotificationController, FxNotificationsState> {
  FxNotificationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fxNotificationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fxNotificationControllerHash();

  @$internal
  @override
  FxNotificationController create() => FxNotificationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FxNotificationsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FxNotificationsState>(value),
    );
  }
}

String _$fxNotificationControllerHash() =>
    r'a8e81fdf1983ef5611477a47594c6ff440f84bd5';

abstract class _$FxNotificationController
    extends $Notifier<FxNotificationsState> {
  FxNotificationsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FxNotificationsState, FxNotificationsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FxNotificationsState, FxNotificationsState>,
              FxNotificationsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
