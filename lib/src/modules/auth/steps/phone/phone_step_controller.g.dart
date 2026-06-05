// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_step_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhoneStepController)
final phoneStepControllerProvider = PhoneStepControllerProvider._();

final class PhoneStepControllerProvider
    extends $NotifierProvider<PhoneStepController, PhoneStepState> {
  PhoneStepControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'phoneStepControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$phoneStepControllerHash();

  @$internal
  @override
  PhoneStepController create() => PhoneStepController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhoneStepState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhoneStepState>(value),
    );
  }
}

String _$phoneStepControllerHash() =>
    r'0a30ceae4410f622448ab4b03963ed18eddcc473';

abstract class _$PhoneStepController extends $Notifier<PhoneStepState> {
  PhoneStepState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PhoneStepState, PhoneStepState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PhoneStepState, PhoneStepState>,
              PhoneStepState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
