import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_flow_state.freezed.dart';

enum ForgotPasswordStep { enterEmail, verifyPin, newPassword }

@freezed
abstract class ForgotPasswordFlowState with _$ForgotPasswordFlowState {
  const factory ForgotPasswordFlowState({
    @Default(ForgotPasswordStep.enterEmail) ForgotPasswordStep step,
    /// The email entered in step 1, carried into step 2 for display.
    String? email,
    /// The reset token received after pin verification, used in step 3.
    String? resetToken,
    @Default(false) bool isLoading,
    String? error,
  }) = _ForgotPasswordFlowState;
}
