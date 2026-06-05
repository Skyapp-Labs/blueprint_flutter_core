part of 'fx_overlay.dart';

/// How an overlay is presented.
enum FxOverlayType {
  bottomSheet,
  dialog,
  modal,
}

/// How items in an overlay list can be selected.
enum FxOverlaySelectionMode {
  /// Tap an item to select it and close the overlay.
  single,

  /// Tap items to toggle selection; confirm with the footer action.
  multiple,
}

/// Root configuration for bottom sheets and dialogs.
@immutable
class FxOverlayData<T> {
  const FxOverlayData({
    this.title,
    this.list,
    this.heading,
    this.footer,
    this.builder,
  }) : assert(
          list != null || builder != null,
          'Provide list for picker overlays or builder for custom content.',
        );

  final String? title;
  final FxOverlayListData<T>? list;
  final Widget? Function(BuildContext context)? heading;
  final Widget? Function(BuildContext context)? footer;
  final Widget Function(BuildContext context)? builder;
}

class FxOverlayTileThemeData {
  const FxOverlayTileThemeData({
    this.margin,
    this.visualDensity = VisualDensity.compact,
    this.dense = false,
    this.shape,
    this.contentPadding,
    this.minTileHeight,
    this.horizontalTitleGap,
    this.foregroundColor,
    this.titleStyle,
    this.subtitleStyle,
    this.backgroundColor,
    this.showSelectionIndicator,
  });

  FxOverlayTileThemeData merge(FxOverlayTileThemeData? other) => FxOverlayTileThemeData(
    margin: other?.margin ?? margin,
    shape: other?.shape ?? shape,
    visualDensity: other?.visualDensity ?? visualDensity,
    dense: other?.dense ?? dense,
    contentPadding: other?.contentPadding ?? contentPadding,
    minTileHeight: other?.minTileHeight ?? minTileHeight,
    horizontalTitleGap: other?.horizontalTitleGap ?? horizontalTitleGap,
    titleStyle: other?.titleStyle ?? titleStyle,
    subtitleStyle: other?.subtitleStyle ?? subtitleStyle,
    foregroundColor: other?.foregroundColor ?? foregroundColor,
    backgroundColor: other?.backgroundColor ?? backgroundColor,
    showSelectionIndicator: other?.showSelectionIndicator ?? showSelectionIndicator,
  );

  final EdgeInsets? margin;
  final ShapeBorder? shape;
  final VisualDensity? visualDensity;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool dense;
  final EdgeInsets? contentPadding;
  final double? minTileHeight;
  final double? horizontalTitleGap;
  final Color Function(bool isSelected)? foregroundColor;
  final Color Function(bool isSelected)? backgroundColor;
  final bool? showSelectionIndicator;
}

@immutable
class FxOverlayTile<T> {
  const FxOverlayTile({
    this.builder,
    this.leading,
    this.subtitle,
    this.title,
    this.trailing,
    this.themeData,
  });

  final Widget Function(BuildContext context, T item, bool isSelected, VoidCallback? onTap)? builder;
  final String Function(T item)? title;
  final String Function(T item)? subtitle;
  final Widget Function(T item)? leading;
  final Widget Function(T item)? trailing;
  final FxOverlayTileThemeData? themeData;

  FxOverlayTile<T> applyThemeData(FxOverlayTileThemeData themeData) => FxOverlayTile<T>(
    builder: builder,
    title: title,
    subtitle: subtitle,
    leading: leading,
    trailing: trailing,
    themeData: themeData.merge(this.themeData),
  );
}

@immutable
class FxOverlayListData<T> {
  const FxOverlayListData({
    this.items,
    this.favoriteItems,
    this.itemsAsStream,
    this.selectedItem,
    this.itemTile = const FxOverlayTile(),
    this.searchHint = 'Search...',
    this.onSearch,
    this.itemComparer,
    this.selectionMode = FxOverlaySelectionMode.single,
    this.closeOnSelect = true,
  })  : selectedItems = null,
        confirmLabel = 'Done',
        clearLabel = 'Clear',
        minSelection = 0,
        maxSelection = null,
        assert(items != null || itemsAsStream != null,
            'Either items or itemsAsStream must be provided.');

  const FxOverlayListData.multiSelect({
    this.items,
    this.favoriteItems,
    this.itemsAsStream,
    this.selectedItems,
    this.itemTile = const FxOverlayTile(),
    this.searchHint = 'Search...',
    this.onSearch,
    this.itemComparer,
    this.confirmLabel = 'Done',
    this.clearLabel = 'Clear',
    this.minSelection = 0,
    this.maxSelection,
    this.closeOnSelect = false,
  })  : selectedItem = null,
        selectionMode = FxOverlaySelectionMode.multiple,
        assert(items != null || itemsAsStream != null,
            'Either items or itemsAsStream must be provided.');

  final List<T>? items;
  final List<T>? favoriteItems;
  final Stream<List<T>>? itemsAsStream;
  final T? selectedItem;
  final List<T>? selectedItems;
  final FxOverlayTile<T> itemTile;
  final String? searchHint;
  final List<T>? Function(String? search, List<T> items)? onSearch;
  final bool Function(T a, T b)? itemComparer;
  final FxOverlaySelectionMode selectionMode;
  final bool closeOnSelect;
  final String confirmLabel;
  final String? clearLabel;
  final int minSelection;
  final int? maxSelection;

  bool get isMultiSelect => selectionMode == FxOverlaySelectionMode.multiple;
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

/// @nodoc
typedef FxOverlayListView<T> = FxOverlayList<T>;

/// @nodoc
typedef FxOverlayContainer<T> = FxOverlayBody<T>;

/// @nodoc
typedef FxBottomSheetContainer<T> = FxBottomSheetShell<T>;
