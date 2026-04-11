// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_auth_flow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhoneAuthFlowController)
final phoneAuthFlowControllerProvider = PhoneAuthFlowControllerProvider._();

final class PhoneAuthFlowControllerProvider
    extends $NotifierProvider<PhoneAuthFlowController, PhoneAuthFlowState> {
  PhoneAuthFlowControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'phoneAuthFlowControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$phoneAuthFlowControllerHash();

  @$internal
  @override
  PhoneAuthFlowController create() => PhoneAuthFlowController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhoneAuthFlowState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhoneAuthFlowState>(value),
    );
  }
}

String _$phoneAuthFlowControllerHash() =>
    r'580ac21aae21aaf0b0b96b8be57247387d2066bb';

abstract class _$PhoneAuthFlowController extends $Notifier<PhoneAuthFlowState> {
  PhoneAuthFlowState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PhoneAuthFlowState, PhoneAuthFlowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PhoneAuthFlowState, PhoneAuthFlowState>,
              PhoneAuthFlowState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
