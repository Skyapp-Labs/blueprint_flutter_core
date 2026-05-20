import 'package:blueprint_flutter_core/src/core/widgets/display/_display.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:flutter/material.dart';

class FxOtpEntryStyle {
  const FxOtpEntryStyle({
    this.otpLength = 6,
    this.title = 'Verify your number',
    this.subtitle = 'Enter the code sent to {{phone}}',
    this.buttonLabel = 'Verify',
    this.changeNumberLabel = 'Change number',
    this.resendCooldownSeconds = 60,
    this.resendPrefixText = "Didn't receive a code?",
    this.resendActionText = 'Resend',
    this.resendCountdownPrefixText = 'Resend in',
    this.invalidCodeMessage = 'Invalid code, please try again',
    this.expiredCodeMessage = 'Code expired, please request a new one',
    this.keyboardBuilder,
    this.header,
    this.titleStyle,
    this.subtitleStyle,
    this.footer,
    this.safeArea = const FxSafeAreaInsets(),
    this.padding = EdgeInsets.zero,
    this.spacing,
    this.titleSpacing,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
  });

  /// The title text for the otp verification screen.
  final String? title;
  final double? titleSpacing;
  final FxTextStyle? titleStyle;
  /// The subtitle text with {{phone}} placeholder for the phone number.
  /// Example: 'Enter the code sent to {{phone}}'
  final String? subtitle;
  final FxTextStyle? subtitleStyle;
  /// The header widget for the otp verification screen.
  final Widget Function(String phone, VoidCallback onChangeNumber)? header;
  /// The footer widget for the otp verification screen.
  final Widget Function(VoidCallback onChangeNumber)? footer;
  /// The safe area for the otp verification screen.
  final FxSafeAreaInsets safeArea;
  /// The padding for the otp verification screen.
  final EdgeInsets padding;
  /// The spacing for the otp verification screen.
  final double? spacing;
  /// The main axis alignment for the otp verification screen.
  final MainAxisAlignment mainAxisAlignment;
  /// The cross axis alignment for the otp verification screen.
  final CrossAxisAlignment crossAxisAlignment;
  /// The button label for the verify button.
  final String buttonLabel;
  /// The label for the change number button.
  final String changeNumberLabel;
  /// The length of the otp code.
  final int otpLength;
  /// The cooldown seconds for the resend code button.
  final int resendCooldownSeconds;
  /// The prefix text for the resend code button.
  final String resendPrefixText;
  /// The message text for the invalid code.
  final String invalidCodeMessage;
  /// The message text for the expired code.
  final String expiredCodeMessage;
  /// The action text for the resend code button.
  final String resendActionText;
  /// The prefix text for the resend countdown.
  final String resendCountdownPrefixText;
  /// The keyboard builder for the otp verification screen.
  final Widget Function(TextEditingController otpController)? keyboardBuilder;
}