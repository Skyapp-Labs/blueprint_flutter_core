part of '_steps.dart';

abstract class PhoneStepTemplate extends AuthStepTemplate {
  const PhoneStepTemplate();

  @override
  String get stepId => 'phone';

  @override
  AuthStepLayout get layout => const AuthStepLayout(
    title: 'Enter your phone number',
    subtitle: 'We will send you a code to verify your phone number',
    actionLabel: 'Send code',
  );
}

class DefaultPhoneStepTemplate extends PhoneStepTemplate {
  const DefaultPhoneStepTemplate();
}
