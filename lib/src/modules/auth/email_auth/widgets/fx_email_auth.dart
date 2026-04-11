import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:skyapp_flutter_core/src/modules/auth/core/controllers/auth_controller.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/controllers/email_auth_flow_controller.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/controllers/email_auth_flow_state.dart' show FxEmailAuthStep;
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/widgets/_login_step.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/widgets/_register_step.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/widgets/forgot_password/fx_forgot_password_data.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/widgets/forgot_password/fx_forgot_password_widget.dart';

part './fx_email_auth_theme.dart';


class FxEmailAuth extends ConsumerStatefulWidget {
  const FxEmailAuth({
    super.key,
    this.theme = const FxEmailAuthTheme(),
    this.header,
    this.footer,
    this.onAuthSuccess,
  });

  final FxEmailAuthTheme theme;
  final Widget Function(BuildContext context, FxEmailAuthStep step)? header;
  final Widget Function(BuildContext context, FxEmailAuthStep step)? footer;
  final VoidCallback? onAuthSuccess;

  @override
  ConsumerState<FxEmailAuth> createState() => _FxEmailAuthWidgetState();
}

class _FxEmailAuthWidgetState extends ConsumerState<FxEmailAuth> {
  FxEmailAuthStep? _previousStep;

  Widget transitionBuilder(Widget child, Animation<double> animation, FxEmailAuthStep currentStep) {
    final isForward = (_previousStep?.index ?? 0) < currentStep.index;
    return SlideTransition(
      position: Tween<Offset>(
        begin: isForward ? const Offset(1, 0) : const Offset(-1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final flow      = ref.watch(emailAuthFlowControllerProvider);
    final authState = ref.watch(authControllerProvider);
    final flowCtrl  = ref.read(emailAuthFlowControllerProvider.notifier);

    ref.listen(
      emailAuthFlowControllerProvider.select((s) => s.step),
      (prev, _) => setState(() => _previousStep = prev),
    );

    ref.listen(
      authControllerProvider,
      (_, next) {
        if (next.isAuthenticated) widget.onAuthSuccess?.call();
      },
    );

    ref.listen(authControllerProvider, (prev, next) {
      if (next.hasError && prev?.hasError != true) {
        // _otpKey.currentState?.triggerError();
      }
    });

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) => transitionBuilder(child, anim, flow.step),
          child: switch (flow.step) {
            FxEmailAuthStep.login => LoginStep(
              onForgotPassword: () => flowCtrl.goToStep(FxEmailAuthStep.forgotPassword),
              onSignUp: () => flowCtrl.goToStep(FxEmailAuthStep.register),
              theme: widget.theme,
              onSubmit: flowCtrl.login,
              isLoading: authState.isLoading,
            ),
            FxEmailAuthStep.register => RegisterStep(
              theme: widget.theme,
              onSubmit: flowCtrl.registerWithEmail,
              onLogin: () => flowCtrl.goToStep(FxEmailAuthStep.login),
              onBack: () => flowCtrl.goToStep(_previousStep ?? FxEmailAuthStep.login),
              isLoading: authState.isLoading,
            ),
            FxEmailAuthStep.forgotPassword => FxForgotPasswordWidget(
              data: FxForgotPasswordData(
                enterEmailTitle: 'Forgot Password',
                enterEmailSubtitle: 'Enter your email to receive a reset PIN',
                enterEmailButtonLabel: 'Send Reset PIN',
              ),
              onSuccess: () => flowCtrl.goToStep(FxEmailAuthStep.login),
              onError: (error) => flowCtrl.goToStep(FxEmailAuthStep.login),
            ),
          },
        );
    // return Column(
    //   // mainAxisSize: MainAxisSize.max,
    //   // mainAxisAlignment: MainAxisAlignment.end,
    //   children: [
    //     if (widget.header != null) widget.header!(context, flow.step),
    //     if (widget.footer != null) widget.footer!(context, flow.step),
    //   ],
    // );
  }
}
