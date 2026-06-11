import 'package:blueprint_flutter_core/src/core/widgets/buttons/_buttons.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_text.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_step.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/email/email_step_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailStepScreen extends ConsumerStatefulWidget {
  const EmailStepScreen({
    super.key,
    required this.template,
  });

  final EmailStepTemplate template;

  @override
  ConsumerState<EmailStepScreen> createState() => _EmailStepScreenState();
}

class _EmailStepScreenState extends ConsumerState<EmailStepScreen>
    with FxUiToolkit {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return widget.template.buildShell(
      context: context,
      ref: ref,
      children: [
        _buildEmailForm(),
        _buildActions(),
      ],
    );
  }

  Widget _buildEmailForm() => Form(
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
            FxPasswordField(
              controller: _passwordController,
              initialValue: null,
              decoration: InputDecoration(
                hintText: 'Enter your password',
              )
            ),
          ],
        ),
      );

  Widget _buildActions() => Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: FxText(
              '[Forgot password]',
              textAlign: TextAlign.right,
              padding: EdgeInsets.symmetric(vertical: sizes.md),
              onTap: (_, _) => ref.goToAuthStep(AuthStep.forgotPassword),
            ),
          ),
          FxButton(
            label: widget.template.actionLabel,
            isLoading: ref.watch(emailStepControllerProvider).isLoading,
            onPressed: _onSubmit,
          ),
        ],
      );

  void _onSubmit() {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();
    final controller = ref.read(emailStepControllerProvider.notifier);
    controller.setEmail(_emailController.text);
    controller.setPassword(_passwordController.text);
    controller.login();
  }
}
