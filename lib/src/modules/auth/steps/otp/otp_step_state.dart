import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_step_state.freezed.dart';

@freezed
abstract class OtpStepState with _$OtpStepState {
  const factory OtpStepState({
    String? otp,
    String? resendToken,
    String? verificationId,
    @Default(false) bool isLoading,
    String? error,
  }) = _OtpStepState;
}