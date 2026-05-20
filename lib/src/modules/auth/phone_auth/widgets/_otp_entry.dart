import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_text.dart';
import 'package:blueprint_flutter_core/src/core/widgets/feedback/_feedback.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/fx_otp_input.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/styles/fx_otp_entry_style.dart';

class OtpEntry extends StatelessWidget with FxUiToolkit {
  OtpEntry({
    super.key,
    required this.style,
    required this.phone,
    required this.otpKey,
    required this.onCompleted,
    required this.onResend,
    required this.onChangeNumber,
    required this.isLoading,
    this.error,
  });

  final FxOtpEntryStyle style;
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
      style.title != null || 
      style.subtitle != null
    );

    return FxScrollableForm(
      key: const ValueKey('otp'),
      header: style.header?.call(phone, onChangeNumber),
      footer: _buildFooter(),
      safeArea: style.safeArea,
      padding: style.padding,
      spacing: style.spacing,
      mainAxisAlignment: style.mainAxisAlignment,
      crossAxisAlignment: style.crossAxisAlignment,
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
          prefixText: style.resendPrefixText,
          actionText: style.resendActionText,
          countdownPrefixText: style.resendCountdownPrefixText,
          duration: Duration(seconds: style.resendCooldownSeconds),
          onPressed: onResend,
        ),
      ],
    );
  }

  Widget? _buildFooter() {
    final footer = style.footer;
    final keyboardBuilder = style.keyboardBuilder;

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

    if (style.title != null) {
      title = FxText(
        style.title!.replaceAll('{{phone}}', '[$phone]'),
        style: style.titleStyle ?? FxTextStyle.fromStyle(typography.headlineSmall).copyWith(
          textAlign: TextAlign.center,
        ),
        textAlign: TextAlign.center,
        onTap: (index, text) => onChangeNumber(),
      );
    }

    if (style.subtitle != null) {
      subtitle = FxText(
        style.subtitle!.replaceAll('{{phone}}', '[$phone]'),
        style: style.subtitleStyle ?? FxTextStyle.fromStyle(typography.bodyMedium).copyWith(
          textAlign: TextAlign.center,
        ),
        textAlign: TextAlign.center,
        onTap: (index, text) => onChangeNumber(),
      );
    }

    if (title == null && subtitle == null) return const SizedBox.shrink();

    return Column(
      spacing: style.titleSpacing ?? sizes.sm,
      crossAxisAlignment: style.crossAxisAlignment,
      children: [
        title!,
        subtitle!,
      ],
    );
  }


}
