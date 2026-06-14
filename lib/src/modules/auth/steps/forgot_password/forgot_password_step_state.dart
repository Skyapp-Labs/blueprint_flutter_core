import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_step_state.freezed.dart';

@freezed
abstract class ForgotPasswordStepState with _$ForgotPasswordStepState {
  const factory ForgotPasswordStepState({
    String? email,
    @Default(false) bool isLoading,
    String? error,
  }) = _ForgotPasswordStepState;
}