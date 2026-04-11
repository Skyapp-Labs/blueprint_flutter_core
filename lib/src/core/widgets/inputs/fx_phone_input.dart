part of '_index.dart';

/// Phone number input with country dial code prefix.
///
/// Outputs a full E.164 formatted number (e.g. +2348012345678) via [onChanged].
class FxPhoneInput extends StatefulWidget {
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
  final void Function(FxCountry country, String phone)? onChanged;

  @override
  State<FxPhoneInput> createState() => _FxPhoneInputState();
}

class _FxPhoneInputState extends State<FxPhoneInput> with FxUiToolkit {
  late FxCountry _selectedCountry;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _selectedCountry = FxCountries.byCode(widget.initialCountryCode) ?? FxCountries.all.first;
    _controller.addListener(_notify);
  }

  void _notify() => widget.onChanged?.call(_selectedCountry, _controller.text.replaceAll(' ', ''));

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
    final data = FxOverlayData<FxCountry>(
      title: 'Select country',
      list: FxOverlayListData(
        items: FxCountries.all,
        onSearch: (search, items) => items.where((item) => item.name.toLowerCase().contains(search?.toLowerCase() ?? '')).toList(),
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
