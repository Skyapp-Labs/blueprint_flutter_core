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
    r'd64f26e5e8e1ccd92fa09b6897122a991f7c8267';

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
