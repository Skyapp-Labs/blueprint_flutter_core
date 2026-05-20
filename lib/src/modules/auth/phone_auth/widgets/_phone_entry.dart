import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/styles/fx_phone_entry_style.dart';

class PhoneEntry extends StatefulWidget {
  const PhoneEntry({
    super.key,
    required this.style,
    required this.onSubmit,
    required this.isLoading,
  });

  final FxPhoneEntryStyle style;
  final Future<void> Function(String phone, {String? countryCode}) onSubmit;
  final bool isLoading;

  @override
  State<PhoneEntry> createState() => _PhoneEntryState();
}

class _PhoneEntryState extends State<PhoneEntry> with FxUiToolkit {
  String _phone = '';
  String? _countryCode;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final hasTopContent = (
      widget.style.title != null || 
      widget.style.subtitle != null
    );

    return FxScrollableForm(
      key: const ValueKey('phone'),
      header: widget.style.header,
      footer: widget.style.footer,
      spacing: widget.style.spacing,
      safeArea: widget.style.safeArea,
      padding: widget.style.padding,
      mainAxisAlignment: widget.style.mainAxisAlignment,
      crossAxisAlignment: widget.style.crossAxisAlignment,
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
          label: widget.style.buttonLabel,
          isLoading: widget.isLoading,
          onPressed: () => widget.onSubmit(_phone, countryCode: _countryCode)
        ),
        ...widget.style.otherWidgets,
      ],
    );
  }
  
  Widget _buildTopContent() {
    Widget? title;
    Widget? subtitle;

    if (widget.style.title != null) {
      title = Text(
        widget.style.title!,
        style: typography.headlineSmall,
        textAlign: TextAlign.center,
      );
    }

    if (widget.style.subtitle != null) {
      subtitle = Text(
        widget.style.subtitle!,
        style: typography.bodyMedium,
        textAlign: TextAlign.center,
      );
    }

    if (title == null && subtitle == null) return const SizedBox.shrink();

    return Column(
      spacing: sizes.xs,
      crossAxisAlignment: widget.style.crossAxisAlignment,
      children: [
        title!,
        subtitle!,
      ],
    );
  }
}
