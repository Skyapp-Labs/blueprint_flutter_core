import 'package:blueprint_flutter_core/src/core/network/network_providers.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/send_otp_payload.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/auth_flow_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/services/otp_service.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/phone/phone_step_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phone_step_controller.g.dart';

@riverpod
class PhoneStepController extends _$PhoneStepController {

  late final OtpService _service;

  @override
  PhoneStepState build() {
    final context = ref.read(fxServiceProvider);
    _service = OtpService(context);
    return const PhoneStepState();
  }

  void setPhone(String phone, {String? countryCode, String? formattedPhone}) {
    if (phone.isEmpty) {
      state = state.copyWith(
        phone: null,
        countryCode: null,
        formattedPhone: null,
      );
      return;
    }

    state = state.copyWith(
      phone: phone,
      countryCode: countryCode,
      formattedPhone: formattedPhone,
    );
  }

  Future<void> sendOtp() async {
    if (state.phone == null) return;

    state = state.copyWith(isLoading: true, error: null);

    final payload = SendOtpPayload(phone: state.phone!);
    final result = await _service.sendOtp(payload);

    result.when(
      success: (response) {
        final notifier = ref.read(authFlowControllerProvider.notifier);
        notifier.state = notifier.state.copyWith(
          phone: state.phone,
          countryCode: state.countryCode,
          formattedPhone: state.formattedPhone,
          sendOtpResponse: response,
        );
        state = state.copyWith(isLoading: false);
        if (!ref.mounted) return;
        notifier.goToNextStep();
      },
      failure: (error) {
        if (!ref.mounted) return;
        state = state.copyWith(error: error.message, isLoading: false);
      }
    );
  }
}