part of '_overlay.dart';

class FxOverlayData<T> {
  /// Title displayed at the top of the overlay.
  final String? title;
  /// List data — when provided, renders a scrollable item list.
  final FxOverlayListData<T>? list;
  /// Optional heading widget rendered above the main content.
	final Widget? Function(BuildContext)? heading;
  /// Optional footer widget rendered below the main content.
	final Widget? Function(BuildContext)? footer;
  /// Custom content builder — used when [list] is null.
	final Widget Function(BuildContext)? builder;

	FxOverlayData ({
		this.title,
		this.heading,
		this.footer,
		this.builder,
    this.list,
	});
}

class FxOverlayTile<T> {
  const FxOverlayTile({
    this.builder,
    this.leading,
    this.subtitle,
    this.title,
    this.trailing,
    this.visualDensity = VisualDensity.compact,
    this.dense = false,
    this.contentPadding,
    this.minTileHeight,
    this.horizontalTitleGap,
    this.foregroundColor,
    this.titleStyle,
    this.subtitleStyle,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
  });

  /// Builder for the item widget
  final Widget Function(BuildContext, T, bool isSelected)? builder;
  /// Builder for the title of the item
  final String Function(T)? title;
  /// Builder for the subtitle of the item
  final String Function(T)? subtitle;
  /// Builder for the leading of the item
  final Widget Function(T)? leading;
  /// Builder for the trailing of the item
  final Widget Function(T)? trailing;

  final VisualDensity? visualDensity;

  /// Style for the title of the item
  final TextStyle? titleStyle;
  
  /// Style for the subtitle of the item
  final TextStyle? subtitleStyle;

  final bool dense;

  final EdgeInsets? contentPadding;
  
  final double? minTileHeight;
  
  final double? horizontalTitleGap;
  
  final Color? foregroundColor;

  final Color? backgroundColor;
  
  final Color? selectedBackgroundColor;
  
  final Color? selectedForegroundColor;
}

class FxOverlayListData<T> {
  /// List of items to display
  final List<T>? items;
  
  /// List of favorite items to display
  final List<T>? favoriteItems;

  /// Stream of items to display
  final Stream<List<T>>? itemsAsStream;

  /// Selected item
  final T? selectedItem;

  /// Builder for the item widget
  final FxOverlayTile<T> itemTile;

  /// Search hint for the search field
  final String? searchHint;

  /// Callback for the search field
  final List<T>? Function(String? search, List<T> items)? onSearch;

  const FxOverlayListData({
    this.searchHint = 'Search...',
    this.items,
    this.favoriteItems,
    this.itemsAsStream,
    this.selectedItem,
    this.itemTile = const FxOverlayTile(),
    this.onSearch,
  }): assert(items != null || itemsAsStream != null, 'Either items or itemsAsStream must be provided');
}
