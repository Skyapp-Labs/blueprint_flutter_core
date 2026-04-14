import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_text.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/fx_phone_auth.dart';

class OtpStep extends StatelessWidget with FxUiToolkit {
  OtpStep({
    super.key,
    required this.phoneTheme,
    required this.phone,
    required this.otpKey,
    required this.onCompleted,
    required this.onResend,
    required this.onChangeNumber,
    required this.isLoading,
    this.error,
  });

  final FxPhoneAuthTheme phoneTheme;
  final String phone;
  final GlobalKey<FxOtpInputState> otpKey;
  final Future<void> Function(String code) onCompleted;
  final Future<void> Function() onResend;
  final VoidCallback onChangeNumber;
  final bool isLoading;
  final String? error;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Column(
      key: const ValueKey('otp'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          phoneTheme.otpVerificationConfig.title,
          style: typography.headlineSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: sizes.sm),
        FxText(
          phoneTheme.otpVerificationConfig.subtitle.replaceAll('{{phone}}', '[$phone]'),
          style: FxTextStyle.fromStyle(typography.bodyMedium).copyWith(
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: sizes.xl),
        FxOtpInput(
          key: otpKey,
          onCompleted: onCompleted,
          onResend: onResend,
          errorText: error,
          resendPrefixText: phoneTheme.otpVerificationConfig.resendPrefixText,
          resendActionText: phoneTheme.otpVerificationConfig.resendActionText,
          resendCountdownPrefixText: phoneTheme.otpVerificationConfig.resendCountdownPrefixText,
        ),
        if (isLoading) const Center(child: CircularProgressIndicator()),
        FxButton(
          label: phoneTheme.otpVerificationConfig.changeNumberLabel,
          onPressed: onChangeNumber,
          isLoading: isLoading,
          variant: FxButtonVariant.text,
        ),
      ],
    );
  }
}
