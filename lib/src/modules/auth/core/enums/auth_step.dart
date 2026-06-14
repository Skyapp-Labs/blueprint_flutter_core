enum AuthStep {
  phone(
    stepIndex: PHONE_STEP_INDEX,
    nextStepIndex: OTP_STEP_INDEX,
    isFirstStep: true,
  ),
  otp(
    stepIndex: OTP_STEP_INDEX,
    nextStepIndex: SIGNUP_STEP_INDEX,
    previousStepIndex: PHONE_STEP_INDEX,
    // the the case where the user is already signed up, 
    //the otp step is the last step in the flow
    isLastStep: true,
  ),
  signup(
    stepIndex: SIGNUP_STEP_INDEX,
    isLastStep: true,
  ),
  emailAndPassword(
    stepIndex: EMAIL_AND_PASSWORD_STEP_INDEX,
    isFirstStep: true,
    isLastStep: true,
  ),
  forgotPassword(
    stepIndex: FORGOT_PASSWORD_STEP_INDEX,
    nextStepIndex: VERIFY_RESET_PASSWORD_STEP_INDEX,
    previousStepIndex: EMAIL_AND_PASSWORD_STEP_INDEX,
  ),
  verifyResetPassword(
    stepIndex: VERIFY_RESET_PASSWORD_STEP_INDEX,
    nextStepIndex: RESET_PASSWORD_STEP_INDEX,
    previousStepIndex: FORGOT_PASSWORD_STEP_INDEX,
  ),
  resetPassword(
    stepIndex: RESET_PASSWORD_STEP_INDEX,
    nextStepIndex: VERIFY_RESET_PASSWORD_STEP_INDEX,
    previousStepIndex: FORGOT_PASSWORD_STEP_INDEX,
  );

  const AuthStep({
    required this.stepIndex,
    this.nextStepIndex,
    this.previousStepIndex,
    this.isFirstStep = false,
    this.isLastStep = false,
  });

  /// indicates the index of the step in the flow
  final int stepIndex;
  /// indicates the index of the next step in the flow
  final int? nextStepIndex;
  /// indicates the index of the previous step in the flow
  final int? previousStepIndex;
  /// indicates if the step is the first step in the flow
  final bool isFirstStep;
  /// indicates if the step is the last step in the flow
  final bool isLastStep;

  static AuthStep fromIndex(int index) => AuthStep.values.firstWhere(
    (step) => step.stepIndex == index, 
    orElse: () => throw Exception('Step with index $index not found')
  );
}

// ignore: constant_identifier_names
const PHONE_STEP_INDEX = 0;
// ignore: constant_identifier_names
const OTP_STEP_INDEX = 1;
// ignore: constant_identifier_names
const SIGNUP_STEP_INDEX = 2;
// ignore: constant_identifier_names
const EMAIL_AND_PASSWORD_STEP_INDEX = 3;
// ignore: constant_identifier_names
const FORGOT_PASSWORD_STEP_INDEX = 4;
// ignore: constant_identifier_names
const RESET_PASSWORD_STEP_INDEX = 5;
// ignore: constant_identifier_names
const VERIFY_RESET_PASSWORD_STEP_INDEX = 6;