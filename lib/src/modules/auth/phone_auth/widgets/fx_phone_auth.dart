import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:skyapp_flutter_core/src/core/widgets/display/fx_country_flag.dart';
import 'package:skyapp_flutter_core/src/core/widgets/feedback/_index.dart';
import 'package:skyapp_flutter_core/src/core/widgets/fx_context.dart';
import 'package:skyapp_flutter_core/src/core/widgets/inputs/_index.dart';
import 'package:skyapp_flutter_core/src/modules/auth/core/controllers/auth_controller.dart';
import 'package:skyapp_flutter_core/src/modules/auth/phone_auth/controllers/phone_auth_flow_controller.dart';
import 'package:skyapp_flutter_core/src/modules/auth/phone_auth/controllers/phone_auth_flow_state.dart' show FxPhoneAuthStep;
import 'package:skyapp_flutter_core/src/modules/auth/phone_auth/models/user_details_input.dart';

import 'package:skyapp_flutter_core/src/modules/auth/phone_auth/widgets/_user_details_step.dart';
import 'package:skyapp_flutter_core/src/modules/auth/phone_auth/widgets/_otp_verification_step.dart';
import 'package:skyapp_flutter_core/src/modules/auth/phone_auth/widgets/_phone_entry_step.dart';

part 'fx_otp_input.dart';
part 'fx_phone_auth_theme.dart';

class FxPhoneAuth extends ConsumerStatefulWidget {
  const FxPhoneAuth({
    super.key,
    this.theme = const FxPhoneAuthTheme(),
    this.header,
    this.footer,
    this.onAuthSuccess,
  });

  final FxPhoneAuthTheme theme;
  final Widget Function(BuildContext context, FxPhoneAuthStep step)? header;
  final Widget Function(BuildContext context, FxPhoneAuthStep step)? footer;
  final VoidCallback? onAuthSuccess;

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

    return Column(
      children: [
        if (widget.header != null) widget.header!(context, flow.step),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) => transitionBuilder(child, anim, flow.step),
          child: switch (flow.step) {
            FxPhoneAuthStep.enterPhone => PhoneStep(
              theme: widget.theme,
              onSubmit: flowCtrl.sendOtp,
              isLoading: authState.isLoading,
            ),
            FxPhoneAuthStep.enterOtp => OtpStep(
              error: authState.error,
              phone: flow.phone ?? '',
              otpKey: _otpKey,
              onResend: flowCtrl.resendOtp,
              isLoading: authState.isLoading,
              phoneTheme: widget.theme,
              onCompleted: flowCtrl.verifyOtp,
              onChangeNumber: flowCtrl.goBack,
            ),
            FxPhoneAuthStep.enterDetails => DetailsStep(
              theme: widget.theme,
              onSubmit: flowCtrl.register,
              isLoading: authState.isLoading,
            ),
          },
        ),
        if (widget.footer != null) widget.footer!(context, flow.step),
      ],
    );
  }
}
