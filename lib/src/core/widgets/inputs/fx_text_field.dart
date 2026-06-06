import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';

/// A styled text input field with label, hint, error, prefix, suffix,
/// and password visibility toggle support.
class FxTextField extends StatefulWidget {
  const FxTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.enabled = true,
    this.autofocus = false,
    this.onSaved,
    this.maxLines = 1,
    this.maxLength,
    this.focusNode,
    this.initialValue,
    this.textCapitalization = TextCapitalization.none,
    this.decoration = const InputDecoration(),
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String?>? onSaved;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final bool autofocus;
  final int maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final String? initialValue;
  final TextCapitalization textCapitalization;
  final InputDecoration decoration;

  @override
  State<FxTextField> createState() => _FxTextFieldState();
}

class _FxTextFieldState extends State<FxTextField> with FxUiToolkit {
  late bool _obscured;

  @override
  void initState() {
    super.initState();
    _obscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    if(!_shouldNotFloatLabel) return _buildTextField();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: _spacing,
      children: [
        _buildLabel(),
        _buildTextField(),
      ]
    );
  }

  String? get _labelText => widget.label ?? widget.decoration.labelText;

  double get _spacing {
    final padding = _themedDecoration.contentPadding?.vertical ?? 0;
    return padding > 0 ? ((padding / 2) * .5) : sizes.xs;
  }

  bool get _shouldNotFloatLabel => (
    _labelText != null &&
    widget.decoration.floatingLabelBehavior == null
  );

  InputDecoration get _themedDecoration => widget.decoration
    .applyDefaults(theme.inputDecorationTheme);

  Widget _buildLabel() => Text(
    _labelText ?? '',
    textAlign: switch (_themedDecoration.floatingLabelAlignment) {
      FloatingLabelAlignment.start => TextAlign.start,
      FloatingLabelAlignment.center => TextAlign.center,
      _ => TextAlign.end,
    },
    style: _themedDecoration.labelStyle,
  );

  Widget _buildTextField() => TextFormField(
    controller: widget.controller,
    initialValue: widget.initialValue,
    obscureText: _obscured,
    keyboardType: widget.keyboardType,
    textInputAction: widget.textInputAction,
    onChanged: widget.onChanged,
    onFieldSubmitted: widget.onSubmitted,
    validator: widget.validator,
    enabled: widget.enabled,
    autofocus: widget.autofocus,
    maxLines: widget.obscureText ? 1 : widget.maxLines,
    maxLength: widget.maxLength,
    focusNode: widget.focusNode,
    onSaved: widget.onSaved,
    textCapitalization: widget.textCapitalization,
    decoration: widget.decoration.applyDefaults(theme.inputDecorationTheme)
      .copyWith(
        labelText: widget.label,
        hintText: widget.hint,
        errorText: widget.errorText,
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        suffix: widget.suffix,
        suffixIcon: _buildSuffixIcon(),
        floatingLabelBehavior: _shouldNotFloatLabel 
          ? FloatingLabelBehavior.never
          : null,
      ),
  );

  Widget? _buildSuffixIcon() {
    if(!widget.obscureText) return widget.suffixIcon;
    
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