import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/_payload.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/modules/auth/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_step.dart';
import 'package:blueprint_flutter_core/src/core/network/network_providers.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/auth_flow_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/services/otp_service.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/otp/otp_step_state.dart';

part 'otp_step_controller.g.dart';

@riverpod
class OtpStepController extends _$OtpStepController {

  late final OtpService _service;
  late final AuthService _authService;

  @override
  OtpStepState build() {
    final context = ref.read(fxServiceProvider);
    final authFlowState = ref.read(authFlowControllerProvider.notifier).state;

    _service = OtpService(context);
    _authService = AuthService(context);

    return OtpStepState(
      resendToken: authFlowState.sendOtpResponse?.data.verificationId, 
      verificationId: authFlowState.sendOtpResponse?.data.verificationId,
    );
  }

  AuthFlowController get _authFlow => ref.read(authFlowControllerProvider.notifier);

  int get _otpLength => ref.read(fxConfigProvider).otpLength;

  void setOtp(String otp) {
    state = state.copyWith(otp: otp, error: null);
  }

  void onOtpChanged(String value) {
    state = state.copyWith(
      otp: value.isEmpty ? null : value,
      error: null,
    );
  }

  Future<void> verifyOtp() async {
    if (state.isLoading) return;

    if (state.verificationId == null) {
      state = state.copyWith(error: 'Verification ID is required');
      _authFlow.goToPreviousStep();
      return;
    }

    if (state.otp == null) {
      state = state.copyWith(error: 'OTP is required');
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    final payload = VerifyOtpPayload(
      verificationId: state.verificationId!,
      otp: state.otp!,
    );

    final result = await _service.verifyOtp(payload, otpLength: _otpLength);
    if (!ref.mounted) return;

    await result.when(
      success: (response) async {
        if (response.data.hasAccount) {
          await _loginWithToken(response.data.verificationToken);
          return;
        }
        _authFlow.goToStep(AuthStep.signup);
        if (!ref.mounted) return;
        state = state.copyWith(isLoading: false);
      },
      failure: (error) {
        if (!ref.mounted) return;
        state = state.copyWith(error: error.message, isLoading: false);
      },
    );
  }

  Future<void> resendOtp() async {
    if (state.resendToken == null) {
      state = state.copyWith(error: 'Resend token is required');
      _authFlow.goToPreviousStep();
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    final payload = RefreshTokenPayload(
      refreshToken: state.resendToken!,
    );
    
    final result = await _service.resendOtp(payload, otpLength: _otpLength);

    result.when(
      success: (response) {
        state = state.copyWith(
          resendToken: response.data.verificationId, 
          verificationId: response.data.verificationId,
          error: null, 
          isLoading: false
        );
      },
      failure: (error) {
        state = state.copyWith(error: error.message, isLoading: false);
      }
    );
  }

  Future<void> _loginWithToken(String verificationToken) async {
    final payload = LoginWithTokenPayload(
      verificationToken: verificationToken,
    );
    final result = await _authService.loginWithToken(payload);
    if (!ref.mounted) return;

    await result.when(
      success: (tokens) async {
        await ref.read(authControllerProvider.notifier).applyTokens(tokens);
        if (!ref.mounted) return;
        state = state.copyWith(isLoading: false);
      },
      failure: (error) {
        if (!ref.mounted) return;
        state = state.copyWith(error: error.message, isLoading: false);
        _authFlow.goToPreviousStep();
      },
    );
  }
}