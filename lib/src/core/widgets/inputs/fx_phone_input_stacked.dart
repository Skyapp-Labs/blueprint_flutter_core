part of 'fx_phone_input.dart';

class FxPhoneInputStacked extends _FxPhoneInputBaseLayout {
  
  FxPhoneInputStacked({super.key, required super.data});
  
  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);
    return Column(
      spacing: data.decoration.spacing ?? sizes.md,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildCountrySelector(),
        buildPhoneInput(),
      ],
    );
  }

  @override
  String valueLabelBuilder(FxCountry country) => ' ${country.name} (${country.dialCode})';
}
