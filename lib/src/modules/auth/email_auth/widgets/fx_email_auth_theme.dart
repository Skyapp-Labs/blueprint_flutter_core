part of 'fx_email_auth.dart';

class FxEmailAuthTheme {
  const FxEmailAuthTheme({
    this.loginBuilder,
    this.registerBuilder,
    this.showInputLabel = false,
    this.loginConfig = const LoginConfig(),
    this.registerConfig = const RegisterConfig(),
  });

  final bool showInputLabel;
  final LoginConfig loginConfig;
  final RegisterConfig registerConfig;

  final Widget Function(BuildContext context)? loginBuilder;
  final Widget Function(BuildContext context)? registerBuilder;
}

/// Phone entry
class LoginConfig {
  const LoginConfig({
    this.title = 'Login',
    this.subtitle = 'Enter your email and password to login',
    this.emailPrefix,
    this.passwordPrefix,
    this.forgotPasswordLabel = 'Forgot password?',
    this.noAccountLabel = "Don't have an account?",
    this.signUpLabel = 'Sign up',
    this.buttonLabel = 'Login',
  });

  /// The title text for the phone entry screen.
  final String title;
  /// The subtitle text for the phone entry screen.
  final String subtitle;
  /// The prefix widget for the email input.
  final Widget? emailPrefix;
  /// The label text for the password input.
  final Widget? passwordPrefix;
  /// The label text for the forgot password button.
  final String forgotPasswordLabel;
  /// The label text for the no account button.
  final String noAccountLabel;
  /// The label text for the sign up button.
  final String signUpLabel;
  /// The button label for the login button.
  final String buttonLabel;
}

/// Register
class RegisterConfig {
  const RegisterConfig({
    this.title = 'Register',
    this.firstNamePrefix,
    this.lastNamePrefix,
    this.emailPrefix,
    this.passwordPrefix,
    this.confirmPasswordPrefix,
    this.subtitle = 'Enter your details to create an account',
    this.buttonLabel = 'Create account',
    this.alreadyHaveAccountLabel = "Already have an account?",
    this.loginLabel = 'Login',
  });

  final Widget? firstNamePrefix;
  final Widget? lastNamePrefix;
  final Widget? emailPrefix;
  final Widget? passwordPrefix;
  final Widget? confirmPasswordPrefix;

  /// The title text for the otp verification screen.
  final String title;
  /// The subtitle text with {{phone}} placeholder for the phone number.
  /// Example: 'Enter the code sent to {{phone}}'
  final String subtitle;
  /// The button label for the verify button.
  final String buttonLabel;
  /// The label text for the already have account button.
  final String alreadyHaveAccountLabel;
  /// The label text for the login button.
  final String loginLabel;
}
