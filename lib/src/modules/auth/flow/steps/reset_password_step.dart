part of '_steps.dart';

abstract class ResetPasswordStepTemplate extends AuthStepTemplate {
  const ResetPasswordStepTemplate({
    super.context,
    super.ref,
  });

  @override
  String get stepId => 'reset_password';

  @override
  AuthStepLayout get layout => const AuthStepLayout(
    title: 'Reset your password',
    subtitle: 'Enter your new password',
    actionLabel: 'Reset password',
  );
}

class DefaultResetPasswordStepTemplate extends ResetPasswordStepTemplate {
  const DefaultResetPasswordStepTemplate({
    super.context,
    super.ref,
  });

  @override
  ResetPasswordStepTemplate copyWith({
    required BuildContext context,
    required WidgetRef ref,
  }) => DefaultResetPasswordStepTemplate(context: context, ref: ref);
}
