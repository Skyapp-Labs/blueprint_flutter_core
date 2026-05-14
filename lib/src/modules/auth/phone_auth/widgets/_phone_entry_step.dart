import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/fx_phone_auth.dart';

class PhoneStep extends StatefulWidget {
  const PhoneStep({
    super.key,
    required this.theme,
    required this.onSubmit,
    required this.isLoading,
  });

  final PhoneEntryConfig theme;
  final Future<void> Function(String phone, {String? countryCode}) onSubmit;
  final bool isLoading;

  @override
  State<PhoneStep> createState() => _PhoneStepState();
}

class _PhoneStepState extends State<PhoneStep> with FxUiToolkit {
  String _phone = '';
  String? _countryCode;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final hasTopContent = (
      widget.theme.title != null || 
      widget.theme.subtitle != null
    );

    return FxScrollableForm(
      key: const ValueKey('phone'),
      header: widget.theme.header,
      footer: widget.theme.footer,
      padding: widget.theme.padding,
      spacing: widget.theme.spacing,
      mainAxisAlignment: widget.theme.mainAxisAlignment,
      crossAxisAlignment: widget.theme.crossAxisAlignment,
      children: [
        if(hasTopContent) ...[
          _buildTopContent(),
          SizedBox(height: sizes.xs),
        ],
        FxPhoneInput(
          onChanged: (country, phone, [parsed]) => setState(() {
            if (phone.isEmpty) {
              _phone = '';
              _countryCode = null;
            } else {
              _phone = parsed?.fullNumber ?? '${country.dialCode}$phone';
              _countryCode = country.dialCode;
            }
          })
        ),
        FxButton(
          label: widget.theme.buttonLabel,
          isLoading: widget.isLoading,
          onPressed: () => widget.onSubmit(_phone, countryCode: _countryCode)
        ),
        ...widget.theme.otherWidgets,
      ],
    );
  }
  
  Widget _buildTopContent() {
    Widget? title;
    Widget? subtitle;

    if (widget.theme.title != null) {
      title = Text(
        widget.theme.title!,
        style: typography.headlineSmall,
        textAlign: TextAlign.center,
      );
    }

    if (widget.theme.subtitle != null) {
      subtitle = Text(
        widget.theme.subtitle!,
        style: typography.bodyMedium,
        textAlign: TextAlign.center,
      );
    }

    if (title == null && subtitle == null) return const SizedBox.shrink();

    return Column(
      spacing: sizes.xs,
      crossAxisAlignment: widget.theme.crossAxisAlignment,
      children: [
        title!,
        subtitle!,
      ],
    );
  }
}
