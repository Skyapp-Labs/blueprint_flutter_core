part of 'fx_phone_input.dart';

class FxPhoneInputSplit extends _FxPhoneInputLayoutWidget {
  FxPhoneInputSplit({super.key, required super.data});

  @override
  Widget buildPhoneField() => IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: sizes.md,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: screenWidth * _FxPhoneInputDefaults.dialCodeWidthFactor,
          ),
          child: SizedBox(
            width: screenWidth * .33,
            child: buildCountryField(expands: true),
          ),
        ),
        Expanded(
          flex: 3,
          child: super.buildPhoneField()
        ),
      ],
    ),
  );
}
