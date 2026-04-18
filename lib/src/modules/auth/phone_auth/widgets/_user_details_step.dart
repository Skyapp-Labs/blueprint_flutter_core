import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/fx_phone_auth.dart';

class DetailsStep extends StatefulWidget {
  const DetailsStep({
    super.key,
    required this.theme,
    required this.onSubmit,
    required this.isLoading,
  });

  final FxPhoneAuthTheme theme;
  final Future<void> Function({
    required String firstName,
    required String lastName,
    String? email,
  }) onSubmit;
  final bool isLoading;

  @override
  State<DetailsStep> createState() => _DetailsStepState();
}

class _DetailsStepState extends State<DetailsStep> with FxUiToolkit {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Form(
      key: _formKey,
      child: Column(
        key: const ValueKey('details'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: sizes.lg,
        children: [
          Text(
            widget.theme.userDetailsConfig.title,
            style: typography.headlineSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: sizes.xl),
          FxTextField(
            controller: _firstNameController,
            label: 'First name',
            prefixIcon: widget.theme.userDetailsConfig.firstNamePrefix,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            validator: (v) => Validators.required(v, 'First name'),
          ),
          SizedBox(height: sizes.md),
          FxTextField(
            controller: _lastNameController,
            label: 'Last name',
            prefixIcon: widget.theme.userDetailsConfig.lastNamePrefix,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            validator: (v) => Validators.required(v, 'Last name'),
          ),
          SizedBox(height: sizes.md),
          FxTextField(
            controller: _emailController,
            prefixIcon: widget.theme.userDetailsConfig.emailPrefix,
            label: 'Email (optional)',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: sizes.lg),
          FxButton(
            label: widget.theme.userDetailsConfig.buttonLabel,
            isLoading: widget.isLoading,
            onPressed: () async {
              if (!(_formKey.currentState?.validate() ?? false)) return;

              await widget.onSubmit(
                email: _emailController.text,
                lastName: _lastNameController.text,
                firstName: _firstNameController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
