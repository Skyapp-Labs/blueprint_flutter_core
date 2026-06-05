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

/// Visual and behavioral options for [FxPhoneInput].
class FxPhoneInputDecoration extends InputDecoration {
  const FxPhoneInputDecoration({
    String? label,
    this.countryLabel,
    String hint = 'Enter your phone number',
    this.textInputAction = TextInputAction.next,
    this.overlayType = FxOverlayType.modal,
    this.flagShape = FxFlagShape.circle,
    this.flagSize = 28,
    this.layout = FxPhoneInputLayout.integrated,
    this.spacing,
    this.integratedDialCodeWidthFactor = _FxPhoneInputDefaults.dialCodeWidthFactor,
    this.splitCountryMinWidthFactor = _FxPhoneInputDefaults.splitCountryMinWidthFactor,
    super.border,
    super.errorBorder,
    super.focusedBorder,
    super.enabledBorder,
    super.disabledBorder,
    super.filled,
    EdgeInsets? padding,
  })  : phoneLabel = label,
        super(
          contentPadding: padding,
          isCollapsed: true,
          isDense: true,
          hintText: hint,
          prefixIconConstraints: const BoxConstraints(),
          suffixIconConstraints: const BoxConstraints(),
        );

  final String? phoneLabel;
  final String? countryLabel;
  final double flagSize;
  final FxFlagShape flagShape;
  final TextInputAction textInputAction;
  final FxOverlayType overlayType;
  final FxPhoneInputLayout layout;

  /// Gap between country selector and phone field in [FxPhoneInputLayout.split]
  /// and [FxPhoneInputLayout.stacked].
  final double? spacing;

  /// Width fraction for the integrated dial-code prefix (0–1).
  final double integratedDialCodeWidthFactor;

  /// Minimum width fraction for the split-layout country selector (0–1).
  final double splitCountryMinWidthFactor;
}

/// Immutable state shared by all phone-input layout widgets.
@immutable
class FxPhoneInputViewData {
  const FxPhoneInputViewData({
    required this.selectedCountry,
    required this.favoriteCountries,
    required this.onCountryChanged,
    required this.controller,
    required this.decoration,
    this.focusNode,
    this.validator,
  });

  final FxCountry selectedCountry;
  final List<FxCountry> favoriteCountries;
  final ValueChanged<FxCountry> onCountryChanged;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final FxPhoneInputDecoration decoration;
}

abstract final class _FxPhoneInputDefaults {
  static const dialCodeWidthFactor = 0.4;
  static const splitCountryMinWidthFactor = 0.4;
  static const splitCountryWidth = 120.0;
  static const countryOverlayTitle = 'Select country';
}

/// Filters [countries] by name, dial code, or ISO code.
List<FxCountry> filterFxCountries(String query, List<FxCountry> countries) {
  final search = query.trim().toLowerCase();
  if (search.isEmpty) return countries;

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

abstract class _FxPhoneInputLayoutWidget extends StatelessWidget with FxUiToolkit {
  _FxPhoneInputLayoutWidget({super.key, required this.data});

  final FxPhoneInputViewData data;

  InputDecoration themedDecoration(InputDecoration decoration) =>
      decoration.applyDefaults(theme.inputDecorationTheme);

  String dialCodeLabel(FxCountry country) => country.dialCode;

  String stackedCountryLabel(FxCountry country) =>
      '${country.name} (${country.dialCode})';

  FxSelectFieldDecoration<FxCountry> countryFieldDecoration({
    InputBorder? border,
    bool expands = false,
  }) {
    return FxSelectFieldDecoration<FxCountry>(
      label: data.decoration.countryLabel,
      overlayTitle: _FxPhoneInputDefaults.countryOverlayTitle,
      prefixIconBuilder: _countryFlag,
      expands: expands,
    ).apply(
      border: border,
      errorBorder: border,
      focusedBorder: border,
      enabledBorder: border,
      disabledBorder: border,
      filled: border == null ? null : false,
    );
  }

  Widget buildPhoneField({InputDecoration? decorationOverride}) {
    return TextFormField(
      controller: data.controller,
      focusNode: data.focusNode,
      keyboardType: TextInputType.phone,
      textInputAction: data.decoration.textInputAction,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: _validatePhone,
      decoration: decorationOverride ??
          themedDecoration(data.decoration).copyWith(
            labelText: data.decoration.phoneLabel,
          ),
    );
  }

  Widget buildCountryField({
    required String Function(FxCountry) valueLabelBuilder,
    FxSelectFieldDecoration<FxCountry>? decoration,
  }) {
    return FxSelectField<FxCountry>(
      key: ValueKey(data.selectedCountry.code),
      initialValue: data.selectedCountry,
      items: FxCountries.all,
      favoriteItems: data.favoriteCountries,
      valueLabelBuilder: valueLabelBuilder,
      onChanged: data.onCountryChanged,
      overlayType: data.decoration.overlayType,
      overlayTile: _countryOverlayTile,
      decoration: decoration ?? countryFieldDecoration(),
      onSearch: (query, items) =>
          query == null ? items : filterFxCountries(query, items),
    );
  }

  FxOverlayTile<FxCountry> get _countryOverlayTile => FxOverlayTile<FxCountry>(
        title: (country) => country.name,
        subtitle: (country) => country.dialCode,
        trailing: (country) => Text(
          country.code,
          style: typography.labelSmall,
        ),
        leading: _countryFlag,
      );

  Widget _countryFlag(FxCountry country) => FxCountryFlag(
        countryCode: country.code,
        size: data.decoration.flagSize,
        shape: data.decoration.flagShape,
      );

  String? _validatePhone(String? value) {
    final fullNumber = '${data.selectedCountry.dialCode}${value ?? ''}';
    return data.validator?.call(fullNumber) ?? Validators.phone(fullNumber);
  }
}
