part of 'fx_select_field.dart';

enum FxOverlayType {
  /// Standard bottom sheet — for simple lists, forms
  bottomSheet,
  /// Standard dialog — for simple lists, forms
  dialog,
  /// Standard full page modal — for complex forms, detail views
  modal,
}

class FxSelectFieldDecoration<T> extends InputDecoration {
  final String searchHint;
  final String selectHint;
  final String? selectLabel;
  final String? overlayTitle;
  final TextStyle? style;
  final bool expands;
  final Widget Function(T)? prefixIconBuilder;
  final Widget Function(T)? suffixIconBuilder;

  const FxSelectFieldDecoration({
    super.border,
    super.errorBorder,
    super.focusedBorder,
    super.enabledBorder,
    super.disabledBorder,
    super.filled,
    String? label,
    this.searchHint = 'Search...',
    String hint = 'Select an option',
    this.overlayTitle,
    super.errorText,
    super.enabled = true,
    this.style,
    EdgeInsets? padding,
    this.prefixIconBuilder,
    this.suffixIconBuilder,
    this.expands = false,
  })  : selectHint = hint,
        selectLabel = label,
        super(
          contentPadding: padding,
          isCollapsed: true,
          isDense: true,
          prefixIconConstraints: const BoxConstraints(),
          suffixIconConstraints: const BoxConstraints(),
        );

  FxSelectFieldDecoration<T> apply({
    InputBorder? border,
    InputBorder? errorBorder,
    InputBorder? focusedBorder,
    InputBorder? enabledBorder,
    InputBorder? disabledBorder,
    bool? filled,
    bool? expands,
  }) => FxSelectFieldDecoration(
    border: border ?? this.border,
    errorBorder: errorBorder ?? this.errorBorder,
    focusedBorder: focusedBorder ?? this.focusedBorder,
    enabledBorder: enabledBorder ?? this.enabledBorder,
    disabledBorder: disabledBorder ?? this.disabledBorder,
    filled: filled ?? this.filled,
    expands: expands ?? this.expands,
    label: selectLabel,
    hint: selectHint,
    overlayTitle: overlayTitle,
    style: style,
    searchHint: searchHint,
    prefixIconBuilder: prefixIconBuilder,
    suffixIconBuilder: suffixIconBuilder,
  );
}