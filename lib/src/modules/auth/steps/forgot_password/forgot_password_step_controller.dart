import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/_payload.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/services/password_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:blueprint_flutter_core/src/modules/auth/steps/forgot_password/forgot_password_step_state.dart';
import 'package:blueprint_flutter_core/src/core/network/network_providers.dart';

part 'forgot_password_step_controller.g.dart';

@riverpod
class ForgotPasswordStepController extends _$ForgotPasswordStepController {

  late final PasswordService _service;

  @override
  ForgotPasswordStepState build() {
    _service = PasswordService(ref.read(fxServiceProvider));
    return ForgotPasswordStepState();
  }

  void setEmail(String email) {
    state = state.copyWith(
      email: email, 
      error: null, 
      isLoading: false,
    );
  }

  Future<void> sendResetPasswordEmail() async {
    if (state.email == null) {
      state = state.copyWith(error: 'Email is required');
      return;
    }

    state = state.copyWith(isLoading: true, error: null);
    
    final payload = ForgotPasswordPayload(
      email: state.email!,
    );

    final result = await _service.forgotPassword(payload);

    result.when(
      success: (_) async {
        state = state.copyWith(isLoading: false);
      },
      failure: (error) {
        state = state.copyWith(error: error.message, isLoading: false);
      }
    );
  }
}