import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_field.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_field_options.dart';

/// A styled text input field with label, hint, error, prefix, suffix,
/// and password visibility toggle support.
class FxTextField extends StatelessWidget with FxUiToolkit {
  FxTextField({
    super.key,
    this.options = const FxFieldOptions(),
    this.decoration = const InputDecoration(),
    this.onSaved,
    this.onChanged,
    this.validator,
    this.controller,
    this.onSubmitted,
    this.initialValue,
    this.inputFormatters,
  });

  final String? initialValue;
  final FxFieldOptions options;
  final InputDecoration decoration;

  final FormFieldValidator<String>? validator;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String?>? onSaved;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  InputDecoration _themedDecoration(BuildContext context) => FxField.resolveDecoration(
    context: context,
    options: options,
    decoration: decoration,
  );

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return FxField(
      options: options,
      decoration: decoration,
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        obscureText: options.obscureText,
        keyboardType: options.keyboardType,
        textInputAction: options.textInputAction,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        validator: validator,
        enabled: options.enabled,
        autofocus: options.autofocus,
        maxLines: options.obscureText ? 1 : options.maxLines,
        maxLength: options.maxLength,
        focusNode: options.focusNode,
        onSaved: onSaved,
        textCapitalization: options.textCapitalization,
        inputFormatters: inputFormatters,
        decoration: _themedDecoration(context)
      )
    );
  }
}
