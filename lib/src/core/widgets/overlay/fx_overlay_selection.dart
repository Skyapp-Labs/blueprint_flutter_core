part of 'fx_overlay.dart';

/// Mutable selection state for [FxOverlayList].
class _FxOverlaySelection<T> {
  _FxOverlaySelection(this.data) {
    if (data.isMultiSelect) {
      _selected = [...?data.selectedItems];
    }
  }

  final FxOverlayListData<T> data;
  List<T> _selected = [];

  bool get isMultiSelect => data.isMultiSelect;
  List<T> get selectedValues => List.unmodifiable(_selected);

  bool isSelected(T item) {
    if (isMultiSelect) {
      return fxOverlayListContains(_selected, item, data.itemComparer);
    }
    return fxOverlayItemsEqual(data.selectedItem, item, data.itemComparer);
  }

  bool get canConfirm =>
      !isMultiSelect || _selected.length >= data.minSelection;

  bool canToggle(T item) {
    if (!isMultiSelect) return true;
    if (isSelected(item)) return true;
    final max = data.maxSelection;
    if (max == null) return true;
    return _selected.length < max;
  }

  void toggle(T item) {
    if (!isMultiSelect) return;

    if (isSelected(item)) {
      _selected.removeWhere(
        (value) => fxOverlayItemsEqual(value, item, data.itemComparer),
      );
      return;
    }

    if (!canToggle(item)) return;
    _selected = [..._selected, item];
  }

  void clear() => _selected = [];

  List<T> confirm() => List.unmodifiable(_selected);
}
