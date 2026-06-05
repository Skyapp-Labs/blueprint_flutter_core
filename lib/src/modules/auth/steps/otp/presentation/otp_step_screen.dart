import 'package:blueprint_flutter_core/src/core/widgets/feedback/_feedback.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart' show BaseStep;
import 'package:blueprint_flutter_core/src/modules/auth/steps/otp/otp_step_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/widgets/fx_otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpStepScreen extends ConsumerStatefulWidget {
  const OtpStepScreen({
    super.key,
    required this.view
  });

  final BaseStep view;

  @override
  ConsumerState<OtpStepScreen> createState() => _OtpStepScreenState();
}

class _OtpStepScreenState extends ConsumerState<OtpStepScreen> {
  
  final GlobalKey<FxOtpInputState> otpKey = GlobalKey<FxOtpInputState>();

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

    final controller = ref.read(otpStepControllerProvider.notifier);
    final state = ref.watch(otpStepControllerProvider);

    return widget.view.build(
      context, 
      children: [
        FxOtpInput(
          key: otpKey,
          controller: widget.view.textController,
          errorText: state.error,
          onCompleted: (otp) async {
            controller.setOtp(otp);
            await controller.verifyOtp();
          },
        ),
        FxCountdownAction(
          prefixText: 'Resend code',
          actionText: 'Resend',
          countdownPrefixText: 'Resend in',
          duration: Duration(seconds: 30),
          onPressed: controller.resendOtp,
        ),
      ]
    );
  }
}
