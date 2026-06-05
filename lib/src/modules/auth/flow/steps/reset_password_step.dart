part of '_steps.dart';

abstract class ResetPasswordStep extends BaseStep {
  @override
  String get key => 'reset_password_step';

  @override
  String? get title => 'Reset your password';

  @override
  String? get subtitle => 'Enter your new password';

  @override
  String get actionLabel => 'Reset password';
}

class DefaultResetPasswordStep extends ResetPasswordStep { }