part of 'fx_phone_input.dart';

class FxPhoneInputStacked extends _FxPhoneInputLayoutWidget {
  FxPhoneInputStacked({super.key, required super.data});

  @override
  String countryValueBuilder(FxCountry country) => '${country.name} (${country.dialCode})';

  @override
  Widget buildPhoneField() => Column(
    spacing: sizes.md,
    children: [
      buildCountryField(),
      super.buildPhoneField(),
    ],
  );
}
