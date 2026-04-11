import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/controllers/auth_controller.dart';
import '../models/register_request.dart';
import 'phone_auth_flow_state.dart';

part 'phone_auth_flow_controller.g.dart';

@riverpod
class PhoneAuthFlowController extends _$PhoneAuthFlowController {

  @override
  PhoneAuthFlowState build() => const PhoneAuthFlowState();

  Future<void> sendOtp(String phone) async {
    final data = await ref.read(authControllerProvider.notifier).sendOtp(phone);

    if (data == null) return;

    state = state.copyWith(
      phone: phone,
      step: FxPhoneAuthStep.enterOtp,
      otpData: data,
    );
  }

  Future<void> verifyOtp(String code) async {
    final result = await ref.read(authControllerProvider.notifier).verifyOtp(
      verificationId: state.otpData!.verificationId,
      code: code,
    );

    if (result == null) return;

    if (result.hasAccount && result.phoneGrantToken != null) {
      await ref.read(authControllerProvider.notifier)
          .loginWithToken(result.phoneGrantToken!);
    } else {
      state = state.copyWith(
        step: FxPhoneAuthStep.enterDetails,
        lookupResult: result
      );
    }
  }

  Future<void> resendOtp() async {
    final data = await ref.read(authControllerProvider.notifier)
        .resendOtp(state.otpData!.verificationId);
    if (data != null) state = state.copyWith(otpData: data);
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    String? email,
  }) async {
    await ref.read(authControllerProvider.notifier).registerWithPhone(
      PhoneRegisterRequest(
        phoneGrantToken: state.lookupResult!.phoneGrantToken!,
        firstName: firstName,
        lastName: lastName,
        email: email,
      ),
    );
  }

  void goBack() => state = state.copyWith(step: FxPhoneAuthStep.enterPhone);
}
