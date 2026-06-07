import 'package:flutter/material.dart';

class FxFieldOptions {
  const FxFieldOptions({
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.maxLength,
    this.focusNode,
    this.autofocus = false,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.readOnly = false,
    this.showCursor = false,
    this.showErrorText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.enabled = true,
    this.labelBehavior = FxLabelBehavior.auto,
  });

  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;

  final Widget? prefix;
  final Widget? prefixIcon;

  final Widget? suffix;
  final Widget? suffixIcon;

  final TextCapitalization textCapitalization;

  final int maxLines;
  final int? maxLength;

  final FocusNode? focusNode;

  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;

  final bool readOnly;
  final bool showCursor;
  final bool showErrorText;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final bool obscureText;
  final bool enabled;

  final FxLabelBehavior labelBehavior;
}

enum FxLabelBehavior {
  auto,
  floating,
  external
}