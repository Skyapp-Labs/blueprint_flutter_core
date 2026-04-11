part of '_index.dart';

enum FxOverlayStyle {
  /// Standard bottom sheet — for simple lists, forms
  bottomSheet,
  /// Standard dialog — for simple lists, forms
  dialog,
  /// Standard full page modal — for complex forms, detail views
  modal,
}

class FxSelectField<T> extends StatefulWidget {

  const FxSelectField({
    super.key,
    this.selectedValue,
    this.selectedValues,
    required this.onChanged,
    this.onSearch,
    required this.data,
    this.overlayStyle = FxOverlayStyle.bottomSheet,
    this.label,
    this.hint,
    this.errorText,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.decoration
  });

  final T? selectedValue;
  final List<T>? selectedValues;
  final void Function(T value, List<T>? values) onChanged;
  final List<T>? Function(String? search, List<T> items)? onSearch;
  final FxSelectFieldData<T> data;
  final FxOverlayStyle overlayStyle;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputDecoration? decoration;

  @override
  State<FxSelectField<T>> createState() => _FxSelectFieldState<T>();
}

class _FxSelectFieldState<T> extends State<FxSelectField<T>> with FxUiToolkit {

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: input()
    );
  }

  Widget input() => InputDecorator(
    decoration: (widget.decoration ?? InputDecoration()).copyWith(
      labelText: widget.label,
      hintText: _hasValue ? null : (widget.hint ?? 'Select...'),
      errorText: widget.errorText,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon ?? Icon(
        Icons.keyboard_arrow_down_rounded,
        size: sizes.iconSm,
      ),
      enabled: widget.enabled,
      // Make the whole field tappable — not just the suffix icon
      suffixIconConstraints: const BoxConstraints(),
    ),
    isEmpty: !_hasValue,
    child: _hasValue
        ? (widget.data.selectedBuilder != null && widget.selectedValue != null
            ? widget.data.selectedBuilder!(widget.selectedValue as T)
            : Text(
                _displayText,
                style: typography.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ))
        : const SizedBox.shrink(),
  );

  bool get _hasValue => widget.selectedValue != null ||
      (widget.selectedValues?.isNotEmpty == true);

  String get _displayText {
    if (widget.data.multiSelect && widget.selectedValues != null) {
      return widget.selectedValues!
          .map((v) => widget.data.labelBuilder?.call(v) ?? v.toString())
          .join(', ');
    }

    if (widget.selectedValue != null) {
      return widget.data.labelBuilder?.call(widget.selectedValue as T)
          ?? widget.selectedValue.toString();
    }

    return '';
  }

  Future<void> _onTap() async {
    if (!widget.enabled) return;
    final result = await _showOverlay();
    if (result != null) widget.onChanged(result, null);
  }

  Future<T?> _showOverlay() async {
    final data = FxOverlayData<T>(
      title: widget.label,
      list: FxOverlayListData<T>(
        items: widget.data.items,
        itemsAsStream: widget.data.itemsAsStream,
        titleTextBuilder: widget.data.labelBuilder,
        itemBuilder: widget.data.itemBuilder,
        searchHint: widget.onSearch != null ? widget.data.searchHint : null,
        onSearch: widget.onSearch,
      ),
    );

    switch (widget.overlayStyle) {
      case FxOverlayStyle.bottomSheet:
        return showFxBottomSheet<T>(
          data: data,
          cancelable: true
        );
      case FxOverlayStyle.dialog:
        return showFxDialog<T>(
          data: data,
          cancelable: true,
          style: FxDialogStyle.center,
        );
      case FxOverlayStyle.modal:
        return showFxDialog<T>(
          data: data,
          cancelable: true,
          style: FxDialogStyle.fullPage,
        );
    }
  }
}

