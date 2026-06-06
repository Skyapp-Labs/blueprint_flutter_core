part of '_steps.dart';

abstract class EmailStepTemplate extends AuthStepTemplate {
  const EmailStepTemplate();

  @override
  String get stepId => 'email';

  @override
  AuthStepLayout get layout => const AuthStepLayout(
    title: 'Enter your email',
    subtitle: 'We will send you a code to verify your email',
    actionLabel: 'Log in',
  );

  void onSignUpRequested(WidgetRef ref) {
    ref.goToAuthStep(AuthStep.signup);
  }

  @override
  Widget? buildFooter(BuildContext context, WidgetRef ref) {
    return FxText(
      'Don\'t have an account? [Sign up]',
      textAlign: TextAlign.center,
      padding: EdgeInsets.symmetric(vertical: context.sizes.md),
      onTap: (_, _) => onSignUpRequested(ref),
    );
  }
}

class DefaultEmailStepTemplate extends EmailStepTemplate {
  const DefaultEmailStepTemplate();
}
