/// Input data for the password reset step.
class ResetPasswordInput {
  const ResetPasswordInput({
    required this.resetToken,
    required this.newPassword,
    required this.confirmPassword,
  });

  final String resetToken;
  final String newPassword;
  final String confirmPassword;
}
