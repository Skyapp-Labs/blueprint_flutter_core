part of '_steps.dart';

abstract class EmailStepTemplate extends AuthStepTemplate {

  const EmailStepTemplate({
    super.context,
    super.ref,
  });

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
  Widget? get buildFooter => FxText(
    'Don\'t have an account? [Sign up]',
    textAlign: TextAlign.center,
    padding: EdgeInsets.symmetric(vertical: context.sizes.md),
    onTap: (_, _) => onSignUpRequested(ref),
  );
}

class DefaultEmailStepTemplate extends EmailStepTemplate {
  const DefaultEmailStepTemplate({
    super.context,
    super.ref,
  });

  @override
  EmailStepTemplate copyWith({
    required BuildContext context,
    required WidgetRef ref,
  }) => DefaultEmailStepTemplate(context: context, ref: ref);
}
