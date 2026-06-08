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

  FxFieldOptions copyWith({
    String? label,
    String? hint,
    String? helperText,
    String? errorText,
    Widget? prefix,
    Widget? prefixIcon,
    Widget? suffix,
    Widget? suffixIcon,
    TextCapitalization? textCapitalization,
    int? maxLines,
    int? maxLength,
    FocusNode? focusNode,
    bool? autofocus,
    bool? autocorrect,
    bool? enableSuggestions,
    bool? readOnly,
    bool? showCursor,
    bool? showErrorText,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool? obscureText,
    bool? enabled,
    FxLabelBehavior? labelBehavior,
  }) =>
      FxFieldOptions(
        label: label ?? this.label,
        hint: hint ?? this.hint,
        helperText: helperText ?? this.helperText,
        errorText: errorText ?? this.errorText,
        prefix: prefix ?? this.prefix,
        prefixIcon: prefixIcon ?? this.prefixIcon,
        suffix: suffix ?? this.suffix,
        suffixIcon: suffixIcon ?? this.suffixIcon,
        textCapitalization: textCapitalization ?? this.textCapitalization,
        maxLines: maxLines ?? this.maxLines,
        maxLength: maxLength ?? this.maxLength,
        focusNode: focusNode ?? this.focusNode,
        autofocus: autofocus ?? this.autofocus,
        autocorrect: autocorrect ?? this.autocorrect,
        enableSuggestions: enableSuggestions ?? this.enableSuggestions,
        readOnly: readOnly ?? this.readOnly,
        showCursor: showCursor ?? this.showCursor,
        showErrorText: showErrorText ?? this.showErrorText,
        keyboardType: keyboardType ?? this.keyboardType,
        textInputAction: textInputAction ?? this.textInputAction,
        obscureText: obscureText ?? this.obscureText,
        enabled: enabled ?? this.enabled,
        labelBehavior: labelBehavior ?? this.labelBehavior,
      );
}

enum FxLabelBehavior {
  auto,
  floating,
  external
}