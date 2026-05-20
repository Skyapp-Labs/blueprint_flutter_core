import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/modules/auth/core/controllers/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/styles/_styles.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/controllers/phone_auth_flow_state.dart' show FxPhoneAuthStep;
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/controllers/phone_auth_flow_controller.dart';

import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/_otp_entry.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/fx_otp_input.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/_phone_entry.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/_register_entry.dart';

class FxPhoneAuth extends ConsumerStatefulWidget {
  const FxPhoneAuth({
    super.key,
    this.onAuthSuccess,
    this.otpEntryStyle = const FxOtpEntryStyle(),
    this.phoneEntryStyle = const FxPhoneEntryStyle(),
    this.registerEntryStyle = const FxRegisterEntryStyle(),
  });

  final VoidCallback? onAuthSuccess;
  final FxOtpEntryStyle otpEntryStyle;
  final FxPhoneEntryStyle phoneEntryStyle;
  final FxRegisterEntryStyle registerEntryStyle;

  @override
  ConsumerState<FxPhoneAuth> createState() => _FxPhoneAuthWidgetState();
}

class _FxPhoneAuthWidgetState extends ConsumerState<FxPhoneAuth> {
  FxPhoneAuthStep? _previousStep;
  final _otpKey = GlobalKey<FxOtpInputState>();

  @override
  void dispose() {
    _otpKey.currentState?.dispose();
    super.dispose();
  }

  Widget transitionBuilder(Widget child, Animation<double> animation, FxPhoneAuthStep currentStep) {
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
    final flow      = ref.watch(phoneAuthFlowControllerProvider);
    final authState = ref.watch(authControllerProvider);
    final flowCtrl  = ref.read(phoneAuthFlowControllerProvider.notifier);

    ref.listen(
      phoneAuthFlowControllerProvider.select((s) => s.step),
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
        _otpKey.currentState?.triggerError();
      }
    });

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) => transitionBuilder(child, anim, flow.step),
      child: switch (flow.step) {
        FxPhoneAuthStep.enterPhone => PhoneEntry(
          style: widget.phoneEntryStyle,
          onSubmit: flowCtrl.sendOtp,
          isLoading: authState.isLoading,
        ),
        FxPhoneAuthStep.enterOtp => OtpEntry(
          error: authState.error,
          phone: flow.phone ?? '',
          otpKey: _otpKey,
          onResend: flowCtrl.resendOtp,
          isLoading: authState.isLoading,
          style: widget.otpEntryStyle,
          onCompleted: flowCtrl.verifyOtp,
          onChangeNumber: flowCtrl.goBack,
        ),
        FxPhoneAuthStep.enterDetails => RegisterEntry(
          style: widget.registerEntryStyle,
          onSubmit: flowCtrl.register,
          isLoading: authState.isLoading,
        ),
      },
    );
  }
}
