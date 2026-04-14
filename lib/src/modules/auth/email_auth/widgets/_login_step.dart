import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_text.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_index.dart' show FxTextField;
import 'package:blueprint_flutter_core/src/core/widgets/layout/fx_scrollable_form.dart';
import 'package:blueprint_flutter_core/src/modules/auth/email_auth/widgets/fx_email_auth.dart' show FxEmailAuthTheme, LoginConfig;

/// Email + password login form.
class LoginStep extends ConsumerStatefulWidget {
  const LoginStep({
    super.key,
    required this.theme,
    required this.onSubmit,
    required this.onForgotPassword,
    required this.onSignUp,
    required this.isLoading,
  });

  final FxEmailAuthTheme theme;
  final VoidCallback onForgotPassword;
  final VoidCallback onSignUp;
  final Future<void> Function({
    required String email,
    required String password,
  }) onSubmit;
  final bool isLoading;

  @override
  ConsumerState<LoginStep> createState() => _LoginStepState();
}

class _LoginStepState extends ConsumerState<LoginStep> with FxUiToolkit {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    await widget.onSubmit(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  LoginConfig get stepTheme => widget.theme.loginConfig;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return FxScrollableForm(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      padding: EdgeInsets.symmetric(horizontal: sizes.md),
      footer: FxText(
        '${stepTheme.noAccountLabel} [${stepTheme.signUpLabel}]',
        textAlign: TextAlign.center,
        padding: EdgeInsets.symmetric(vertical: sizes.md),
        onTap: (_, __) => widget.onSignUp(),
      ),
      children: [
        _buildHeader(),
        SizedBox(height: sizes.sm),
        _buildForm(),
        _buildFooter()
      ]
    );
  }
  Widget _buildHeader() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    spacing: sizes.sm,
    children: [
      Text(
        stepTheme.title,
        style: typography.headlineSmall.copyWith(height: 1.8),
        textAlign: TextAlign.center,
      ),
      Text(
        stepTheme.subtitle,
        style: typography.caption,
        textAlign: TextAlign.center,
      ),
    ],
  );

  Widget _buildForm() => Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: sizes.md,
      children: [
        FxTextField(
          controller: _emailController,
          prefixIcon: stepTheme.emailPrefix,
          label: widget.theme.showInputLabel ? 'Email' : null,
          hint: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: Validators.email,
        ),
        FxTextField(
          controller: _passwordController,
          prefixIcon: stepTheme.passwordPrefix,
          label: widget.theme.showInputLabel ? 'Password' : null,
          hint: 'Enter your password',
          obscureText: true,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _onSubmit(),
          validator: (v) => Validators.required(v, 'Password'),
        )
      ],
    ),
  );

  Widget _buildFooter() => Column(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: FxText(
          '[${stepTheme.forgotPasswordLabel}]',
          textAlign: TextAlign.right,
          padding: EdgeInsets.symmetric(vertical: sizes.md),
          onTap: (_, __) => widget.onForgotPassword(),
        )
      ),
      FxButton(
        label: stepTheme.buttonLabel,
        isLoading: widget.isLoading,
        onPressed: _onSubmit,
      )
    ]
  );
}
