import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_step.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:blueprint_flutter_core/src/modules/auth/flow/auth_flow_state.dart';

part 'auth_flow_controller.g.dart';

@riverpod
class AuthFlowController extends _$AuthFlowController {

  @override
  AuthFlowState build() => const AuthFlowState();

  AuthStep get currentStep => state.step;

  AuthFlowType get currentFlowType => state.type;

  bool get isForwardNavigation => (state.previousStep?.stepIndex ?? 0) < currentStep.stepIndex;

  void setFlowType(AuthFlowType type) {
    state = state.copyWith(type: type);
  }

  void goToStep(AuthStep step) {
    state = state.copyWith(step: step);
  }

  void goToNextStep() {
    if (currentStep.isLastStep || currentStep.nextStepIndex == null) return;
    state = state.copyWith(step: AuthStep.fromIndex(currentStep.nextStepIndex!));
  }

  void goToPreviousStep() {
    if (currentStep.isFirstStep || currentStep.previousStepIndex == null) return;
    state = state.copyWith(step: AuthStep.fromIndex(currentStep.previousStepIndex!));
  }
}