part of 'fx_phone_input.dart';

typedef FxPhoneInputChanged = void Function(
  FxCountry country,
  String phone, [
  PhoneParseResult? parsed,
]);

enum FxPhoneInputLayout { integrated, split, stacked }

@immutable
class FxPhoneInputConfig {
  const FxPhoneInputConfig({
    this.layout = FxPhoneInputLayout.integrated,
    this.options = const FxFieldOptions(keyboardType: TextInputType.phone),
    this.countryOptions = const FxFieldOptions(),
    this.decoration = const InputDecoration(),
    this.overlayType = FxOverlayType.dialog,
  });

  final FxPhoneInputLayout layout;
  final FxFieldOptions options;
  final FxFieldOptions countryOptions;
  final InputDecoration decoration;
  final FxOverlayType overlayType;
}

@immutable
class FxPhoneInputViewData {
  const FxPhoneInputViewData({
    required this.config,
    required this.theme,
    required this.favoriteCountries,
    required this.countries,
    required this.onSaved,
    required this.validator,
    required this.controller,
    required this.onSubmitted,
    required this.selectedCountry,
    required this.onCountryChanged,
  });

  final FxCountry selectedCountry;
  final FxPhoneInputConfig config;
  final FxPhoneInputTheme theme;
  final List<FxCountry> favoriteCountries;
  final List<FxCountry> countries;
  final ValueChanged<FxCountry> onCountryChanged;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String?>? onSaved;

  bool get isSplit => config.layout == FxPhoneInputLayout.split;
  bool get isStacked => config.layout == FxPhoneInputLayout.stacked;
  bool get isIntegrated => config.layout == FxPhoneInputLayout.integrated;

  FxFieldOptions phoneOptions(Widget prefixIcon) => config.options.copyWith(
    hint: config.options.hint ?? theme.phoneHint,
    labelBehavior: FxLabelBehavior.external,
    prefixIcon: isIntegrated ? prefixIcon : null,
  );

  FxFieldOptions countryOptions(Widget countryFlag) {
    final hint = config.countryOptions.hint;
    return config.countryOptions.copyWith(
      hint: hint ?? theme.countryHint,
      prefixIcon: countryFlag,
    );
  }

  InputDecoration countryDecoration() {
    if (!isIntegrated) return config.decoration;
    return config.decoration.copyWith(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      filled: false,
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );
  }

  String countryLabel() {
    if (!isStacked) return selectedCountry.dialCode;
    return '${selectedCountry.name} (${selectedCountry.dialCode})';
  }
}

List<FxCountry> resolveFavoriteCountries(List<String> codes) => codes
    .map(FxCountries.byCode)
    .whereType<FxCountry>()
    .toList(growable: false);

class _FxPhoneInputLayout extends StatelessWidget with FxUiToolkit {
  _FxPhoneInputLayout({required this.data});

  final FxPhoneInputViewData data;

  Widget countryFlag(FxCountry country) => FxCountryFlag(
    countryCode: country.code,
    size: themeData.phoneInputTheme.flagSizeOf(sizes),
    shape: themeData.phoneInputTheme.flagShape,
  );

  FxOverlayTile<FxCountry> get _overlayTile => FxOverlayTile<FxCountry>(
    title: (c) => c.name,
    subtitle: (c) => c.dialCode,
    leadingBuilder: (_, c, _) => countryFlag(c),
    trailingBuilder: (_, c, _) => Text(c.code, style: typography.labelSmall),
  );

  FxOverlayOptions<FxCountry> get _overlayOptions => FxOverlayOptions.singleSelect(
    title: data.config.countryOptions.label ?? themeData.phoneInputTheme.overlayTitle,
    items: data.countries,
    favoriteItems: data.favoriteCountries,
    selectedItem: data.selectedCountry,
    itemTile: _overlayTile,
    onSearch: filterFxCountries,
    itemComparer: (a, b) => a.code == b.code,
  );

  Widget integratedPhoneField() => LayoutBuilder(
    builder: (context, constraints) => SizedBox(
      width: data.theme.integratedDialWidth(constraints, context),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: countryField()),
            Container(
              margin: EdgeInsets.only(
                right: data.theme.spacingOf(sizes),
                top: sizes.sm,
                bottom: sizes.sm,
              ),
              width: 1,
              color: theme.dividerColor,
            )
          ]
        )
      )
    )
  );

  Widget phoneField() => FxTextField(
    controller: data.controller,
    options: data.phoneOptions(integratedPhoneField()),
    decoration: data.config.decoration,
    validator: _validate,
    onSubmitted: data.onSubmitted,
    onSaved: data.onSaved,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  );

  Widget countryField() => FxSelectField<FxCountry, FxCountry>(
    key: ValueKey(data.selectedCountry.code),
    expands: data.isSplit,
    options: data.countryOptions(countryFlag(data.selectedCountry)),
    decoration: data.countryDecoration(),
    overlayType: data.config.overlayType,
    valueBuilder: (_) => data.countryLabel(),
    overlayOptions: _overlayOptions,
    onChanged: data.onCountryChanged,
  );

  String? _validate(String? value) {
    final full = '${data.selectedCountry.dialCode}${value ?? ''}';
    return data.validator?.call(full) ?? Validators.phone(full);
  }

  List<FxCountry> filterFxCountries(String query, List<FxCountry> items) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return items;
    return items.where((c) =>
      c.name.toLowerCase().contains(q) ||
      c.dialCode.contains(q) ||
      c.code.toLowerCase().contains(q),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return switch (data.config.layout) {
      FxPhoneInputLayout.split => _buildSplitLayout(),
      FxPhoneInputLayout.stacked => _buildStackedLayout(),
      _ => phoneField(),
    };
  }

  Widget _buildSplitLayout() => IntrinsicHeight(
    child: Row(
      spacing: data.theme.spacingOf(sizes),
      children: [
        Flexible(
          flex: data.theme.splitCountryFlex,
          child: countryField()
        ),
        Flexible(
          flex: data.theme.phoneFlex,
          child: phoneField()
        ),
      ]
    )
  );

  Widget _buildStackedLayout() => Column(
    spacing: data.theme.spacingOf(sizes),
    children: [
      countryField(),
      phoneField()
    ]
  );
}