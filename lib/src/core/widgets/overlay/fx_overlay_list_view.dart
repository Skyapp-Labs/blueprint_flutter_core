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

	List<T>? _items;
	List<T>? _searchResults;
	StreamSubscription<List<T>>? _itemsSubscription;

	List<T> get items => _searchResults ?? mainItems;
	List<T> get mainItems => _items ?? widget.data.items ?? [];

	@override
	void initState() {
		super.initState();
		_itemsSubscription = widget.data.itemsAsStream?.listen((items) => setState(() {
      _items = items;
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
          child: ListView.builder(
            controller: widget.scrollController,
            shrinkWrap: false,
            padding: EdgeInsets.zero,
            itemCount: items.length,
            itemBuilder: (context, index) => _buildItem(
              context,
              items[index]
            )
					)
				)
			]
		);
	}

	Widget searchInput() => Padding(
		padding: EdgeInsets.only(
      top: sizes.sm,
      left: sizes.md,
      right: sizes.md,
    ),
		child: FxSearchField(
			hint: widget.data.searchHint ?? 'Search...',
			onChanged: (query) {
				final results = widget.data.onSearch!(query, mainItems);
				setState(() => _searchResults = results);
			}
		)
	);

	Widget _buildItem(BuildContext context, T item) {
		if(widget.data.itemBuilder != null) {
      return widget.data.itemBuilder!(context, item, item == widget.data.selectedItem);
    }

		return ListTile(
			visualDensity: VisualDensity.compact,
			contentPadding: EdgeInsets.symmetric(horizontal: sizes.lg),
			minTileHeight: sizes.inputHeight,
      horizontalTitleGap: sizes.md,
			onTap: () => pop(item),
			leading: _buildTileLeading(context, item),
			title: _buildTileTitle(context, item),
			subtitle: _buildTileSubtitle(context, item),
			trailing: _buildTileTrailing(context, item),
		);
	}

	Widget _buildTileTitle(BuildContext context, T item) {
		if(widget.data.titleBuilder != null) return widget.data.titleBuilder!(item);

		return Text(
			widget.data.titleTextBuilder?.call(item) ?? item.toString(),
			style: typography.titleMedium.copyWith(
				fontWeight: FontWeight.w600
			)
		);
	}

	Widget? _buildTileSubtitle(BuildContext context, T item) {
		if(widget.data.subtitleBuilder != null) return widget.data.subtitleBuilder!(item);

		if(widget.data.subtitleTextBuilder == null) return null;

		return Text(
			widget.data.subtitleTextBuilder!(item),
			style: typography.bodyMedium.copyWith(
				color: colorScheme.onSurfaceVariant
			)
		);
	}

	Widget? _buildTileTrailing(BuildContext context, T item) {
		if(widget.data.trailingBuilder != null) return widget.data.trailingBuilder!(item, sizes.iconMd);

		if(widget.data.trailingTextBuilder == null) return null;

		return Text(
			widget.data.trailingTextBuilder!(item),
			style: typography.bodyMedium.copyWith(
				color: colorScheme.onSurfaceVariant
			)
		);
	}

	Widget? _buildTileLeading(BuildContext context, T item) {
		if(widget.data.leadingBuilder != null) return widget.data.leadingBuilder!(item, sizes.iconSm);

		return null;
	}
}
