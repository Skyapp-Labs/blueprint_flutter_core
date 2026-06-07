import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_text_field.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_field_options.dart';

/// A styled text input field with label, hint, error, prefix, suffix,
/// and password visibility toggle support.
class FxPasswordField extends StatefulWidget {
  const FxPasswordField({
    super.key,
    this.options = const FxFieldOptions(),
    this.decoration = const InputDecoration(),
    this.onSaved,
    this.onChanged,
    this.validator,
    this.controller,
    this.onSubmitted,
    this.initialValue,
  });

  final String? initialValue;
  final FxFieldOptions options;
  final InputDecoration decoration;

  final FormFieldValidator<String>? validator;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String?>? onSaved;
  final TextEditingController? controller;

  @override
  State<FxPasswordField> createState() => _FxPasswordFieldState();
}

class _FxPasswordFieldState extends State<FxPasswordField> with FxUiToolkit {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return FxTextField(
      options: widget.options,
      decoration: _themedDecoration,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      validator: widget.validator,
      controller: widget.controller,
      onSaved: widget.onSaved,
      initialValue: widget.initialValue,
    );
  }

  InputDecoration get _themedDecoration => widget.decoration.copyWith(
    suffixIcon: _buildSuffixIcon()
  );

  Widget _buildSuffixIcon() {
    if(widget.decoration.suffixIcon != null) return widget.decoration.suffixIcon!;
    
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeInBack,
      transitionBuilder: componentTheme.passwordTransition,
      child: IconButton(
        key: ValueKey('${_obscured ? 'obscured' : 'visible'}_suffix_icon'), 
        onPressed: () => setState(() => _obscured = !_obscured),
        tooltip: _obscured ? 'Show password' : 'Hide password',
        icon: _obscured 
          ? componentTheme.obscuredSuffixIcon 
          : componentTheme.visibleSuffixIcon
      )
    );
  }
}