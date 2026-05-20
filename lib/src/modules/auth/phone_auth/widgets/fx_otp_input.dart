import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/core/widgets/feedback/_feedback.dart';

/// A 6-digit OTP input with a resend countdown.
///
/// Composes [FxPinInput] for digit entry and [FxCountdownAction] for the
/// resend timer. Call [FxOtpInputState.triggerError] via a [GlobalKey] to
/// shake the cells and clear the input on a wrong code.
///
/// Example:
/// ```dart
/// FxOtpInput(
///   key: _otpKey,
///   onCompleted: (code) async => await verifyOtp(code),
///   onResend: () async => await resendOtp(),
/// )
///
/// // On wrong code:
/// _otpKey.currentState?.triggerError();
/// ```
class FxOtpInput extends StatefulWidget {
  const FxOtpInput({
    super.key,
    required this.onCompleted,
    this.length = 6,
    this.pinTheme,
    this.autoFocus = true,
    this.errorText,
    this.controller,
  });

  final Future<void> Function(String) onCompleted;
  final int length;
  final FxPinInputTheme? pinTheme;
  final bool autoFocus;
  final String? errorText;
  final TextEditingController? controller;

  @override
  State<FxOtpInput> createState() => FxOtpInputState();
}

class FxOtpInputState extends State<FxOtpInput> with FxUiToolkit {
  final _pinKey = GlobalKey<FxPinInputState>();

  /// Clears all cells and triggers the shake animation.
  void triggerError() => _pinKey.currentState?.triggerError();

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FxPinInput(
          key: _pinKey,
          controller: widget.controller,
          onCompleted: widget.onCompleted,
          length: widget.length,
          theme: widget.pinTheme,
          autoFocus: widget.autoFocus,
        ),
        AnimatedOpacity(
          opacity: widget.errorText == null ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Text(
            widget.errorText ?? '',
            style: typography.bodySmall.copyWith(color: colorScheme.error),
            textAlign: TextAlign.center,
          )
        )
      ],
    );
  }
}
