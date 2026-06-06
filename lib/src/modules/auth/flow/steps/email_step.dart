part of '_steps.dart';

abstract class EmailStep extends BaseStep {
  @override
  String get key => 'email_step';

  @override
  String? get title => 'Enter your email';

  @override
  String? get subtitle => 'We will send you a code to verify your email';

  @override
  String get actionLabel => 'Login';

  @override
  Widget footer(BuildContext context) => FxText(
    'Don\'t have an account? [Sign up]',
    textAlign: TextAlign.center,
    padding: EdgeInsets.symmetric(vertical: sizes.md),
    onTap: (_, _) => _onSignUp(),
  );
}

class DefaultEmailStep extends EmailStep { }