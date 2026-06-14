import 'package:blueprint_flutter_core/src/modules/auth/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_step.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_method.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/auth_flow_controller.dart';

class AuthFlowScreen extends ConsumerStatefulWidget {
  const AuthFlowScreen({
    super.key,
    this.onStepChange,
    this.onAuthSuccess,
    required this.authMethod,
    this.templates = const AuthStepTemplates(),
  });

  final VoidCallback? onAuthSuccess;
  final AuthMethod authMethod;
  final void Function(AuthStep? previousStep, AuthStep? currentStep)? onStepChange;
  final AuthStepTemplates templates;

  @override
  ConsumerState<AuthFlowScreen> createState() => _AuthFlowScreenState();
}

class _AuthFlowScreenState extends ConsumerState<AuthFlowScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _updateAuthMethod(widget.authMethod)
    );
  }
  
  @override
  void didUpdateWidget(AuthFlowScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.authMethod != oldWidget.authMethod) {
      _updateAuthMethod(widget.authMethod);
    }
  }

  void _updateAuthMethod(AuthMethod authMethod) {
    ref.read(authFlowControllerProvider.notifier).setAuthMethod(authMethod);
  }

  @override
  Widget build(BuildContext context) {
    final flow      = ref.watch(authFlowControllerProvider);

    ref.listen(
      authFlowControllerProvider.select((s) => s.step),
      (prev, next) => widget.onStepChange?.call(prev, next),
    );

    ref.listen(authControllerProvider, (_, next) {
      if (next.isAuthenticated) widget.onAuthSuccess?.call();
    });

    if (flow.step == null) return const SizedBox.shrink();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) => transitionBuilder(
        child: child, 
        animation: anim, 
        currentStep: flow.step!, 
        previousStep: flow.previousStep,
      ),
      child: _buildStep(flow.step!),
    );
  }

  Widget _buildStep(AuthStep step) => switch (step) {
    AuthStep.phone => PhoneStepScreen(
      template: widget.templates.phone,
    ),
    AuthStep.emailAndPassword => EmailStepScreen(
      template: widget.templates.email,
    ),
    AuthStep.otp => OtpStepScreen(
      template: widget.templates.otp,
    ),
    AuthStep.signup => SignupStepScreen(
      template: widget.templates.signup,
    ),
    AuthStep.forgotPassword => ForgotPasswordStepScreen(
      template: widget.templates.forgotPassword,
    ),
    AuthStep.verifyResetPassword => Text('Verify Reset Password'),
    AuthStep.resetPassword => Text('Reset Password'),
  };

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