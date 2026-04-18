import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/display/fx_text.dart';
import 'package:blueprint_flutter_core/src/core/widgets/feedback/_feedback.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/modules/auth/email_auth/widgets/forgot_password/fx_forgot_password_data.dart';

/// Step 2: User enters the PIN sent to their email.
class VerifyPinStep extends StatefulWidget {
  const VerifyPinStep({
    super.key,
    required this.data,
    required this.email,
    required this.onSubmit,
    required this.onResend,
    required this.isLoading,
    this.error,
  });

  final FxForgotPasswordData data;
  final String email;
  final Future<void> Function(String pin) onSubmit;
  final Future<void> Function() onResend;
  final bool isLoading;
  final String? error;

  @override
  State<VerifyPinStep> createState() => VerifyPinStepState();
}

class VerifyPinStepState extends State<VerifyPinStep> with FxUiToolkit {
  final _pinKey = GlobalKey<FxPinInputState>();

  void triggerError() => _pinKey.currentState?.triggerError();

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Column(
      key: const ValueKey('verifyPin'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.data.verifyPinTitle,
          style: typography.headlineSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: sizes.sm),
        FxText(
          widget.data.verifyPinSubtitle.replaceAll('{{email}}', '[${widget.email}]'),
          style: FxTextStyle.fromStyle(typography.bodyMedium).copyWith(
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: sizes.xl),
        FxPinInput(
          key: _pinKey,
          length: widget.data.pinLength,
          autoFocus: true,
          onCompleted: widget.onSubmit,
        ),
        if (widget.error != null) ...[
          SizedBox(height: sizes.xs),
          Text(
            widget.error!,
            style: typography.bodySmall.copyWith(color: colorScheme.error),
            textAlign: TextAlign.center,
          ),
        ],
        SizedBox(height: sizes.lg),
        FxCountdownAction(
          prefixText: widget.data.resendPrefixText,
          actionText: widget.data.resendActionText,
          countdownPrefixText: widget.data.resendCountdownPrefixText,
          duration: Duration(seconds: widget.data.resendCooldownSeconds),
          onPressed: widget.onResend,
        ),
        if (widget.isLoading) ...[
          SizedBox(height: sizes.sm),
          const Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }
}
