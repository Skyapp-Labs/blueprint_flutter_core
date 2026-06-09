part of 'fx_phone_input.dart';

/// Called when the national number or selected country changes.
///
/// [phone] is digits only (no spaces). [parsed] is non-null when libphonenumber
/// accepts the combined dial code + digits.
typedef FxPhoneInputChanged = void Function(
  FxCountry country,
  String phone, [
  PhoneParseResult? parsed,
]);

/// Layout strategy for [FxPhoneInput].
enum FxPhoneInputLayout {
  /// Country selector embedded in the phone field prefix.
  integrated,

  /// Country selector and phone field side by side.
  split,

  /// Country selector above the phone field.
  stacked,
}

class FxPhoneInputConfig {
  const FxPhoneInputConfig({
    this.layout = FxPhoneInputLayout.stacked,
    this.options = const FxFieldOptions(keyboardType: TextInputType.phone),
    this.decoration = const InputDecoration(),
    this.overlayType = FxOverlayType.bottomSheet,
    this.countryOptions = const FxFieldOptions(),
  });

  final FxOverlayType overlayType;
  final FxFieldOptions options;
  final InputDecoration decoration;
  final FxFieldOptions countryOptions;
  final FxPhoneInputLayout layout;
}

/// Immutable state shared by all phone-input layout widgets.
@immutable
class FxPhoneInputViewData {
  const FxPhoneInputViewData({
    required this.selectedCountry,
    required this.onCountryChanged,
    this.favoriteCountries,
    required this.options,
    required this.countryOptions,
    required this.decoration,
    required this.overlayType,
    required this.validator,
    required this.controller,
    required this.onSaved,
    required this.onSubmitted,
  });

  final FxCountry selectedCountry;
  final List<FxCountry>? favoriteCountries;
  final ValueChanged<FxCountry> onCountryChanged;
  final FxFieldOptions options;
  final FxFieldOptions countryOptions;
  final InputDecoration decoration;
  final FxOverlayType overlayType;

  final FormFieldValidator<String>? validator;

  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String?>? onSaved;
  final TextEditingController? controller;
}

abstract final class _FxPhoneInputDefaults {
  static const dialCodeWidthFactor = 0.35;
}

/// Filters [countries] by name, dial code, or ISO code.
List<FxCountry> filterFxCountries(String query, List<FxCountry> countries) {
  final search = query.trim().toLowerCase();
  
  return countries.where((country) {
    return country.name.toLowerCase().contains(search) ||
        country.dialCode.toLowerCase().contains(search) ||
        country.code.toLowerCase().contains(search);
  }).toList();
}

List<FxCountry> resolveFavoriteCountries(List<String> codes) {
  return codes
      .map(FxCountries.byCode)
      .whereType<FxCountry>()
      .toList(growable: false);
}

abstract class _FxPhoneInputLayoutWidget extends StatelessWidget
    with FxUiToolkit {
  _FxPhoneInputLayoutWidget({super.key, required this.data});

  final FxPhoneInputViewData data;

  InputDecoration get themedDecoration => data.decoration
    .applyDefaults(theme.inputDecorationTheme);

  FxFieldOptions get phoneOptions => data.options;

  FxFieldOptions get countryOptions => data.countryOptions.copyWith(
    prefixIcon: _countryFlag(data.selectedCountry),
    hint: data.countryOptions.hint ?? 'Select your country',
    errorText: null,
  );

  InputDecoration get countryDecoration => data.decoration;

  String countryValueBuilder(FxCountry country) => country.dialCode;
  
  Widget buildPhoneField() {
    return FxTextField(
      options: phoneOptions,
      controller: data.controller,
      validator: _validatePhone,
      onSubmitted: data.onSubmitted,
      onSaved: data.onSaved,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: data.decoration,
    );
  }

  Widget buildCountryField({bool expands = false}) {
    return FxSelectField<FxCountry, FxCountry>(
      key: ValueKey(data.selectedCountry.code),
      expands: expands,
      options: countryOptions,
      decoration: countryDecoration,
      overlayType: data.overlayType,
      valueBuilder: countryValueBuilder,
      overlayOptions: FxOverlayOptions.singleSelect(
        title: data.countryOptions.hint ?? data.countryOptions.label,
        items: FxCountries.all,
        favoriteItems: data.favoriteCountries,
        itemTile: _countryOverlayTile(),
        selectedItem: data.selectedCountry,
        onSearch: (query, items) => filterFxCountries(query, items),
        itemComparer: (a, b) => (
          a.code.toLowerCase() == b.code.toLowerCase() ||
          a.name.toLowerCase() == b.name.toLowerCase() ||
          a.dialCode.toLowerCase() == b.dialCode.toLowerCase()
        )
      ),
      onChanged: data.onCountryChanged,
    );
  }

  FxOverlayTile<FxCountry> _countryOverlayTile() => FxOverlayTile<FxCountry>(
    title: (country) => country.name,
    subtitle: (country) => country.dialCode,
    leadingBuilder: (_, country, _) => _countryFlag(country),
    trailingBuilder: (_, country, _) => Text(
      country.code,
      style: typography.labelSmall,
    )
  );

  Widget _countryFlag(FxCountry country) => FxCountryFlag(
    countryCode: country.code,
    size: sizes.iconMd,
    shape: FxFlagShape.circle,
  );

  String? _validatePhone(String? value) {
    final fullNumber = '${data.selectedCountry.dialCode}${value ?? ''}';
    return data.validator?.call(fullNumber) ?? Validators.phone(fullNumber);
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return buildPhoneField();
  }
}
