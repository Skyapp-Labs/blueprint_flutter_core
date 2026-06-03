part of 'fx_phone_input.dart';

class FxPhoneInputIntegrated extends _FxPhoneInputLayoutWidget {
  FxPhoneInputIntegrated({super.key, required super.data});

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return buildPhoneField(
      decorationOverride: themedDecoration(data.decoration).copyWith(
        labelText: data.decoration.phoneLabel,
        prefixIcon: _IntegratedDialCodePrefix(
          widthFactor: data.decoration.integratedDialCodeWidthFactor,
          child: buildCountryField(
            valueLabelBuilder: dialCodeLabel,
            decoration: countryFieldDecoration(border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}

class _IntegratedDialCodePrefix extends StatelessWidget {
  const _IntegratedDialCodePrefix({
    required this.widthFactor,
    required this.child,
  });

  final double widthFactor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth * widthFactor
            : MediaQuery.sizeOf(context).width * widthFactor;

        return SizedBox(
          width: maxWidth,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: child),
                const _VerticalFieldDivider(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VerticalFieldDivider extends StatelessWidget {
  const _VerticalFieldDivider();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: 1,
      color: theme.dividerColor,
    );
  }
}
