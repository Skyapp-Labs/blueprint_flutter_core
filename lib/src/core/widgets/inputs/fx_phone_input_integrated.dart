part of 'fx_phone_input.dart';

class FxPhoneInputIntegrated extends _FxPhoneInputBaseLayout {

  FxPhoneInputIntegrated({super.key, required super.data});
  
  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);
    return buildPhoneInput();
  }

  @override
  InputDecoration phoneInputDecoration(InputDecoration decoration) {
    return super.phoneInputDecoration(decoration).copyWith(
      prefixIcon: buildCountrySelector(),
    );
  } 

  @override
  FxSelectFieldDecoration<FxCountry> get countrySelectorDecoration {
    return super.countrySelectorDecoration.apply(
      border: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      filled: false,
    );
  }

  @override
  Widget buildCountrySelector() => Container(
    width: 120.w,
    constraints: BoxConstraints(
      minWidth: screenWidth * 0.35
    ),
    child: 
    IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: super.buildCountrySelector(),
          ),
          Container(
            margin: EdgeInsets.only(
              top: sizes.sm,
              bottom: sizes.sm,
              right: sizes.sm,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: theme.dividerColor,
                  width: 1,
                )
              )
            )
          )
        ]
      )
    )
  );
}
