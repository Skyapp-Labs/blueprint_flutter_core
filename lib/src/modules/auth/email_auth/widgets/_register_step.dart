import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/widgets/display/fx_text.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_index.dart' show FxTextField;
import 'package:blueprint_flutter_core/src/core/widgets/layout/fx_scrollable_form.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_method.dart';
import 'package:blueprint_flutter_core/src/modules/auth/email_auth/models/register_request.dart';
import 'package:blueprint_flutter_core/src/modules/auth/email_auth/widgets/fx_email_auth.dart' show FxEmailAuthTheme, RegisterConfig;

/// Standalone registration form widget.
///
/// Adapts its fields automatically to the configured [AuthMethod]:
/// - [AuthMethod.phone]: expects a [phoneVerifiedToken] (from the OTP flow).
///   Shows first name, last name, and optional email fields.
/// - [AuthMethod.email]: shows first name, last name, email, and password fields.
class RegisterStep extends ConsumerStatefulWidget {
  const RegisterStep({
    super.key,
    required this.theme,
    required this.onSubmit,
    required this.onLogin,
    required this.onBack,
    required this.isLoading,
  });

  final bool isLoading;
  final VoidCallback onLogin;
  final VoidCallback? onBack;
  final FxEmailAuthTheme theme;
  final Future<void> Function(EmailRegisterRequest) onSubmit;

  @override
  ConsumerState<RegisterStep> createState() => _RegisterStepState();
}

class _RegisterStepState extends ConsumerState<RegisterStep> with FxUiToolkit {

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryCodeController = TextEditingController();

  RegisterConfig get stepTheme => widget.theme.registerConfig;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _countryCodeController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final request = EmailRegisterRequest(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      phone: _phoneController.text.trim(),
      countryCode: _countryCodeController.text.trim(),
    );

    await widget.onSubmit(request);
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return FxScrollableForm(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      padding: EdgeInsets.symmetric(horizontal: sizes.md),
      header: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: Icon(CupertinoIcons.chevron_left),
          onPressed: widget.onBack ?? widget.onLogin,
        ),
      ),
      footer: FxText(
        '${stepTheme.alreadyHaveAccountLabel} [${stepTheme.loginLabel}]',
        textAlign: TextAlign.center,
        padding: EdgeInsets.symmetric(vertical: sizes.md),
        onTap: (_, __) => widget.onLogin(),
      ),
      children: [
        _buildHeader(),
        SizedBox(height: sizes.sm),
        _buildForm(),
        _buildFooter()
      ]
    );
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: [
    //     Text(
    //       stepTheme.title,
    //       style: typography.headlineSmall,
    //       textAlign: TextAlign.center,
    //     ),
    //     SizedBox(height: sizes.xl),
    //     _buildForm(),
    //     SizedBox(height: sizes.lg),
    //     FxButton(
    //       label: stepTheme.buttonLabel,
    //       isLoading: widget.isLoading,
    //       onPressed: _onSubmit,
    //     ),
    //     SizedBox(height: sizes.lg),
    //   ],
    // );
  }

  Widget _buildHeader() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    spacing: sizes.sm,
    children: [
      Text(
        stepTheme.title,
        style: typography.headlineSmall,
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
      spacing: sizes.md,
      children: [
        FxTextField(
          controller: _firstNameController,
          prefixIcon: stepTheme.firstNamePrefix,
          label: 'First name',
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          validator: (v) => Validators.required(v, 'First name'),
        ),
        FxTextField(
          controller: _lastNameController,
          prefixIcon: stepTheme.lastNamePrefix,
          label: 'Last name',
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          validator: (v) => Validators.required(v, 'Last name'),
        ),
        FxTextField(
          controller: _emailController,
          prefixIcon: stepTheme.emailPrefix,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: Validators.email,
        ),
        FxTextField(
          controller: _passwordController,
          prefixIcon: stepTheme.passwordPrefix,
          label: 'Password',
          obscureText: true,
          textInputAction: TextInputAction.next,
          validator: Validators.password,
        ),
        FxTextField(
          controller: _confirmPasswordController,
          prefixIcon: stepTheme.confirmPasswordPrefix,
          label: 'Confirm password',
          obscureText: true,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _onSubmit(),
          validator: (v) => Validators.confirmPassword(
            v,
            _passwordController.text,
          ),
        ),
      ],
    ),
  );

  Widget _buildFooter() => Column(
    children: [
      FxButton(
        label: stepTheme.buttonLabel,
        isLoading: widget.isLoading,
        onPressed: _onSubmit,
      ),
    ],
  );
}
