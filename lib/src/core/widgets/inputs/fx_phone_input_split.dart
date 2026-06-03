part of 'fx_phone_input.dart';

class FxPhoneInputSplit extends _FxPhoneInputLayoutWidget {
  FxPhoneInputSplit({super.key, required super.data});

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: data.decoration.spacing ?? sizes.md,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: screenWidth * data.decoration.splitCountryMinWidthFactor,
            ),
            child: SizedBox(
              width: _FxPhoneInputDefaults.splitCountryWidth.w,
              child: buildCountryField(
                valueLabelBuilder: dialCodeLabel,
                decoration: countryFieldDecoration(expands: true),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: buildPhoneField(),
          ),
        ],
      ),
    );
  }
}
