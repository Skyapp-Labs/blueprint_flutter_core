part of '_steps.dart';

abstract class ForgotPasswordStep extends BaseStep {
  @override
  String get key => 'forgot_password_step';

  @override
  String? get title => 'Forgot your password?';

  @override
  String? get subtitle => 'Enter your email to reset your password';

  @override
  String get actionLabel => 'Reset password';
}

class DefaultForgotPasswordStep extends ForgotPasswordStep { }