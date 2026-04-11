// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_flow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the 3-step forgot password flow:
///   1. [ForgotPasswordStep.enterEmail]  — user submits their email
///   2. [ForgotPasswordStep.verifyPin]   — user enters the PIN sent to their email
///   3. [ForgotPasswordStep.newPassword] — user sets a new password
///
/// Delegates all API calls to [authControllerProvider].

@ProviderFor(ForgotPasswordFlowController)
final forgotPasswordFlowControllerProvider =
    ForgotPasswordFlowControllerProvider._();

/// Manages the 3-step forgot password flow:
///   1. [ForgotPasswordStep.enterEmail]  — user submits their email
///   2. [ForgotPasswordStep.verifyPin]   — user enters the PIN sent to their email
///   3. [ForgotPasswordStep.newPassword] — user sets a new password
///
/// Delegates all API calls to [authControllerProvider].
final class ForgotPasswordFlowControllerProvider
    extends
        $NotifierProvider<
          ForgotPasswordFlowController,
          ForgotPasswordFlowState
        > {
  /// Manages the 3-step forgot password flow:
  ///   1. [ForgotPasswordStep.enterEmail]  — user submits their email
  ///   2. [ForgotPasswordStep.verifyPin]   — user enters the PIN sent to their email
  ///   3. [ForgotPasswordStep.newPassword] — user sets a new password
  ///
  /// Delegates all API calls to [authControllerProvider].
  ForgotPasswordFlowControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'forgotPasswordFlowControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$forgotPasswordFlowControllerHash();

  @$internal
  @override
  ForgotPasswordFlowController create() => ForgotPasswordFlowController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ForgotPasswordFlowState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ForgotPasswordFlowState>(value),
    );
  }
}

String _$forgotPasswordFlowControllerHash() =>
    r'def3507b0b1801d5f7e7aa843b58986ae9d988ca';

/// Manages the 3-step forgot password flow:
///   1. [ForgotPasswordStep.enterEmail]  — user submits their email
///   2. [ForgotPasswordStep.verifyPin]   — user enters the PIN sent to their email
///   3. [ForgotPasswordStep.newPassword] — user sets a new password
///
/// Delegates all API calls to [authControllerProvider].

abstract class _$ForgotPasswordFlowController
    extends $Notifier<ForgotPasswordFlowState> {
  ForgotPasswordFlowState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<ForgotPasswordFlowState, ForgotPasswordFlowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ForgotPasswordFlowState, ForgotPasswordFlowState>,
              ForgotPasswordFlowState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
