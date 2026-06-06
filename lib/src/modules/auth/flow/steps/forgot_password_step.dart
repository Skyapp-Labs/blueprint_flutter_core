part of '_steps.dart';

abstract class ForgotPasswordStepTemplate extends AuthStepTemplate {
  const ForgotPasswordStepTemplate();

  @override
  String get stepId => 'forgot_password';

  @override
  AuthStepLayout get layout => const AuthStepLayout(
    title: 'Forgot your password?',
    subtitle: 'Enter your email to reset your password',
    actionLabel: 'Reset password',
  );
}

class DefaultForgotPasswordStepTemplate extends ForgotPasswordStepTemplate {
  const DefaultForgotPasswordStepTemplate();
}
