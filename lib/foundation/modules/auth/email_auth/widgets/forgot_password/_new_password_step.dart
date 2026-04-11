import 'package:flutter/material.dart';

import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/buttons/fx_button.dart';
import '../../../../../core/widgets/fx_context.dart';
import '../../../../../core/widgets/inputs/_index.dart' show FxTextField;
import 'fx_forgot_password_data.dart';

/// Step 3: User sets their new password.
class NewPasswordStep extends StatefulWidget {
  const NewPasswordStep({
    super.key,
    required this.data,
    required this.onSubmit,
    required this.isLoading,
    this.error,
  });

  final FxForgotPasswordData data;
  final Future<void> Function(String newPassword) onSubmit;
  final bool isLoading;
  final String? error;

  @override
  State<NewPasswordStep> createState() => _NewPasswordStepState();
}

class _NewPasswordStepState extends State<NewPasswordStep> with FxUiToolkit {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Column(
      key: const ValueKey('newPassword'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.data.newPasswordTitle,
          style: typography.headlineSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: sizes.sm),
        Text(
          widget.data.newPasswordSubtitle,
          style: typography.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: sizes.xl),
        Form(
          key: _formKey,
          child: Column(
            children: [
              FxTextField(
                controller: _passwordController,
                label: 'New password',
                obscureText: true,
                textInputAction: TextInputAction.next,
                validator: Validators.password,
              ),
              SizedBox(height: sizes.md),
              FxTextField(
                controller: _confirmController,
                label: 'Confirm password',
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: (v) => Validators.confirmPassword(
                  v,
                  _passwordController.text,
                ),
              ),
            ],
          ),
        ),
        if (widget.error != null) ...[
          SizedBox(height: sizes.sm),
          Text(
            widget.error!,
            style: typography.bodySmall.copyWith(color: colorScheme.error),
            textAlign: TextAlign.center,
          ),
        ],
        SizedBox(height: sizes.lg),
        FxButton(
          label: widget.data.newPasswordButtonLabel,
          isLoading: widget.isLoading,
          onPressed: () async {
            if (_formKey.currentState?.validate() ?? false) {
              await widget.onSubmit(_passwordController.text);
            }
          },
        ),
      ],
    );
  }
}
