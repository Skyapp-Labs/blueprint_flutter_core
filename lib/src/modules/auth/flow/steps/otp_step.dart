part of '_steps.dart';

abstract class OtpStepTemplate extends AuthStepTemplate {
  const OtpStepTemplate();

  @override
  String get stepId => 'otp';

  @override
  AuthStepLayout get layout => const AuthStepLayout(
    title: 'Verify your number',
    subtitle: 'Enter the code sent to {{phone}}',
    actionLabel: 'Verify',
  );
}

class DefaultOtpStepTemplate extends OtpStepTemplate {
  const DefaultOtpStepTemplate();
}
