import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordStepScreen extends ConsumerStatefulWidget {
  const ForgotPasswordStepScreen({
    super.key,
    required this.view
  });

  final ForgotPasswordStep view;

  @override
  ConsumerState<ForgotPasswordStepScreen> createState() => _ForgotPasswordStepScreenState();
}

class _ForgotPasswordStepScreenState extends ConsumerState<ForgotPasswordStepScreen> with FxUiToolkit {
  
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.view.setTextController(TextEditingController());
  }

  @override
  void dispose() {
    widget.view.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);
    
    widget.view.initView(context);

    // final controller = ref.read(otpStepControllerProvider.notifier);
    // final state = ref.watch(otpStepControllerProvider);

    return widget.view.build(
      context, 
      children: [
        _buildEmailForm()
      ]
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
          // prefixIcon: stepTheme.emailPrefix,
          // label: widget.theme.showInputLabel ? 'Email' : null,
          hint: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          // validator: Validators.email,
        ),
      ],
    ),
  );
}
