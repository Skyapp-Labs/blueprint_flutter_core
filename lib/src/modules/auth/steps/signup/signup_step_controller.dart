import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/signup/signup_step_state.dart';

part 'signup_step_controller.g.dart';

@riverpod
class SignupStepController extends _$SignupStepController {
  
  @override
  SignupStepState build() => SignupStepState();
}