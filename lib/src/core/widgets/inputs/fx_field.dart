import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_field_options.dart';

class FxField extends StatelessWidget with FxUiToolkit {
  FxField({
    super.key,
    required this.child,
    required this.options,
    required this.decoration,
  });

  final Widget child;
  final FxFieldOptions options;
  final InputDecoration decoration;

  static InputDecoration resolveDecoration({
    required BuildContext context,
    required FxFieldOptions options,
    InputDecoration decoration = const InputDecoration(),
  }) {
    final theme = Theme.of(context);
    final themed = decoration.applyDefaults(theme.inputDecorationTheme);

    return themed.copyWith(
      labelText: options.labelBehavior == FxLabelBehavior.external 
        ? null 
        : options.label,
      hintText: options.hint,
      helperText: options.helperText,
      errorText: options.errorText,
      prefix: options.prefix,
      prefixIcon: options.prefixIcon,
      suffix: options.suffix,
      suffixIcon: options.suffixIcon,
      floatingLabelBehavior: options.labelBehavior == FxLabelBehavior.external
        ? FloatingLabelBehavior.never
        : null
    );
  }

  bool _showExternalLabel(InputDecoration decoration) {
    if (options.label == null || options.label?.isEmpty == true) return false;

    return switch (options.labelBehavior) {
      FxLabelBehavior.external => true,
      FxLabelBehavior.floating => false,
      FxLabelBehavior.auto => decoration.floatingLabelBehavior == null,
    };
  }

  double _spacing(InputDecoration decoration) {
    final padding = decoration.contentPadding?.vertical ?? 0;
    return padding > 0 ? (padding * .25) : sizes.xs;
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final themedDecoration = decoration.applyDefaults(theme.inputDecorationTheme);

    if (!_showExternalLabel(themedDecoration)) return child;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: _spacing(themedDecoration),
      children: [
        Text(
          options.label!,
          textAlign: switch (themedDecoration.floatingLabelAlignment) {
            FloatingLabelAlignment.start => TextAlign.start,
            FloatingLabelAlignment.center => TextAlign.center,
            _ => TextAlign.end,
          },
          style: themedDecoration.labelStyle,
        ),
        child
      ],
    );
  }
}