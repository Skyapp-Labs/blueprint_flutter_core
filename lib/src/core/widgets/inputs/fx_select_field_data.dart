part of 'fx_select_field.dart';

/// Visual and behavioral options for [FxSelectField].
class FxSelectFieldDecoration<T> extends InputDecoration {
  const FxSelectFieldDecoration({
    super.border,
    super.errorBorder,
    super.focusedBorder,
    super.enabledBorder,
    super.disabledBorder,
    super.filled,
    String? label,
    this.searchHint = _FxSelectFieldDefaults.searchHint,
    String hint = _FxSelectFieldDefaults.hint,
    this.overlayTitle,
    super.errorText,
    super.enabled = true,
    this.style,
    EdgeInsets? padding,
    this.prefixIconBuilder,
    this.suffixIconBuilder,
    this.expands = false,
    this.confirmLabel = 'Done',
    this.clearLabel = 'Clear',
    this.minSelection = 0,
    this.maxSelection,
  })  : selectHint = hint,
        selectLabel = label,
        super(
          contentPadding: padding,
          isCollapsed: true,
          isDense: true,
          prefixIconConstraints: const BoxConstraints(),
          suffixIconConstraints: const BoxConstraints(),
        );

  final String searchHint;
  final String selectHint;
  final String? selectLabel;
  final String? overlayTitle;
  final TextStyle? style;
  final bool expands;
  final Widget Function(T value)? prefixIconBuilder;
  final Widget Function(T value)? suffixIconBuilder;

  /// Multi-select overlay footer labels and limits.
  final String confirmLabel;
  final String? clearLabel;
  final int minSelection;
  final int? maxSelection;

  /// Returns a copy with selective input-border and layout overrides.
  FxSelectFieldDecoration<T> apply({
    InputBorder? border,
    InputBorder? errorBorder,
    InputBorder? focusedBorder,
    InputBorder? enabledBorder,
    InputBorder? disabledBorder,
    bool? filled,
    bool? expands,
  }) {
    return FxSelectFieldDecoration<T>(
      border: border ?? this.border,
      errorBorder: errorBorder ?? this.errorBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      filled: filled ?? this.filled,
      label: selectLabel,
      hint: selectHint,
      searchHint: searchHint,
      overlayTitle: overlayTitle,
      errorText: errorText,
      enabled: enabled,
      style: style,
      padding: contentPadding is EdgeInsets ? contentPadding as EdgeInsets : null,
      prefixIconBuilder: prefixIconBuilder,
      suffixIconBuilder: suffixIconBuilder,
      expands: expands ?? this.expands,
    );
  }
}

abstract final class _FxSelectFieldDefaults {
  static const hint = 'Select an option';
  static const searchHint = 'Search...';
}

/// Resolves the label shown for [value], falling back to [Object.toString].
String fxSelectFieldLabel<T>(
  T value, {
  String Function(T value)? valueLabelBuilder,
}) {
  return valueLabelBuilder?.call(value) ?? value.toString();
}
