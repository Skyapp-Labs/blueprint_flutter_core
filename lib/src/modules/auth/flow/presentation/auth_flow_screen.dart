import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/modules/auth/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/entities/user.dart';
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

  final void Function(User user, bool isNewUser)? onAuthSuccess;
  final AuthMethod authMethod;
  final void Function(AuthStep? previousStep, AuthStep? currentStep)? onStepChange;
  final AuthStepTemplates templates;

  @override
  ConsumerState<AuthFlowScreen> createState() => _AuthFlowScreenState();
}

class _AuthFlowScreenState extends ConsumerState<AuthFlowScreen> with FxUiToolkit {

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
    setToolkitContext(context);
    final flow      = ref.watch(authFlowControllerProvider);

    ref.listen(
      authFlowControllerProvider.select((s) => s.step),
      (prev, next) => widget.onStepChange?.call(prev, next),
    );

    ref.listen(authControllerProvider, (_, next) {
      if (next.isAuthenticated) {
        widget.onAuthSuccess?.call(next.user!, next.isNewUser);
      }
    });

    if (flow.step == null) return const SizedBox.shrink();

    final transitionTheme = componentTheme.switchingViewTransition();

    return AnimatedSwitcher(
      duration: transitionTheme.duration,
      switchInCurve: transitionTheme.switchInCurve,
      switchOutCurve: transitionTheme.switchOutCurve,
      transitionBuilder: (child, animation) {
        // final isForward = (flow.previousStep?.stepIndex ?? 0) < flow.step!.stepIndex;

        return componentTheme
          .switchingViewTransition(isForward: false)
          .transitionBuilder(child, animation);
      },
      layoutBuilder: transitionTheme.layoutBuilder,
      reverseDuration: transitionTheme.reverseDuration,
      child: _buildStep(flow.step!, widget.templates.copyWith(context: context, ref: ref)),
    );
  }

  Widget _buildStep(AuthStep step, AuthStepTemplates templates) => switch (step) {
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
  };
}