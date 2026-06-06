import 'package:blueprint_flutter_core/src/core/widgets/buttons/_buttons.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordStepScreen extends ConsumerStatefulWidget {
  const ForgotPasswordStepScreen({
    super.key,
    required this.template,
  });

  final ForgotPasswordStepTemplate template;

  @override
  ConsumerState<ForgotPasswordStepScreen> createState() =>
      _ForgotPasswordStepScreenState();
}

class _ForgotPasswordStepScreenState extends ConsumerState<ForgotPasswordStepScreen>
    with FxUiToolkit {
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

    return widget.template.buildShell(
      context: context,
      ref: ref,
      body: [
        _buildEmailForm(),
      ],
    );
  }

  Widget _buildEmailForm() {
    final 
  }
  Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: sizes.md,
          children: [
            FxTextField(
              controller: _emailController,
              hint: 'Enter your email',
              onSaved: (value) {

              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
            ),
            FxButton(
              label: widget.template.actionLabel,
              isLoading: ref.watch(forgotPasswordStepControllerProvider).isLoading,
              onPressed: ref.read(forgotPasswordStepControllerProvider.notifier).sendResetPasswordEmail,
            ),
          ],
        ),
      );
}
