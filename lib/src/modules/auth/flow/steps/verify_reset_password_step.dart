part of '_steps.dart';

abstract class VerifyResetPasswordStepTemplate extends AuthStepTemplate {
  const VerifyResetPasswordStepTemplate();

  @override
  String get stepId => 'verify_reset_password';

  @override
  AuthStepLayout get layout => const AuthStepLayout(
    title: 'Verify your reset password',
    subtitle: 'Enter the code sent to your email',
    actionLabel: 'Verify',
  );
}

class DefaultVerifyResetPasswordStepTemplate
    extends VerifyResetPasswordStepTemplate {
  const DefaultVerifyResetPasswordStepTemplate();
}
