part of 'fx_overlay.dart';

/// Mutable selection state for [FxOverlayList].
class FxOverlaySelectionState<T> {
  FxOverlaySelectionState(this.options) : _selected = options.selectedItems ?? [];

  final FxOverlayOptions<T> options;
  List<T> _selected = [];

  bool get isMultiSelect => options.isMultiSelect;
  List<T> get selectedValues => List.unmodifiable(_selected);

  bool isSelected(T item) {
    if (isMultiSelect) {
      return fxOverlayListContains(
        _selected, 
        item, 
        options.itemComparer
      );
    }
    return fxOverlayItemsEqual(
      options.selectedItem, 
      item, 
      options.itemComparer
    );
  }

  bool get canConfirm => (
    !isMultiSelect || 
    _selected.length >= options.minSelection
  );

  bool canToggle(T item) {
    if (!isMultiSelect) return true;
    if (isSelected(item)) return true;
    final max = options.maxSelection;
    if (max == null) return true;
    return _selected.length < max;
  }

  void toggle(T item) {
    if (!isMultiSelect) return;

    if (isSelected(item)) {
      _selected.removeWhere(
        (value) => fxOverlayItemsEqual(value, item, options.itemComparer),
      );
      return;
    }

    if (!canToggle(item)) return;
    
    _selected = [..._selected, item];
  }

  void clear() => _selected = [];

  List<T> confirm() => List.unmodifiable(_selected);
}

bool fxOverlayItemsEqual<T>(
  T? a,
  T? b,
  bool Function(T a, T b)? comparer,
) {
  if (a == null || b == null) return false;
  return comparer?.call(a, b) ?? a == b;
}

bool fxOverlayListContains<T>(
  List<T> list,
  T item,
  bool Function(T a, T b)? comparer,
) {
  return list.any((value) => fxOverlayItemsEqual(value, item, comparer));
}