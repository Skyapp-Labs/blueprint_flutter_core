import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart' show BaseStep;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupStepScreen extends ConsumerStatefulWidget {
  const SignupStepScreen({
    super.key,
    required this.view
  });

  final BaseStep view;

  @override
  ConsumerState<SignupStepScreen> createState() => _SignupStepScreenState();
}

class _SignupStepScreenState extends ConsumerState<SignupStepScreen> {

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
    widget.view.initView(context);

    return widget.view.build(
      context, 
      children: [
      ]
    );
  }
}
