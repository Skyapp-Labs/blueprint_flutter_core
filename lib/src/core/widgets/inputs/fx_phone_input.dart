import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_field_options.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/core/data/fx_countries.dart';
import 'package:blueprint_flutter_core/src/core/utils/formatters/phone_formatter.dart';
import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_country_flag.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_select_field.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/fx_overlay.dart'
    show FxOverlayOptions, FxOverlayTile;

part 'fx_phone_input_data.dart';
part 'fx_phone_input_split.dart';
part 'fx_phone_input_stacked.dart';
part 'fx_phone_input_integrated.dart';

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
///     countryLabel: 'Country',
///     label: 'Phone number',
///   ),
///   layout: FxPhoneInputLayout.split,
/// )
/// ```
class FxPhoneInput extends ConsumerStatefulWidget {
  const FxPhoneInput({
    super.key,
    this.validator,
    this.controller,
    this.initialValue,
    this.initialCountryCode,
    this.config = const FxPhoneInputConfig(),
    this.onSaved,
    this.onChanged,
    this.onSubmitted,
  });

  final String? initialValue;
  final String? initialCountryCode;
  final FxPhoneInputConfig config;

  final FormFieldValidator<String>? validator;

  final FxPhoneInputChanged? onChanged;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String?>? onSaved;
  final TextEditingController? controller;

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
    _selectedCountry = _countryForCode(
      widget.initialCountryCode ?? ref.read(fxConfigProvider).initialCountryCode,
    );

    if (widget.initialValue case final value? when value.isNotEmpty) {
      _controller.text = value;
    }

    _controller.addListener(_handlePhoneChanged);
  }

  @override
  void didUpdateWidget(covariant FxPhoneInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialCountryCode != oldWidget.initialCountryCode &&
        widget.initialCountryCode != null) {
      _selectedCountry = _countryForCode(widget.initialCountryCode!);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handlePhoneChanged);
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  FxCountry _countryForCode(String code) =>
      FxCountries.byCode(code) ?? FxCountries.all.first;

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

  FxPhoneInputViewData _viewData(List<FxCountry> favorites) =>
      FxPhoneInputViewData(
        selectedCountry: _selectedCountry,
        favoriteCountries: favorites,
        onCountryChanged: _handleCountryChanged,
        controller: _controller,
        validator: widget.validator,
        decoration: widget.config.decoration,
        options: widget.config.options.copyWith(
          hint: widget.config.options.hint ?? 'Enter your phone number',
          labelBehavior: FxLabelBehavior.external,
        ),
        countryOptions: widget.config.countryOptions.copyWith(
          hint: widget.config.countryOptions.hint ?? 'Select your country',
          labelBehavior: FxLabelBehavior.external,
        ),
        overlayType: widget.config.overlayType,
        onSaved: widget.onSaved,
        onSubmitted: widget.onSubmitted,
      );

  @override
  Widget build(BuildContext context) {
    final favorites = resolveFavoriteCountries(
      ref.read(fxConfigProvider).favoriteCountries,
    );

    return switch (widget.config.layout) {
      FxPhoneInputLayout.integrated =>
        FxPhoneInputIntegrated(data: _viewData(favorites)),
      FxPhoneInputLayout.split => FxPhoneInputSplit(data: _viewData(favorites)),
      FxPhoneInputLayout.stacked =>
        FxPhoneInputStacked(data: _viewData(favorites)),
    };
  }
}
