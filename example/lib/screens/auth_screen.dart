import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blueprint_flutter_core/blueprint_auth.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';

/// Demonstrates the built-in auth flows provided by blueprint_flutter_core.
///
/// Toggle between email and phone auth using the tab bar.
/// On success, a success banner is shown.
class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen>
    with SingleTickerProviderStateMixin, FxUiToolkit {
  late final TabController _tabController;
  bool _authSuccess = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onAuthSuccess() => setState(() => _authSuccess = true);

  void _onReset() {
    setState(() => _authSuccess = false);
    ref.invalidate(authControllerProvider);
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return FxScaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Email'),
            Tab(text: 'Phone'),
          ],
        ),
      ),
      padding: EdgeInsets.all(sizes.md),
      body: _authSuccess
          ? _SuccessBanner(onReset: _onReset)
          : TabBarView(
              controller: _tabController,
              children: [_emailTab(), _phoneTab()],
            ),
    );
  }

  Widget _emailTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: sizes.lg),
          FxEmailAuth(
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
          ),
        ],
      ),
    );
  }

  Widget _phoneTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: sizes.lg),
          FxPhoneAuth(
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
          ),
        ],
      ),
    );
  }
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
