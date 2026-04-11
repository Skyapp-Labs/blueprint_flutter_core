part of 'fx_phone_auth.dart';

typedef PhoneEntryCallback = Future<void> Function(String phone);
typedef OtpVerificationCallback = Future<void> Function(String otp);
typedef UserDetailsCallback = Future<void> Function(UserDetailsInput input);

class FxPhoneAuthTheme {
  const FxPhoneAuthTheme({
    this.phoneEntryBuilder,
    this.otpVerificationBuilder,
    this.userDetailsBuilder,
    this.showInputLabel = false,
    this.phoneEntryConfig = const PhoneEntryConfig(),
    this.otpVerificationConfig = const OtpVerificationConfig(),
    this.userDetailsConfig = const UserDetailsConfig(),
  });

  final bool showInputLabel;
  final PhoneEntryConfig phoneEntryConfig;
  final OtpVerificationConfig otpVerificationConfig;
  final UserDetailsConfig userDetailsConfig;

  final Widget Function(BuildContext context)? phoneEntryBuilder;
  final Widget Function(BuildContext context)? otpVerificationBuilder;
  final Widget Function(BuildContext context)? userDetailsBuilder;
}

/// Phone entry
class PhoneEntryConfig {
  const PhoneEntryConfig({
    this.title = 'Enter your phone number',
    this.subtitle = "We'll send you a verification code",
    this.flagShape = FxFlagShape.circle,
    this.flagSize = 28,
    this.buttonLabel = 'Send code',
    this.keyboardBuilder,
  });

  /// The title text for the phone entry screen.
  final String title;
  /// The subtitle text for the phone entry screen.
  final String subtitle;
  /// The flag shape for the phone entry screen.
  final FxFlagShape flagShape;
  /// The flag size for the phone entry screen.
  final double flagSize;
  /// The button label for the send code button.
  final String buttonLabel;
  /// The keyboard builder for the phone entry screen.
  final Widget Function(TextEditingController phoneController)? keyboardBuilder;
}

/// Verify phone (OTP)
class OtpVerificationConfig {
  const OtpVerificationConfig({
    this.otpLength = 6,
    this.title = 'Verify your number',
    this.subtitle = 'Enter the code sent to {{phone}}',
    this.buttonLabel = 'Verify',
    this.changeNumberLabel = 'Change number',
    this.resendCooldownSeconds = 60,
    this.resendPrefixText = "Didn't receive a code?",
    this.resendActionText = 'Resend',
    this.resendCountdownPrefixText = 'Resend in',
    this.invalidCodeMessage = 'Invalid code, please try again',
    this.expiredCodeMessage = 'Code expired, please request a new one',
    this.keyboardBuilder,
  });

  /// The title text for the otp verification screen.
  final String title;
  /// The subtitle text with {{phone}} placeholder for the phone number.
  /// Example: 'Enter the code sent to {{phone}}'
  final String subtitle;
  /// The button label for the verify button.
  final String buttonLabel;
  /// The label for the change number button.
  final String changeNumberLabel;
  /// The length of the otp code.
  final int otpLength;
  /// The cooldown seconds for the resend code button.
  final int resendCooldownSeconds;
  /// The prefix text for the resend code button.
  final String resendPrefixText;
  /// The message text for the invalid code.
  final String invalidCodeMessage;
  /// The message text for the expired code.
  final String expiredCodeMessage;
  /// The action text for the resend code button.
  final String resendActionText;
  /// The prefix text for the resend countdown.
  final String resendCountdownPrefixText;
  /// The keyboard builder for the otp verification screen.
  final Widget Function(TextEditingController otpController)? keyboardBuilder;
}

/// Enter user details
class UserDetailsConfig {
  const UserDetailsConfig({
    this.title = 'Create your account',
    this.subtitle = 'Enter your details to create an account',
    this.buttonLabel = 'Create account',
    this.requireEmail = false,
    this.emailLookup = false,
    this.firstNamePrefix,
    this.lastNamePrefix,
    this.emailPrefix,
  });

  /// The title text for the user details screen.
  final String title;
  /// The subtitle text for the user details screen.
  final String subtitle;
  /// The button label for the create account button.
  final String buttonLabel;
  /// The prefix widget for the first name input (supports SVG, Icon, etc.).
  final Widget? firstNamePrefix;
  /// The prefix widget for the last name input (supports SVG, Icon, etc.).
  final Widget? lastNamePrefix;
  /// The prefix widget for the email input (supports SVG, Icon, etc.).
  final Widget? emailPrefix;
  /// Whether to require email input.
  final bool requireEmail;
  /// If true, checks on blur whether the email belongs to an existing account.
  final bool emailLookup;
}
