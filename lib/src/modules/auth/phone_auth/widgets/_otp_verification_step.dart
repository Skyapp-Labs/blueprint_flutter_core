import 'package:blueprint_flutter_core/src/core/widgets/feedback/_feedback.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_text.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/fx_phone_auth.dart';

class OtpStep extends StatelessWidget with FxUiToolkit {
  OtpStep({
    super.key,
    required this.otpTheme,
    required this.phone,
    required this.otpKey,
    required this.onCompleted,
    required this.onResend,
    required this.onChangeNumber,
    required this.isLoading,
    this.error,
  });

  final OtpVerificationConfig otpTheme;
  final String phone;
  final GlobalKey<FxOtpInputState> otpKey;
  final Future<void> Function(String code) onCompleted;
  final Future<void> Function() onResend;
  final VoidCallback onChangeNumber;
  final bool isLoading;
  final String? error;

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final hasTopContent = (
      otpTheme.title != null || 
      otpTheme.subtitle != null
    );

    return FxScrollableForm(
      key: const ValueKey('otp'),
      header: otpTheme.header?.call(phone, onChangeNumber),
      footer: _buildFooter(),
      safeArea: otpTheme.safeArea,
      padding: otpTheme.padding,
      spacing: otpTheme.spacing,
      mainAxisAlignment: otpTheme.mainAxisAlignment,
      crossAxisAlignment: otpTheme.crossAxisAlignment,
      children: [
        if(hasTopContent) ...[
          _buildTopContent(),
          SizedBox(height: sizes.xs),
        ],
        FxOtpInput(
          key: otpKey,
          onCompleted: onCompleted,
          controller: otpController,
          errorText: error,
        ),

        FxCountdownAction(
          prefixText: otpTheme.resendPrefixText,
          actionText: otpTheme.resendActionText,
          countdownPrefixText: otpTheme.resendCountdownPrefixText,
          duration: Duration(seconds: otpTheme.resendCooldownSeconds),
          onPressed: onResend,
        ),
      ],
    );
  }

  Widget? _buildFooter() {
    final footer = otpTheme.footer;
    final keyboardBuilder = otpTheme.keyboardBuilder;

    if (footer == null && keyboardBuilder == null) return null;

    if (footer != null && keyboardBuilder == null) return footer.call(onChangeNumber);

    if (keyboardBuilder != null && footer == null) return keyboardBuilder.call(otpController);

    return Column(
      spacing: sizes.xs,
      children: [
        keyboardBuilder!.call(otpController),
        footer!.call(onChangeNumber),
      ]
    );
  }

  Widget _buildTopContent() {
    Widget? title;
    Widget? subtitle;

    if (otpTheme.title != null) {
      title = FxText(
        otpTheme.title!.replaceAll('{{phone}}', '[$phone]'),
        style: otpTheme.titleStyle ?? FxTextStyle.fromStyle(typography.headlineSmall).copyWith(
          textAlign: TextAlign.center,
        ),
        textAlign: TextAlign.center,
        onTap: (index, text) => onChangeNumber(),
      );
    }

    if (otpTheme.subtitle != null) {
      subtitle = FxText(
        otpTheme.subtitle!.replaceAll('{{phone}}', '[$phone]'),
        style: otpTheme.subtitleStyle ?? FxTextStyle.fromStyle(typography.bodyMedium).copyWith(
          textAlign: TextAlign.center,
        ),
        textAlign: TextAlign.center,
        onTap: (index, text) => onChangeNumber(),
      );
    }

    if (title == null && subtitle == null) return const SizedBox.shrink();

    return Column(
      spacing: otpTheme.titleSpacing ?? sizes.sm,
      crossAxisAlignment: otpTheme.crossAxisAlignment,
      children: [
        title!,
        subtitle!,
      ],
    );
  }


}
