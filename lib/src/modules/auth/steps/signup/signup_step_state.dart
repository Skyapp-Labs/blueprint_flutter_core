import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_step_state.freezed.dart';

@freezed
abstract class SignupStepState with _$SignupStepState {
  const factory SignupStepState({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? fullNumber,
    String? gender,
    String? phone,
    String? countryCode,
    @Default(false) bool isLoading,
    String? error,
  }) = _SignupStepState;
}