import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:blueprint_flutter_core/src/modules/auth/core/controllers/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/models/register_request.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/controllers/phone_auth_flow_state.dart';

part 'phone_auth_flow_controller.g.dart';

@riverpod
class PhoneAuthFlowController extends _$PhoneAuthFlowController {

  @override
  PhoneAuthFlowState build() => const PhoneAuthFlowState();

  Future<void> sendOtp(String phone, {String? countryCode}) async {
    final data = await ref.read(authControllerProvider.notifier).sendOtp(phone);

    if (data == null) return;

    state = state.copyWith(
      phone: phone,
      countryCode: countryCode,
      step: FxPhoneAuthStep.enterOtp,
      otpData: data,
    );
  }

  Future<void> verifyOtp(String code) async {
    final result = await ref.read(authControllerProvider.notifier).verifyOtp(
      verificationId: state.otpData!.data.verificationId,
      otp: code,
    );

    if (result == null) return;

    if (result.data.hasAccount) {
      await ref.read(authControllerProvider.notifier)
          .loginWithToken(result.data.verificationToken);
    } else {
      state = state.copyWith(
        step: FxPhoneAuthStep.enterDetails,
        lookupResult: result
      );
    }
  }

  Future<void> resendOtp() async {
    final data = await ref.read(authControllerProvider.notifier)
        .resendOtp(state.otpData!.data.verificationId);
    if (data != null) state = state.copyWith(otpData: data);
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    String? email,
  }) async {
    await ref.read(authControllerProvider.notifier).registerWithPhone(
      PhoneRegisterRequest(
        verificationToken: state.lookupResult!.data.verificationToken,
        phone: state.phone,
        countryCode: state.countryCode,
        firstName: firstName,
        lastName: lastName,
        email: email,
      ),
    );
  }

  void goBack() => state = state.copyWith(step: FxPhoneAuthStep.enterPhone);
}
