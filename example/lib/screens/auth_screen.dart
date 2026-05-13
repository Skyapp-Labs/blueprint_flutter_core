import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/blueprint_auth.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with FxUiToolkit {
  
  bool? _isMethodEmail;
  bool _authSuccess = false;

  void _onAuthSuccess() => setState(() => _authSuccess = true);

  void _onReset() => setState(() {
    _authSuccess = false;
    _isMethodEmail = null;
  });

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    if (_authSuccess) return _SuccessBanner(onReset: _onReset);

    return FxScaffold(
      appBar: AppBar(
        title: const Text('Authentication')
      ),
      body: _isMethodEmail != null ? (_isMethodEmail! ? _emailTab() : _phoneTab()) : _initialTab(),
    );
  }

  Widget _initialTab() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Select your authentication method', style: typography.headlineSmall),
      SizedBox(height: sizes.lg),
      FxButton(
        label: 'Email',
        onPressed: () => setState(() => _isMethodEmail = true),
      ),
      SizedBox(height: sizes.lg),
      FxButton(
        label: 'Phone',
        onPressed: () => setState(() => _isMethodEmail = false),
      ),
    ],
  );

  Widget _emailTab() => FxEmailAuth(
    onAuthSuccess: _onAuthSuccess,
    theme: const FxEmailAuthTheme(
      loginConfig: LoginConfig(
        title: 'Welcome back',
        subtitle: 'Sign in to your account',
        buttonLabel: 'Sign In',
      ),
      registerConfig: RegisterConfig(
        title: 'Create account',
        subtitle: 'Fill in your details to get started',
        buttonLabel: 'Create Account',
      ),
    ),
  );

  Widget _phoneTab() => FxPhoneAuth(
    onAuthSuccess: _onAuthSuccess,
    theme: const FxPhoneAuthTheme(
      phoneEntryConfig: PhoneEntryConfig(
        title: 'Enter your number',
        subtitle: "We'll send you a verification code",
        buttonLabel: 'Send Code',
      ),
      otpVerificationConfig: OtpVerificationConfig(
        title: 'Verify your number',
        subtitle: 'Enter the code sent to {{phone}}',
        buttonLabel: 'Verify',
      ),
      userDetailsConfig: UserDetailsConfig(
        title: 'Complete your profile',
        subtitle: 'Enter your name to finish setting up',
        buttonLabel: 'Continue',
      ),
    ),
  );
}

class _SuccessBanner extends StatelessWidget with FxUiToolkit {
  _SuccessBanner({required this.onReset});

  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(sizes.lg),
            decoration: BoxDecoration(
              color: colors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle_outline_rounded,
              size: sizes.icon64,
              color: colors.success,
            ),
          ),
          SizedBox(height: sizes.lg),
          Text('Authenticated!', style: typography.headlineSmall),
          SizedBox(height: sizes.xs),
          Text(
            'You have successfully signed in.',
            style: typography.bodyMedium.copyWith(color: colors.textSecondary),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: sizes.xl),
          FxButton(
            label: 'Try Again',
            variant: FxButtonVariant.outline,
            isFullWidth: false,
            onPressed: onReset,
          ),
        ],
      ),
    );
  }
}
