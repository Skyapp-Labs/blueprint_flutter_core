import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/core/utils/formatters/phone_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/data/fx_countries.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/_overlay.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_select_field.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_country_flag.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef FxPhoneInputChanged = void Function(
  FxCountry country,
  String phone, [
  PhoneParseResult? parsed,
]);

/// Phone number input with country dial code prefix.
///
/// [onChanged] receives the selected country, the national digits only (no
/// spaces), and an optional third argument [parsed] when libphonenumber accepts
/// the combined dial code + digits (otherwise null).
///
/// Declare the callback with an optional positional third parameter, even if
/// you ignore it, for example `(country, phone, [_]) { ... }` or
/// `(country, phone, [parsed]) { ... }`.
class FxPhoneInput extends ConsumerStatefulWidget {
  const FxPhoneInput({
    super.key,
    this.onChanged,
    this.validator,
    this.overlayStyle = FxOverlayStyle.modal,
    this.label,
    this.hint = 'Enter your phone number',
    this.flagShape = FxFlagShape.circle,
    this.flagSize = 28,
    this.initialCountryCode = 'NG',
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
  });

  final String? label;
  final String hint;
  final double flagSize;
  final String initialCountryCode;
  final FocusNode? focusNode;
  final FxFlagShape flagShape;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final FxOverlayStyle overlayStyle;
  final FormFieldValidator<String>? validator;
  final FxPhoneInputChanged? onChanged;

  @override
  ConsumerState<FxPhoneInput> createState() => _FxPhoneInputState();
}

class _FxPhoneInputState extends ConsumerState<FxPhoneInput> with FxUiToolkit {

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

    return TextFormField(
      controller: _controller,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.phone,
      textInputAction: widget.textInputAction,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!('${_selectedCountry.dialCode}${value ?? ''}');
        }
        return Validators.phone('${_selectedCountry.dialCode}${value ?? ''}');
      },
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: _dialCodePrefix()
      )
    );
  }

  Widget _dialCodePrefix() => GestureDetector(
    onTap: _showDialCodePicker,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes.md),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: sizes.sm,
          children: [
            Align(
              alignment: Alignment.center,
              child: FxCountryFlag(
                countryCode: _selectedCountry.code,
                size: widget.flagSize,
                shape: widget.flagShape,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                _selectedCountry.dialCode,
                style: typography.labelSmall.copyWith(color: colors.onSurface),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: sizes.iconSm,
              color: colors.onSurface,
            ),
            Container(
              width: 1.0,
              color: colors.outline,
              margin: EdgeInsets.symmetric(vertical: sizes.sm)
            ),
          ],
        ),
      )
    ),
  );

  Future<void> _showDialCodePicker() async {
    final result = await _showDialCodePickerOverlay();
    if (result == null) return;
    setState(() => _selectedCountry = result);
    _notify();
  }

  Future<FxCountry?> _showDialCodePickerOverlay() async {
    final favoriteCountries = ref.read(fxConfigProvider)
      .favoriteCountries
      .where((code) => FxCountries.byCode(code) != null)
      .map((code) => FxCountries.byCode(code)!)
      .toList();

    final data = FxOverlayData<FxCountry>(
      title: 'Select country',
      list: FxOverlayListData(
        items: FxCountries.all,
        favoriteItems: favoriteCountries,
        onSearch: (search, items) => items.where((item) {
          final name = item.name.toLowerCase();
          final dialCode = item.dialCode.toLowerCase();
          final code = item.code.toLowerCase();
          final searchText = search?.toLowerCase() ?? '';

          return name.contains(searchText) || dialCode.contains(searchText) || code.contains(searchText);
        }).toList(),
        selectedItem: _selectedCountry,
        titleTextBuilder: (item) => item.name,
        subtitleTextBuilder: (item) => item.dialCode,
        trailingTextBuilder: (item) => item.code,
        leadingBuilder: (item, size) => FxCountryFlag(
          countryCode: item.code,
          size: size,
          shape: FxFlagShape.rect,
        )
      )
    );

    switch (widget.overlayStyle) {
      case FxOverlayStyle.bottomSheet:
        return await showFxBottomSheet<FxCountry>(
          data: data,
          cancelable: true,
          maxChildSize: 0.9,
          minChildSize: 0.25,
          initialChildSize: 0.5,
        );
      case FxOverlayStyle.dialog:
        return await showFxDialog<FxCountry>(
          data: data,
          style: FxDialogStyle.center,
          cancelable: true
        );
      case FxOverlayStyle.modal:
        return await showFxDialog<FxCountry>(
          data: data,
          style: FxDialogStyle.fullPage,
          cancelable: true
        );
    }
  }
}
