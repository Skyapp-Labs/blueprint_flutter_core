part of 'fx_phone_input.dart';

class FxPhoneInputSplit extends _FxPhoneInputBaseLayout {
  
  FxPhoneInputSplit({super.key, required super.data});
  
  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: data.decoration.spacing ?? sizes.md,
        children: [
          Container(
            width: 120.w,
            constraints: BoxConstraints(
              minWidth: screenWidth * 0.33,
            ),
            child: buildCountrySelector(),
          ),
          Expanded(
            flex: 3,
            child: buildPhoneInput(),
          ),
        ],
      ),
    );
  }

  @override
  FxSelectFieldDecoration<FxCountry> get countrySelectorDecoration {
    return super.countrySelectorDecoration.apply(expands: true);
  }
}
