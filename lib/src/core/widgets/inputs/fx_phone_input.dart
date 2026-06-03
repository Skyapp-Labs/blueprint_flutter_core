import 'package:blueprint_flutter_core/src/core/utils/formatters/phone_formatter.dart';
import 'package:blueprint_flutter_core/src/core/utils/screen_util.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/_overlay.dart' show FxOverlayTile;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/data/fx_countries.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_select_field.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_country_flag.dart';

part 'fx_phone_input_data.dart';
part 'fx_phone_input_stacked.dart';
part 'fx_phone_input_split.dart';
part 'fx_phone_input_integrated.dart';

/// Phone number input with country dial code prefix.
///
/// [onChanged] receives the selected country, the national digits only (no
/// spaces), and an optional third argument [parsed] when libphonenumber accepts
/// the combined dial code + digits (otherwise null).
///
/// Declare the callback with an optional positional third parameter, even if
/// you ignore it, for example `(country, phone, [_]) { ... }` or
/// `(country, phone, [parsed]) { ... }`.
class FxPhoneInput extends StatefulWidget {
  const FxPhoneInput({
    super.key,
    this.onChanged,
    this.validator,
    this.initialCountryCode = 'NG',
    this.controller,
    this.focusNode,
    this.decoration = const FxPhoneInputDecoration(),
  });

  final String initialCountryCode;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FxPhoneInputChanged? onChanged;
  final FxPhoneInputDecoration decoration;

  @override
  State<FxPhoneInput> createState() => _FxPhoneInputState();
}

class _FxPhoneInputState extends State<FxPhoneInput> with FxUiToolkit {

  late FxCountry _selectedCountry;
  late final TextEditingController _controller;
  int _parseSeq = 0;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _selectedCountry = FxCountries.byCode(widget.initialCountryCode) ?? FxCountries.all.first;
    _controller.addListener(_notify);
  }

  void _notify() {
    final onChanged = widget.onChanged;
    if (onChanged == null) return;

    final phone = _controller.text.replaceAll(' ', '');
    if (phone.isEmpty) {
      onChanged(_selectedCountry, '', null);
      return;
    }

    final seq = ++_parseSeq;
    final composed = '${_selectedCountry.dialCode}$phone';
    final country = _selectedCountry;
    PhoneFormatter.tryParse(composed, country: country).then((parsed) {
      if (!mounted || seq != _parseSeq) return;
      onChanged(country, phone, parsed);
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final data = _FxPhoneInputBaseData(
      selectedCountry: _selectedCountry,
      onCountryChanged: (country) => setState(() => _selectedCountry = country),
      focusNode: widget.focusNode,
      controller: _controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: widget.decoration,
    );

    switch(data.decoration.layout) {
      case FxPhoneInputLayout.integrated:
        return FxPhoneInputIntegrated(data: data);
      case FxPhoneInputLayout.split:
        return FxPhoneInputSplit(data: data);
      case FxPhoneInputLayout.stacked:
        return FxPhoneInputStacked(data: data);
    }
  }
}
