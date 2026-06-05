import 'package:blueprint_flutter_core/src/core/network/fx_result.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/login_with_email_payload.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:blueprint_flutter_core/src/modules/auth/steps/email/email_step_state.dart';
import 'package:blueprint_flutter_core/src/modules/auth/auth_controller.dart';
import 'package:blueprint_flutter_core/src/core/network/network_providers.dart';

part 'email_step_controller.g.dart';

@riverpod
class EmailStepController extends _$EmailStepController {

  late final AuthService _service;

  @override
  EmailStepState build() {
    _service = AuthService(ref.read(fxServiceProvider));
    return EmailStepState();
  }

  void setEmail(String email) {
    state = state.copyWith(
      email: email, 
      error: null, 
      isLoading: false,
    );
  }

  void setPassword(String password) {
    state = state.copyWith(
      password: password, 
      error: null, 
      isLoading: false,
    );
  }

  Future<void> login() async {
    if (state.email == null || state.password == null) {
      state = state.copyWith(error: 'Email and password are required');
      return;
    }

    state = state.copyWith(isLoading: true, error: null);
    
    final payload = LoginWithEmailPayload(
      email: state.email!, 
      password: state.password!
    );

    final result = await _service.loginWithEmail(payload);

    result.when(
      success: (tokens) async {
        final authController = ref.read(authControllerProvider.notifier);
        await authController.applyTokens(tokens);
        state = state.copyWith(isLoading: false);
      },
      failure: (error) {
        state = state.copyWith(error: error.message, isLoading: false);
      }
    );
  }
}