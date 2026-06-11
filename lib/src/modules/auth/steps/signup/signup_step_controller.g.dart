// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_step_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignupStepController)
final signupStepControllerProvider = SignupStepControllerProvider._();

final class SignupStepControllerProvider
    extends $NotifierProvider<SignupStepController, SignupStepState> {
  SignupStepControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signupStepControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signupStepControllerHash();

  @$internal
  @override
  SignupStepController create() => SignupStepController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignupStepState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignupStepState>(value),
    );
  }
}

String _$signupStepControllerHash() =>
    r'853d272e297389390594f0457e6448cb5f20592e';

abstract class _$SignupStepController extends $Notifier<SignupStepState> {
  SignupStepState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SignupStepState, SignupStepState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignupStepState, SignupStepState>,
              SignupStepState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
