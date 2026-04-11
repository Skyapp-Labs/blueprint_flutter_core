part of '_index.dart';

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

class FxOverlayListData<T> {
  /// List of items to display
  final List<T>? items;
  /// Stream of items to display
  final Stream<List<T>>? itemsAsStream;
  /// Selected item
  final T? selectedItem;
  /// Builder for the item widget
  final Widget Function(BuildContext, T, bool isSelected)? itemBuilder;
  /// Builder for the title of the item
  final Widget Function(T)? titleBuilder;
  /// Builder for the subtitle of the item
  final Widget Function(T)? subtitleBuilder;
  /// Builder for the leading of the item
  final Widget Function(T, double size)? leadingBuilder;
  /// Builder for the trailing of the item
  final Widget Function(T, double size)? trailingBuilder;

  /// Builder for the title text of the item
  final String Function(T)? titleTextBuilder;
  /// Builder for the subtitle text of the item
  final String Function(T)? subtitleTextBuilder;
  final String Function(T)? trailingTextBuilder;

  /// Search hint for the search field
  final String? searchHint;
  /// Callback for the search field
  final List<T>? Function(String? search, List<T> items)? onSearch;

  const FxOverlayListData({
    this.searchHint = 'Search...',
    this.items,
    this.itemsAsStream,
    this.selectedItem,
    this.itemBuilder,
    this.titleBuilder,
    this.subtitleBuilder,
    this.titleTextBuilder,
    this.subtitleTextBuilder,
    this.trailingTextBuilder,
    this.leadingBuilder,
    this.trailingBuilder,
    this.onSearch,
  }): assert(items != null || itemsAsStream != null, 'Either items or itemsAsStream must be provided');
}
