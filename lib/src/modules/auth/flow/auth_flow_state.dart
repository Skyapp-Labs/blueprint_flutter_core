import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_step.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/responses/send_otp_response.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/responses/verify_otp_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_flow_state.freezed.dart';

enum AuthFlowType {
  login,
  register,
  forgotPassword,
}

/// Immutable snapshot of the current auth session.
@freezed
abstract class AuthFlowState with _$AuthFlowState {
  const factory AuthFlowState({
    @Default(AuthFlowType.login) AuthFlowType type,
    @Default(AuthStep.emailAndPassword) AuthStep step,
    @Default(null) AuthStep? previousStep,
    String? phone,
    String? email,
    String? countryCode,
    String? formattedPhone,
    SendOtpResponse? sendOtpResponse,
    VerifyOtpResponse? verifyOtpResponse,
  }) = _AuthFlowState;
}
