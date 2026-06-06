part of '_steps.dart';

abstract class SignupStepTemplate extends AuthStepTemplate {
  const SignupStepTemplate();

  @override
  String get stepId => 'signup';

  @override
  AuthStepLayout get layout => const AuthStepLayout(
    title: 'Create your account',
    subtitle: 'Enter your email and password to create your account',
    actionLabel: 'Create account',
  );

  @override
  Widget? buildFooter(BuildContext context, WidgetRef ref) => FxText(
    'Already have an account? [Log in]',
    textAlign: TextAlign.center,
    padding: EdgeInsets.symmetric(vertical: context.sizes.md),
    onTap: (_, _) => ref.goToAuthStep(AuthStep.emailAndPassword),
  );

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) => PreferredSize(
    preferredSize: Size.fromHeight(context.sizes.appBarHeight),
    child: Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => ref.goToAuthStep(AuthStep.emailAndPassword), 
        icon: context.componentTheme.navigateBackIcon
      ),
    )
  );
}

class DefaultSignupStepTemplate extends SignupStepTemplate {
  const DefaultSignupStepTemplate();
}
