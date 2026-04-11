import 'package:flutter/material.dart';

import 'package:skyapp_flutter_core/src/core/utils/validators.dart';
import 'package:skyapp_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:skyapp_flutter_core/src/core/widgets/fx_context.dart';
import 'package:skyapp_flutter_core/src/core/widgets/inputs/_index.dart' show FxTextField;
import 'package:skyapp_flutter_core/src/core/widgets/layout/fx_scrollable_form.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/widgets/forgot_password/fx_forgot_password_data.dart';

/// Step 1: User enters their email to receive a reset PIN.
class EnterEmailStep extends StatefulWidget {
  const EnterEmailStep({
    super.key,
    required this.data,
    required this.onSubmit,
    required this.isLoading,
    this.error,
  });

  final FxForgotPasswordData data;
  final Future<void> Function(String email) onSubmit;
  final bool isLoading;
  final String? error;

  @override
  State<EnterEmailStep> createState() => _EnterEmailStepState();
}

class _EnterEmailStepState extends State<EnterEmailStep> with FxUiToolkit {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return FxScrollableForm(
      key: const ValueKey('enterEmail'),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      padding: EdgeInsets.symmetric(horizontal: sizes.md),
      children: [
        _buildHeader(),

        _buildForm(),

        FxButton(
          label: widget.data.enterEmailButtonLabel,
          isLoading: widget.isLoading,
          onPressed: () async {
            if (_formKey.currentState?.validate() ?? false) {
              await widget.onSubmit(_emailController.text.trim());
            }
          },
        ),
      ],
    );
  }

  Widget _buildHeader() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        widget.data.enterEmailTitle,
        style: typography.headlineSmall.copyWith(height: 1.8),
        textAlign: TextAlign.center,
      ),
      Text(
        widget.data.enterEmailSubtitle,
        style: typography.bodyMedium,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: sizes.md),
    ]
  );

  Widget _buildForm() => Form(
    key: _formKey,
    child: Column(
      spacing: sizes.md,
      children: [
        FxTextField(
          controller: _emailController,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          validator: Validators.email,
        ),
        if (widget.error != null) ...[
          Text(
            widget.error!,
            style: typography.bodySmall.copyWith(color: colorScheme.error),
            textAlign: TextAlign.center,
          ),
        ]
      ]
    )
  );
}
