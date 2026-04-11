import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:skyapp_flutter_core/src/core/widgets/fx_context.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/controllers/forgot_password_flow_controller.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/controllers/forgot_password_flow_state.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/widgets/forgot_password/_enter_email_step.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/widgets/forgot_password/_new_password_step.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/widgets/forgot_password/_verify_pin_step.dart';
import 'package:skyapp_flutter_core/src/modules/auth/email_auth/widgets/forgot_password/fx_forgot_password_data.dart';

/// Multi-step forgot password widget.
///
/// Orchestrates 3 steps:
///   1. [EnterEmailStep]   — user submits email
///   2. [VerifyPinStep]    — user enters PIN from email
///   3. [NewPasswordStep]  — user sets new password
///
/// Consumes [ForgotPasswordFlowController] for all business logic.
class FxForgotPasswordWidget extends ConsumerStatefulWidget {
  const FxForgotPasswordWidget({
    super.key,
    this.data = const FxForgotPasswordData(),
    this.header,
    this.onSuccess,
    this.onError,
  });

  final FxForgotPasswordData data;
  final Widget? header;
  final VoidCallback? onSuccess;
  final void Function(String error)? onError;

  @override
  ConsumerState<FxForgotPasswordWidget> createState() =>
      _FxForgotPasswordWidgetState();
}

class _FxForgotPasswordWidgetState extends ConsumerState<FxForgotPasswordWidget> with FxUiToolkit {
  ForgotPasswordStep? _previousStep;
  final _pinStepKey = GlobalKey<VerifyPinStepState>();

  Widget _transitionBuilder(
    Widget child,
    Animation<double> animation,
    ForgotPasswordStep currentStep,
  ) {
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
    setToolkitContext(context);

    final flow = ref.watch(forgotPasswordFlowControllerProvider);
    final ctrl = ref.read(forgotPasswordFlowControllerProvider.notifier);

    ref.listen(
      forgotPasswordFlowControllerProvider.select((s) => s.step),
      (prev, _) => setState(() => _previousStep = prev),
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) => _transitionBuilder(child, anim, flow.step),
      child: switch (flow.step) {
        ForgotPasswordStep.enterEmail => EnterEmailStep(
          data: widget.data,
          isLoading: flow.isLoading,
          error: flow.error,
          onSubmit: ctrl.sendResetPin,
        ),
        ForgotPasswordStep.verifyPin => VerifyPinStep(
          key: _pinStepKey,
          data: widget.data,
          email: flow.email ?? '',
          isLoading: flow.isLoading,
          error: flow.error,
          onSubmit: ctrl.verifyPin,
          onResend: () => ctrl.sendResetPin(flow.email ?? ''),
        ),
        ForgotPasswordStep.newPassword => NewPasswordStep(
          data: widget.data,
          isLoading: flow.isLoading,
          error: flow.error,
          onSubmit: (newPassword) async {
            final success = await ctrl.resetPassword(newPassword);
            if (success) {
              widget.onSuccess?.call();
            } else if (flow.error != null) {
              widget.onError?.call(flow.error!);
            }
          },
        ),
      },
    );
  }
}
