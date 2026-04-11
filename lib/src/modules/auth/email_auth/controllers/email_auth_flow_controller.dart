import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:skyapp_flutter_core/src/modules/auth/core/controllers/auth_controller.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/models/register_request.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/controllers/email_auth_flow_state.dart';

part 'email_auth_flow_controller.g.dart';

/// Manages the email auth flow (login and register steps).
/// Delegates all API calls to [authControllerProvider].
@riverpod
class EmailAuthFlowController extends _$EmailAuthFlowController {

  @override
  EmailAuthFlowState build() => const EmailAuthFlowState();

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    return ref.read(authControllerProvider.notifier).loginWithEmail(
      email: email,
      password: password,
    );
  }

  Future<bool> registerWithEmail(EmailRegisterRequest request) async {
    return ref.read(authControllerProvider.notifier).registerWithEmail(request);
  }

  void goToStep(FxEmailAuthStep step) {
    state = state.copyWith(step: step, error: null);
  }
}
