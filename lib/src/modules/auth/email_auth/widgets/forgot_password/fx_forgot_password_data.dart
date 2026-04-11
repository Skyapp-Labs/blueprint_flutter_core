/// Configuration for [FxForgotPasswordWidget].
class FxForgotPasswordData {
  const FxForgotPasswordData({
    this.enterEmailTitle = 'Forgot your password?',
    this.enterEmailSubtitle = "Enter your email and we'll send you a reset code",
    this.enterEmailButtonLabel = 'Send reset code',
    this.verifyPinTitle = 'Check your email',
    this.verifyPinSubtitle = 'Enter the code sent to {{email}}',
    this.verifyPinButtonLabel = 'Verify code',
    this.newPasswordTitle = 'Set new password',
    this.newPasswordSubtitle = 'Choose a strong password for your account',
    this.newPasswordButtonLabel = 'Reset password',
    this.pinLength = 6,
    this.resendCooldownSeconds = 60,
    this.resendPrefixText = "Didn't receive a code?",
    this.resendActionText = 'Resend',
    this.resendCountdownPrefixText = 'Resend in',
    this.invalidPinMessage = 'Invalid or expired code, please try again',
  });

  /// Step 1 — Enter email
  final String enterEmailTitle;
  final String enterEmailSubtitle;
  final String enterEmailButtonLabel;

  /// Step 2 — Verify PIN
  /// Use {{email}} as a placeholder for the user's email address.
  final String verifyPinTitle;
  final String verifyPinSubtitle;
  final String verifyPinButtonLabel;
  final int pinLength;
  final int resendCooldownSeconds;
  final String resendPrefixText;
  final String resendActionText;
  final String resendCountdownPrefixText;
  final String invalidPinMessage;

  /// Step 3 — New password
  final String newPasswordTitle;
  final String newPasswordSubtitle;
  final String newPasswordButtonLabel;
}
