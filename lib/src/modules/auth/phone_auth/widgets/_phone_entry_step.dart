import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_index.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/fx_phone_auth.dart';

class PhoneStep extends StatefulWidget {
  const PhoneStep({
    super.key,
    required this.theme,
    required this.onSubmit,
    required this.isLoading,
  });

  final FxPhoneAuthTheme theme;
  final Future<void> Function(String phone) onSubmit;
  final bool isLoading;

  @override
  State<PhoneStep> createState() => _PhoneStepState();
}

class _PhoneStepState extends State<PhoneStep> with FxUiToolkit {
  final _formKey = GlobalKey<FormState>();
  String _phone = '';

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    if (widget.theme.phoneEntryBuilder != null) {
      return widget.theme.phoneEntryBuilder!(context);
    }

    return Form(
      key: _formKey,
      child: Column(
        key: const ValueKey('phone'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: sizes.lg,
        children: [
          Text(
            widget.theme.phoneEntryConfig.title,
            style: typography.headlineSmall,
            textAlign: TextAlign.center,
          ),
          Text(
            widget.theme.phoneEntryConfig.subtitle,
            style: typography.bodyMedium,
            textAlign: TextAlign.center,
          ),
          FxPhoneInput(
            onChanged: (_, phone) => setState(() => _phone = phone),
          ),
          FxButton(
            label: widget.theme.phoneEntryConfig.buttonLabel,
            isLoading: widget.isLoading,
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                await widget.onSubmit(_phone);
              }
            },
          ),
        ],
      ),
    );
  }
}
