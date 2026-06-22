// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_step_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OtpStepController)
final otpStepControllerProvider = OtpStepControllerProvider._();

final class OtpStepControllerProvider
    extends $NotifierProvider<OtpStepController, OtpStepState> {
  OtpStepControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'otpStepControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$otpStepControllerHash();

  @$internal
  @override
  OtpStepController create() => OtpStepController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OtpStepState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OtpStepState>(value),
    );
  }
}

String _$otpStepControllerHash() => r'93d9fdf5c60f00c99903efc5eda16f37090a9371';

abstract class _$OtpStepController extends $Notifier<OtpStepState> {
  OtpStepState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OtpStepState, OtpStepState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OtpStepState, OtpStepState>,
              OtpStepState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
