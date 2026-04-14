import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:blueprint_flutter_core/src/modules/auth/core/controllers/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/email_auth/controllers/forgot_password_flow_state.dart';

part 'forgot_password_flow_controller.g.dart';

/// Manages the 3-step forgot password flow:
///   1. [ForgotPasswordStep.enterEmail]  — user submits their email
///   2. [ForgotPasswordStep.verifyPin]   — user enters the PIN sent to their email
///   3. [ForgotPasswordStep.newPassword] — user sets a new password
///
/// Delegates all API calls to [authControllerProvider].
@riverpod
class ForgotPasswordFlowController extends _$ForgotPasswordFlowController {
  @override
  ForgotPasswordFlowState build() => const ForgotPasswordFlowState();

  /// Step 1: Send reset PIN to [email]. Advances to [ForgotPasswordStep.verifyPin] on success.
  Future<void> sendResetPin(String email) async {
    state = state.copyWith(isLoading: true, error: null);
    final success = await ref
        .read(authControllerProvider.notifier)
        .forgotPassword(email);

    if (success) {
      state = state.copyWith(
        isLoading: false,
        email: email,
        step: ForgotPasswordStep.verifyPin,
      );
    } else {
      final error = ref.read(authControllerProvider).error ?? 'Failed to send reset code.';
      state = state.copyWith(isLoading: false, error: error);
    }
  }

  /// Step 2: Verify the [pin] sent to the user's email.
  /// On success, stores [resetToken] and advances to [ForgotPasswordStep.newPassword].
  Future<void> verifyPin(String pin) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // Exchange the PIN for a reset token via the auth service.
      // The token is used in step 3 to authorise the password update.
      // TODO: wire to actual API endpoint when available (e.g. POST /auth/verify-reset-pin).
      state = state.copyWith(
        isLoading: false,
        resetToken: pin, // Replace with actual token from API response.
        step: ForgotPasswordStep.newPassword,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false, error: 'Invalid or expired code.');
    }
  }

  /// Step 3: Reset the password using the [newPassword] and stored [resetToken].
  Future<bool> resetPassword(String newPassword) async {
    state = state.copyWith(isLoading: true, error: null);
    final success = await ref
        .read(authControllerProvider.notifier)
        .resetPassword(token: state.resetToken!, newPassword: newPassword);

    if (success) {
      state = state.copyWith(isLoading: false);
      return true;
    } else {
      final error = ref.read(authControllerProvider).error ?? 'Failed to reset password.';
      state = state.copyWith(isLoading: false, error: error);
      return false;
    }
  }

  /// Navigate back one step.
  void goBack() {
    switch (state.step) {
      case ForgotPasswordStep.verifyPin:
        state = state.copyWith(step: ForgotPasswordStep.enterEmail, error: null);
      case ForgotPasswordStep.newPassword:
        state = state.copyWith(step: ForgotPasswordStep.verifyPin, error: null);
      case ForgotPasswordStep.enterEmail:
        break;
    }
  }
}
