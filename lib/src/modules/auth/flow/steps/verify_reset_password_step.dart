part of '_steps.dart';

abstract class VerifyResetPasswordStep extends BaseStep {
  @override
  String get key => 'verify_reset_password_step';

  @override
  String? get title => 'Verify your reset password';

  @override
  String? get subtitle => 'Enter the code sent to your email';

  @override
  String get actionLabel => 'Verify';
}

class DefaultVerifyResetPasswordStep extends VerifyResetPasswordStep { }