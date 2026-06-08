part of 'fx_overlay.dart';

enum FxOverlayMode {
  builder,
  singleSelect,
  multiSelect,
}

typedef FxOverlaySearchCallback<T> = List<T>? Function(
  String search,
  List<T> items,
);

typedef FxOverlayItemComparer<T> = bool Function(T a, T b);

@immutable
class FxOverlayOptions<T> {
  const FxOverlayOptions._({
    required this.mode,
    this.title,
    this.heading,
    this.footer,
    this.itemTile = const FxOverlayTile(),
    this.builder,
    this.items,
    this.favoriteItems,
    this.itemsAsStream,
    this.selectedItems,
    this.searchHint = 'Search...',
    this.onSearch,
    this.itemComparer,
    this.closeOnSelect = true,
    this.confirmLabel = 'Done',
    this.clearLabel = 'Clear',
    this.minSelection = 0,
    this.maxSelection,
  });

  factory FxOverlayOptions.builder({
    String? title,
    Widget Function(BuildContext context)? heading,
    Widget Function(BuildContext context)? footer,
    required Widget Function(BuildContext context) builder,
  }) =>
      FxOverlayOptions._(
        mode: FxOverlayMode.builder,
        title: title,
        heading: heading,
        footer: footer,
        builder: builder,
      );

  factory FxOverlayOptions.singleSelect({
    String? title,
    Widget Function(BuildContext context)? heading,
    Widget Function(BuildContext context)? footer,
    required List<T>? items,
    List<T>? favoriteItems,
    Stream<List<T>>? itemsAsStream,
    T? selectedItem,
    FxOverlayTile<T> itemTile = const FxOverlayTile(),
    String searchHint = 'Search...',
    FxOverlaySearchCallback<T>? onSearch,
    FxOverlayItemComparer<T>? itemComparer,
    bool closeOnSelect = true,
  }) =>
      _list(
        mode: FxOverlayMode.singleSelect,
        title: title,
        heading: heading,
        footer: footer,
        itemTile: itemTile,
        items: items,
        favoriteItems: favoriteItems,
        itemsAsStream: itemsAsStream,
        selectedItems: selectedItem == null ? null : [selectedItem],
        searchHint: searchHint,
        onSearch: onSearch,
        itemComparer: itemComparer,
        closeOnSelect: closeOnSelect,
      );

  factory FxOverlayOptions.multiSelect({
    String? title,
    Widget Function(BuildContext context)? heading,
    Widget Function(BuildContext context)? footer,
    required List<T>? items,
    List<T>? favoriteItems,
    FxOverlayTile<T> itemTile = const FxOverlayTile(),
    Stream<List<T>>? itemsAsStream,
    List<T>? selectedItems,
    String searchHint = 'Search...',
    FxOverlaySearchCallback<T>? onSearch,
    FxOverlayItemComparer<T>? itemComparer,
    bool closeOnSelect = false,
    String confirmLabel = 'Done',
    String? clearLabel = 'Clear',
    int minSelection = 0,
    int? maxSelection,
  }) =>
      _list(
        mode: FxOverlayMode.multiSelect,
        title: title,
        heading: heading,
        footer: footer,
        items: items,
        itemTile: itemTile,
        favoriteItems: favoriteItems,
        itemsAsStream: itemsAsStream,
        selectedItems: selectedItems,
        searchHint: searchHint,
        onSearch: onSearch,
        itemComparer: itemComparer,
        closeOnSelect: closeOnSelect,
        confirmLabel: confirmLabel,
        clearLabel: clearLabel,
        minSelection: minSelection,
        maxSelection: maxSelection,
      );

  static FxOverlayOptions<T> _list<T>({
    required FxOverlayMode mode,
    String? title,
    Widget Function(BuildContext context)? heading,
    Widget Function(BuildContext context)? footer,
    List<T>? items,
    List<T>? favoriteItems,
    Stream<List<T>>? itemsAsStream,
    List<T>? selectedItems,
    String searchHint = 'Search...',
    FxOverlaySearchCallback<T>? onSearch,
    FxOverlayItemComparer<T>? itemComparer,
    bool closeOnSelect = true,
    String confirmLabel = 'Done',
    String? clearLabel = 'Clear',
    required FxOverlayTile<T> itemTile,
    int minSelection = 0,
    int? maxSelection,
  }) {
    assert(
      items != null && items.isNotEmpty || itemsAsStream != null,
      '\n\nFxOverlayOptions.multiSelect: items or itemsAsStream must be non-empty\n'
    );
    
    return FxOverlayOptions._(
      mode: mode,
      title: title,
      heading: heading,
      footer: footer,
      items: items,
      favoriteItems: favoriteItems,
      itemsAsStream: itemsAsStream,
      selectedItems: selectedItems,
      itemTile: itemTile,
      searchHint: searchHint,
      onSearch: onSearch,
      itemComparer: itemComparer,
      closeOnSelect: closeOnSelect,
      confirmLabel: confirmLabel,
      clearLabel: clearLabel,
      minSelection: minSelection,
      maxSelection: maxSelection,
    );
  }

  final FxOverlayMode mode;
  final String? title;
  final Widget Function(BuildContext context)? heading;
  final Widget Function(BuildContext context)? footer;
  final Widget Function(BuildContext context)? builder;
  final List<T>? items;
  final List<T>? favoriteItems;
  final Stream<List<T>>? itemsAsStream;
  final List<T>? selectedItems;
  final String? searchHint;
  final FxOverlayTile<T> itemTile;
  final FxOverlaySearchCallback<T>? onSearch;
  final FxOverlayItemComparer<T>? itemComparer;
  final bool closeOnSelect;
  final String confirmLabel;
  final String? clearLabel;
  final int minSelection;
  final int? maxSelection;

  bool get isBuilder => mode == FxOverlayMode.builder;
  bool get isSingleSelect => mode == FxOverlayMode.singleSelect;
  bool get isMultiSelect => mode == FxOverlayMode.multiSelect;
  bool get isListOverlay => !isBuilder;

  T? get selectedItem {
    if (selectedItems == null || selectedItems!.isEmpty) return null;
    return selectedItems!.first;
  }

  bool get hasSearch => onSearch != null;
  bool get hasFavorites => favoriteItems?.isNotEmpty ?? false;
  bool get hasSelection => selectedItems?.isNotEmpty ?? false;

  FxOverlayOptions<T> asMultiSelect({
    String confirmLabel = 'Done',
    String? clearLabel = 'Clear',
    int minSelection = 0,
    int? maxSelection,
  }) =>
      _rebuild(
        mode: FxOverlayMode.multiSelect,
        closeOnSelect: false,
        confirmLabel: confirmLabel,
        clearLabel: clearLabel,
        minSelection: minSelection,
        maxSelection: maxSelection,
      );

  FxOverlayOptions<T> asSingleSelect() => _rebuild(
    mode: FxOverlayMode.singleSelect,
    closeOnSelect: true,
    selectedItems: selectedItem == null ? null : [selectedItem as T],
  );

  FxOverlayOptions<T> _rebuild({
    FxOverlayMode? mode,
    bool? closeOnSelect,
    String? confirmLabel,
    String? clearLabel,
    int? minSelection,
    int? maxSelection,
    List<T>? selectedItems,
  }) =>
      FxOverlayOptions._(
        mode: mode ?? this.mode,
        title: title,
        heading: heading,
        footer: footer,
        builder: builder,
        items: items,
        favoriteItems: favoriteItems,
        itemsAsStream: itemsAsStream,
        selectedItems: selectedItems ?? this.selectedItems,
        searchHint: searchHint,
        onSearch: onSearch,
        itemComparer: itemComparer,
        closeOnSelect: closeOnSelect ?? this.closeOnSelect,
        confirmLabel: confirmLabel ?? this.confirmLabel,
        clearLabel: clearLabel ?? this.clearLabel,
        minSelection: minSelection ?? this.minSelection,
        maxSelection: maxSelection ?? this.maxSelection,
      );
}