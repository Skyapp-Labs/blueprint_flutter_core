import 'package:blueprint_flutter_core/src/modules/auth/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_step.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/auth_flow_controller.dart';

class AuthFlowScreen extends ConsumerWidget {
  const AuthFlowScreen({
    super.key,
    this.onStepChange,
    this.onAuthSuccess,
    this.templates = const AuthStepTemplates(),
  });

  final VoidCallback? onAuthSuccess;
  final void Function(AuthStep? previousStep, AuthStep? currentStep)? onStepChange;
  final AuthStepTemplates templates;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flow      = ref.watch(authFlowControllerProvider);

    ref.listen(
      authFlowControllerProvider.select((s) => s.step),
      (prev, next) => onStepChange?.call(prev, next),
    );

    ref.listen(authControllerProvider, (_, next) {
      if (next.isAuthenticated) onAuthSuccess?.call();
    });

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) => transitionBuilder(
        child: child, 
        animation: anim, 
        currentStep: flow.step, 
        previousStep: flow.previousStep,
      ),
      child: switch (flow.step) {
        AuthStep.phone => PhoneStepScreen(
          template: templates.phone,
        ),
        AuthStep.emailAndPassword => EmailStepScreen(
          template: templates.email,
        ),
        AuthStep.otp => OtpStepScreen(
          template: templates.otp,
        ),
        AuthStep.signup => SignupStepScreen(
          template: templates.signup,
        ),
        AuthStep.forgotPassword => ForgotPasswordStepScreen(
          template: templates.forgotPassword,
        ),
        AuthStep.verifyResetPassword => Text('Verify Reset Password'),
        AuthStep.resetPassword => Text('Reset Password'),
      }
    );
  }

  Widget transitionBuilder({
    required Widget child, 
    required Animation<double> animation, 
    required AuthStep currentStep, 
    AuthStep? previousStep,
  }) {
    final isForward = (previousStep?.stepIndex ?? 0) < currentStep.stepIndex;

    return SlideTransition(
      position: Tween<Offset>(
        begin: isForward ? const Offset(1, 0) : const Offset(-1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
      child: child,
    );
  }
}