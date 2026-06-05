part of '_steps.dart';

abstract class SignupStep extends BaseStep {
  @override
  String get key => 'signup_step';

  @override
  String? get title => 'Create your account';

  @override
  String? get subtitle => 'Enter your email and password to create your account';

  @override
  String get actionLabel => 'Create account';
}

class DefaultSignupStep extends SignupStep { }