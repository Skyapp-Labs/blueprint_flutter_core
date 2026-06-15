import 'package:blueprint_flutter_core/src/core/widgets/buttons/_buttons.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/forgot_password/forgot_password_step_controller.dart';
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

    final isLoading = ref.watch(forgotPasswordStepControllerProvider
      .select((s) => s.isLoading));

    return widget.template.buildShell(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: sizes.md,
          children: [
            FxTextField(
              controller: _emailController,
              initialValue: null,
              decoration: InputDecoration(
                hintText: 'Enter your email',
              )
            ),
            FxButton(
              label: widget.template.actionLabel,
              isLoading: isLoading,
              onPressed: _onSubmit,
            ),
          ],
        ),
      )
    );
  }

  void _onSubmit() {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();
    final controller = ref.read(forgotPasswordStepControllerProvider.notifier);
    controller.setEmail(_emailController.text);
    controller.sendResetPasswordEmail();
  }
}
