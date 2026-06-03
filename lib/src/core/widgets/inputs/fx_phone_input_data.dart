part of 'fx_phone_input.dart';


typedef FxPhoneInputChanged = void Function(
  FxCountry country,
  String phone, [
  PhoneParseResult? parsed,
]);

enum FxPhoneInputLayout {
  integrated,
  split,
  stacked,
}

class FxPhoneInputDecoration extends InputDecoration {
  const FxPhoneInputDecoration({
    this.overlayType = FxOverlayType.bottomSheet,
    String?label,
    this.countryLabel,
    String hint = 'Enter your phone number',
    this.flagShape = FxFlagShape.circle,
    this.flagSize = 28,
    this.textInputAction = TextInputAction.next,
    this.layout = FxPhoneInputLayout.integrated,
    this.spacing,
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
  final double? spacing;
}

class _FxPhoneInputBaseData with FxUiToolkit {
  _FxPhoneInputBaseData({
    required this.selectedCountry,
    required this.onCountryChanged,
    required this.focusNode,
    required this.controller,
    required this.validator,
    required this.onChanged,
    this.decoration = const FxPhoneInputDecoration(),
  });

  final FxCountry selectedCountry;

  final FocusNode? focusNode;

  final TextEditingController? controller;

  final FormFieldValidator<String>? validator;

  final FxPhoneInputChanged? onChanged;
  
  final FxPhoneInputDecoration decoration;

  final void Function(FxCountry) onCountryChanged;
}

abstract class _FxPhoneInputBaseLayout extends StatelessWidget with FxUiToolkit {
  _FxPhoneInputBaseLayout({
    super.key,
    required this.data,
  });

  final _FxPhoneInputBaseData data;

  InputDecoration phoneInputDecoration(InputDecoration decoration) {
    return decoration.applyDefaults(theme.inputDecorationTheme);
  }

  String valueLabelBuilder(FxCountry country) => country.dialCode;

  FxSelectFieldDecoration<FxCountry> get countrySelectorDecoration {
    return FxSelectFieldDecoration(
      prefixIconBuilder: _buildFlagBuilder,
      enabled: true,
    );
  } 
  
  Widget buildPhoneInput() => TextFormField(
    controller: data.controller,
    focusNode: data.focusNode,
    keyboardType: TextInputType.phone,
    textInputAction: data.decoration.textInputAction,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    validator: _validator,
    decoration: phoneInputDecoration(data.decoration)
  );

  Widget buildCountrySelector() => FxSelectField<FxCountry>(
    items: FxCountries.all,
    initialValue: data.selectedCountry,
    valueLabelBuilder: valueLabelBuilder,
    onChanged: data.onCountryChanged,
    overlayType: data.decoration.overlayType,
    overlayTile: _overlayTile,
    decoration: countrySelectorDecoration,
    onSearch: (query, items) => query == null ? items : items.where((country) {
      final name = country.name.toLowerCase();
      final dialCode = country.dialCode.toLowerCase();
      final search = query.toLowerCase();
      return name.contains(search) || dialCode.contains(search);
    }).toList(),
  );

  FxOverlayTile<FxCountry> get _overlayTile => FxOverlayTile<FxCountry>(
    title: (country) => country.name,
    subtitle: (country) => country.dialCode,
    leading: (country) => _buildFlagBuilder(country),
    trailing: (country) => Icon(Icons.arrow_forward_ios),
    visualDensity: VisualDensity.compact,
    dense: true
  );

  Widget _buildFlagBuilder(FxCountry country) => FxCountryFlag(
    countryCode: country.code,
    size: data.decoration.flagSize,
    shape: data.decoration.flagShape,
  );

  String? _validator(String? value) {
    if (data.validator != null) {
      return data.validator!('${data.selectedCountry.dialCode}${value ?? ''}');
    }
    return Validators.phone('${data.selectedCountry.dialCode}${value ?? ''}');
  }
}