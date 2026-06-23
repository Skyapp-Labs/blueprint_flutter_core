import 'package:blueprint_flutter_core/src/core/network/network_providers.dart';
import 'package:blueprint_flutter_core/src/modules/auth/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_method.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/signup_payload.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/services/auth_service.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/auth_flow.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/signup/signup_step_state.dart';

part 'signup_step_controller.g.dart';

@riverpod
class SignupStepController extends _$SignupStepController {

  late final AuthService _service;
  
  @override
  SignupStepState build() {
    _service = AuthService(ref.read(fxServiceProvider));
    return SignupStepState();
  }

  Future<void> onSignUpRequested(FxSignupFormGroup formGroup) async {
    final authFlow = ref.read(authFlowControllerProvider.notifier);
    final isPhoneAuth = authFlow.currentAuthMethod == AuthMethod.phone;
    final verificationToken = authFlow.state.verifyOtpResponse?.data.verificationToken;

    final payload = SignupPayload(
      email: formGroup.email.value,
      password: isPhoneAuth ? null : formGroup.password.value,
      verificationToken: verificationToken,
      phoneNumber: formGroup.phone.value,
      profile: SignupProfilePayload(
        firstName: formGroup.firstName.value,
        lastName: formGroup.lastName.value,
        displayName: formGroup.fullNumber.value,
        dateOfBirth: formGroup.dateOfBirth.value,
        username: formGroup.username.value,
        gender: formGroup.gender.value,
      )
    );

    state = state.copyWith(isLoading: true, error: null);

    final result = await _service.signup(payload);

    result.when(
      success: (tokens) async {
        final authController = ref.read(authControllerProvider.notifier);
        await authController.applyTokens(tokens, isNewUser: true);
        if (!ref.mounted) return;
        state = state.copyWith(isLoading: false);
      },
      failure: (error) {
        if (!ref.mounted) return;
        state = state.copyWith(error: error.message, isLoading: false);
      }
    );
  }
}