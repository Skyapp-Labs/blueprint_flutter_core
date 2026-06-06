import 'package:blueprint_flutter_core/src/core/widgets/feedback/_feedback.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/otp/otp_step_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/widgets/fx_otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpStepScreen extends ConsumerStatefulWidget {
  const OtpStepScreen({
    super.key,
    required this.template,
  });

  final OtpStepTemplate template;

  @override
  ConsumerState<OtpStepScreen> createState() => _OtpStepScreenState();
}

class _OtpStepScreenState extends ConsumerState<OtpStepScreen> {
  final _otpKey = GlobalKey<FxOtpInputState>();
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(otpStepControllerProvider.notifier);
    final state = ref.watch(otpStepControllerProvider);

    return widget.template.buildShell(
      context: context,
      ref: ref,
      body: [
        FxOtpInput(
          key: _otpKey,
          controller: _otpController,
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
          duration: const Duration(seconds: 30),
          onPressed: controller.resendOtp,
        ),
      ],
    );
  }
}
