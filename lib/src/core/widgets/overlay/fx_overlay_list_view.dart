part of '_overlay.dart';

class FxOverlayListView<T> extends StatefulWidget {
  final FxOverlayListData<T> data;
	final ScrollController scrollController;

	const FxOverlayListView({
		super.key,
		required this.scrollController,
		required this.data,
	});

	@override
	State<FxOverlayListView<T>> createState() => _FxOverlayListViewState<T>();
}

class _FxOverlayListViewState<T> extends State<FxOverlayListView<T>> with FxUiToolkit {

	List<T>? _streamItems;
	List<T>? _searchResults;
	StreamSubscription<List<T>>? _itemsSubscription;

	List<T> get items => _searchResults ?? filteredItems;
	List<T> get allItems => _streamItems ?? widget.data.items ?? [];
  List<T> get favoriteItems => widget.data.favoriteItems ?? [];
  List<T> get filteredItems => allItems.where((item) => !favoriteItems.contains(item)).toList();

	@override
	void initState() {
		super.initState();
		_itemsSubscription = widget.data.itemsAsStream?.listen((items) => setState(() {
      _streamItems = items;
      _searchResults = null; // clear stale search results when source data updates
    }));
	}

	@override
	void dispose() {
		_itemsSubscription?.cancel();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		setToolkitContext(context);

		return Column(
			spacing: sizes.sm,
			children: [
				if(widget.data.onSearch != null) searchInput(),
				Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if(favoriteItems.isNotEmpty && _searchResults == null) ...[
                  _buildItems(favoriteItems),
                  FxDottedDivider(),
                ],

                _buildItems(items)
              ]
            )
					)
				)
			]
		);
	}

  TextStyle get _titleTextStyle => (
    widget.data.itemTile.titleStyle ?? 
    typography.titleMedium
  );

  TextStyle get _subtitleTextStyle => (
    widget.data.itemTile.subtitleStyle ?? 
    typography.bodyMedium
  );

	Widget _buildItems(List<T> itemList) => Column(
    children: List.generate(
      itemList.length, 
      (index) => _buildItem(context, itemList[index])
    )
	);

	Widget searchInput() => Padding(
		padding: EdgeInsets.only(
      top: sizes.sm,
      left: sizes.md,
      right: sizes.md,
    ),
		child: FxSearchField(
			hint: widget.data.searchHint ?? 'Search...',
			onChanged: (query) {
				final results = widget.data.onSearch!(query, allItems);
				setState(() => _searchResults = results);
			}
		)
	);

	Widget _buildItem(BuildContext context, T item) {
    final isSelected = item == widget.data.selectedItem;
		if(widget.data.itemTile.builder != null) {
      return widget.data.itemTile.builder!(context, item, isSelected);
    }

		return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(sizes.sm),
        side: BorderSide(color: colorScheme.outline.withValues(alpha: 0.12)),
      ),
			child: ListTile(
        selected: isSelected,
        selectedColor: widget.data.itemTile.selectedBackgroundColor,
        visualDensity: widget.data.itemTile.visualDensity,
        contentPadding: widget.data.itemTile.contentPadding ?? EdgeInsets.symmetric(horizontal: sizes.md),
        minTileHeight: widget.data.itemTile.minTileHeight ?? sizes.inputHeight,
        horizontalTitleGap: widget.data.itemTile.horizontalTitleGap ?? sizes.md,
        dense: widget.data.itemTile.dense,
        onTap: () => pop(item),
        leading: widget.data.itemTile.leading?.call(item),
        title: _buildTileTitle(item, isSelected),
        subtitle: _buildTileSubtitle(item, isSelected),
        trailing: widget.data.itemTile.trailing?.call(item),
			),
		);
	}

	Widget _buildTileTitle(T item, bool isSelected) => Text(
    widget.data.itemTile.title?.call(item) ?? item.toString(),
    style: _titleTextStyle.copyWith(
      color: (isSelected 
        ? widget.data.itemTile.selectedForegroundColor 
        : widget.data.itemTile.foregroundColor) ?? _titleTextStyle.color,
    )
  );

	Widget? _buildTileSubtitle(T item, bool isSelected) {
		if(widget.data.itemTile.subtitle == null) return null;

		return Text(
      widget.data.itemTile.subtitle?.call(item) ?? '',
			style: _subtitleTextStyle.copyWith(
				color: (isSelected 
					? widget.data.itemTile.selectedForegroundColor
					: widget.data.itemTile.foregroundColor) ?? _subtitleTextStyle.color,
			)
		);
	}
}
