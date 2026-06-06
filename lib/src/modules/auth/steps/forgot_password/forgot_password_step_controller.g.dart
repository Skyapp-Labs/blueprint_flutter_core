// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_step_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ForgotPasswordStepController)
final forgotPasswordStepControllerProvider =
    ForgotPasswordStepControllerProvider._();

final class ForgotPasswordStepControllerProvider
    extends
        $NotifierProvider<
          ForgotPasswordStepController,
          ForgotPasswordStepState
        > {
  ForgotPasswordStepControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'forgotPasswordStepControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$forgotPasswordStepControllerHash();

  @$internal
  @override
  ForgotPasswordStepController create() => ForgotPasswordStepController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ForgotPasswordStepState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ForgotPasswordStepState>(value),
    );
  }
}

String _$forgotPasswordStepControllerHash() =>
    r'b114849a751ec567ba68d8362ed09a07b1448dd4';

abstract class _$ForgotPasswordStepController
    extends $Notifier<ForgotPasswordStepState> {
  ForgotPasswordStepState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<ForgotPasswordStepState, ForgotPasswordStepState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ForgotPasswordStepState, ForgotPasswordStepState>,
              ForgotPasswordStepState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
