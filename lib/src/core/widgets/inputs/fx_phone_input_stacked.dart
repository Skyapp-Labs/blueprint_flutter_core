part of 'fx_phone_input.dart';

class FxPhoneInputStacked extends _FxPhoneInputLayoutWidget {
  FxPhoneInputStacked({super.key, required super.data});

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Column(
      spacing: data.decoration.spacing ?? sizes.md,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildCountryField(valueLabelBuilder: stackedCountryLabel),
        buildPhoneField(),
      ],
    );
  }
}
