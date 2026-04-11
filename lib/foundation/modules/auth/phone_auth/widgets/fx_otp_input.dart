part of 'fx_phone_auth.dart';

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
    this.onResend,
    this.length = 6,
    this.resendCooldownSeconds = 60,
    this.pinTheme,
    this.autoFocus = true,
    this.errorText,
    this.resendPrefixText = "Didn't receive a code?",
    this.resendActionText = 'Resend',
    this.resendCountdownPrefixText = 'Resend in',
  });

  final Future<void> Function(String) onCompleted;
  final Future<void> Function()? onResend;
  final int length;
  final int resendCooldownSeconds;
  final FxPinInputTheme? pinTheme;
  final bool autoFocus;
  final String? errorText;
  final String resendPrefixText;
  final String resendActionText;
  final String resendCountdownPrefixText;

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
          onCompleted: widget.onCompleted,
          length: widget.length,
          theme: widget.pinTheme,
          autoFocus: widget.autoFocus,
        ),
        if (widget.errorText != null) ...[
          SizedBox(height: sizes.xs),
          Text(
            widget.errorText!,
            style: typography.bodySmall.copyWith(color: colorScheme.error),
            textAlign: TextAlign.center,
          ),
        ],
        if (widget.onResend != null) ...[
          SizedBox(height: sizes.lg),
          FxCountdownAction(
            prefixText: widget.resendPrefixText,
            actionText: widget.resendActionText,
            countdownPrefixText: widget.resendCountdownPrefixText,
            duration: Duration(seconds: widget.resendCooldownSeconds),
            onPressed: widget.onResend!,
          ),
        ],
      ],
    );
  }
}
