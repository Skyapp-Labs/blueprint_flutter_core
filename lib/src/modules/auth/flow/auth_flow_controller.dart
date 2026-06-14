import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_method.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_step.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:blueprint_flutter_core/src/modules/auth/flow/auth_flow_state.dart';

part 'auth_flow_controller.g.dart';

@riverpod
class AuthFlowController extends _$AuthFlowController {

  @override
  AuthFlowState build() => const AuthFlowState();

  AuthStep? get currentStep => state.step;

  AuthMethod? get currentAuthMethod => state.authMethod;

  bool get isForwardNavigation {
    if (currentStep == null || state.previousStep == null) return false;
    return (state.previousStep!.stepIndex) < currentStep!.stepIndex;
  }

  void setAuthMethod(AuthMethod authMethod) {
    state = state.copyWith(authMethod: authMethod);
    return switch (authMethod) {
      AuthMethod.email => goToStep(AuthStep.emailAndPassword),
      AuthMethod.phone => goToStep(AuthStep.phone),
    };
  }

  void goToStep(AuthStep step) {
    state = state.copyWith(step: step);
  }

  void goToNextStep() {
    if(currentStep == null) return;
    if (currentStep!.isLastStep || currentStep!.nextStepIndex == null) return;
    state = state.copyWith(step: AuthStep.fromIndex(currentStep!.nextStepIndex!));
  }

  void goToPreviousStep() {
    if (currentStep == null || currentStep!.isFirstStep || currentStep!.previousStepIndex == null) return;
    state = state.copyWith(step: AuthStep.fromIndex(currentStep!.previousStepIndex!));
  }
}