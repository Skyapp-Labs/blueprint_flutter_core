import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/core/data/fx_countries.dart';
import 'package:blueprint_flutter_core/src/core/utils/formatters/phone_formatter.dart';
import 'package:blueprint_flutter_core/src/core/utils/screen_util.dart';
import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_country_flag.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_select_field.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/fx_overlay.dart'
    show FxOverlayTile, FxOverlayType;

part 'fx_phone_input_data.dart';
part 'fx_phone_input_integrated.dart';
part 'fx_phone_input_split.dart';
part 'fx_phone_input_stacked.dart';

/// Phone number input with a searchable country dial-code selector.
///
/// [onChanged] receives the selected [FxCountry], national digits only (no
/// spaces), and an optional [PhoneParseResult] when libphonenumber accepts the
/// full number.
///
/// ```dart
/// FxPhoneInput(
///   onChanged: (country, phone, [parsed]) {
///     debugPrint(parsed?.fullNumber ?? '${country.dialCode}$phone');
///   },
///   decoration: FxPhoneInputDecoration(
///     layout: FxPhoneInputLayout.split,
///     countryLabel: 'Country',
///     label: 'Phone number',
///   ),
/// )
/// ```
class FxPhoneInput extends ConsumerStatefulWidget {
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
  ConsumerState<FxPhoneInput> createState() => _FxPhoneInputState();
}

class _FxPhoneInputState extends ConsumerState<FxPhoneInput> {
  late FxCountry _selectedCountry;
  late final TextEditingController _controller;
  late final bool _ownsController;
  int _parseGeneration = 0;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _controller = widget.controller ?? TextEditingController();
    _selectedCountry = _countryForCode(widget.initialCountryCode);
    _controller.addListener(_handlePhoneChanged);
  }

  @override
  void didUpdateWidget(covariant FxPhoneInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialCountryCode != widget.initialCountryCode) {
      _selectedCountry = _countryForCode(widget.initialCountryCode);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handlePhoneChanged);
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  void _handlePhoneChanged() {
    final onChanged = widget.onChanged;
    if (onChanged == null) return;

    final digits = _controller.text.replaceAll(' ', '');
    if (digits.isEmpty) {
      onChanged(_selectedCountry, '', null);
      return;
    }

    final generation = ++_parseGeneration;
    final country = _selectedCountry;
    final composed = '${country.dialCode}$digits';

    PhoneFormatter.tryParse(composed, country: country).then((parsed) {
      if (!mounted || generation != _parseGeneration) return;
      onChanged(country, digits, parsed);
    });
  }

  void _handleCountryChanged(FxCountry country) {
    setState(() => _selectedCountry = country);
    _handlePhoneChanged();
  }

  FxCountry _countryForCode(String code) =>
      FxCountries.byCode(code) ?? FxCountries.all.first;

  FxPhoneInputViewData _viewData(List<FxCountry> favorites) =>
      FxPhoneInputViewData(
        selectedCountry: _selectedCountry,
        favoriteCountries: favorites,
        onCountryChanged: _handleCountryChanged,
        controller: _controller,
        focusNode: widget.focusNode,
        validator: widget.validator,
        decoration: widget.decoration,
      );

  @override
  Widget build(BuildContext context) {
    final favorites = resolveFavoriteCountries(
      ref.read(fxConfigProvider).favoriteCountries,
    );
    final data = _viewData(favorites);

    return switch (widget.decoration.layout) {
      FxPhoneInputLayout.integrated => FxPhoneInputIntegrated(data: data),
      FxPhoneInputLayout.split => FxPhoneInputSplit(data: data),
      FxPhoneInputLayout.stacked => FxPhoneInputStacked(data: data),
    };
  }
}
