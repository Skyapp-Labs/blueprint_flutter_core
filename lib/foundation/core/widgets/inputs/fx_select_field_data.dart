part of '_index.dart';

class FxSelectFieldData<T> {
  /// List of items to display
  final List<T>? items;
  /// Stream of items to display
  final Stream<List<T>>? itemsAsStream;

  /// Builder for the label of each item in the list
  final String Function(T)? labelBuilder;

  /// Builder for the custom item widget (overrides labelBuilder in list)
  final Widget Function(BuildContext, T, bool isSelected)? itemBuilder;

  /// Builder for the selected value in the field trigger
  final Widget Function(T)? selectedBuilder;

  /// Search hint text
  final String searchHint;
  /// search callback that returns the filtered items
  final List<T> Function(String query, List<T> items)? onSearch;

  /// Allow multiple selection
  final bool multiSelect;

  FxSelectFieldData({
    this.items,
    this.itemsAsStream,
    this.labelBuilder,
    this.itemBuilder,
    this.selectedBuilder,
    this.searchHint = 'Search...',
    this.onSearch,
    this.multiSelect = false,
  });
}
