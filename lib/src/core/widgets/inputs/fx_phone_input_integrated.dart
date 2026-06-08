part of 'fx_phone_input.dart';

class FxPhoneInputIntegrated extends _FxPhoneInputLayoutWidget {
  FxPhoneInputIntegrated({super.key, required super.data});

  @override
  FxFieldOptions get phoneOptions => super.phoneOptions.copyWith(
    prefixIcon: LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth * _FxPhoneInputDefaults.dialCodeWidthFactor
            : MediaQuery.sizeOf(context).width * _FxPhoneInputDefaults.dialCodeWidthFactor;

        return SizedBox(
          width: maxWidth,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: buildCountryField()),
                _VerticalFieldDivider(),
              ],
            ),
          )
        );
      },
    )
  );

  @override
  FxFieldOptions get countryOptions => super.countryOptions.copyWith(
    label: '',
  );

  @override
  InputDecoration get countryDecoration => super.countryDecoration.copyWith(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    filled: false,
    floatingLabelBehavior: FloatingLabelBehavior.never
  );
}

class _VerticalFieldDivider extends StatelessWidget with FxUiToolkit {
  _VerticalFieldDivider();

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Container(
      margin: EdgeInsets.only(
        right: sizes.md,
        top: sizes.sm,
        bottom: sizes.sm,
      ),
      width: 1,
      color: theme.dividerColor,
    );
  }
}
