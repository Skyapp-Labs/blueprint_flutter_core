part of 'fx_overlay.dart';

/// Searchable, selectable list body for overlay pickers.
class FxOverlayList<T> extends StatefulWidget {
  const FxOverlayList({
    super.key,
    required this.options,
    required this.itemTile,
    required this.scrollController
  });

  final FxOverlayTile<T> itemTile;
  final FxOverlayOptions<T> options;
  final ScrollController scrollController;

  @override
  State<FxOverlayList<T>> createState() => _FxOverlayListState<T>();
}

class _FxOverlayListState<T> extends State<FxOverlayList<T>> with FxUiToolkit {
  List<T>? _streamItems;
  List<T>? _searchResults;
  StreamSubscription<List<T>>? _itemsSubscription;
  late FxOverlaySelectionState<T> _selection;

  @override
  void initState() {
    super.initState();
    _selection = FxOverlaySelectionState<T>(widget.options);
    _itemsSubscription = widget.options.itemsAsStream?.listen((items) {
      if (!mounted) return;
      setState(() {
        _streamItems = items;
        _searchResults = null;
      });
    });
  }

  @override
  void dispose() {
    _itemsSubscription?.cancel();
    super.dispose();
  }

  List<T> get _allItems => _streamItems ?? widget.options.items ?? [];

  List<T> get _favoriteItems => widget.options.favoriteItems ?? [];

  List<T> get _regularItems {
    if (_searchResults != null) return _searchResults!;

    return _allItems.where((item) => !fxOverlayListContains(
      _favoriteItems,
      item,
      widget.options.itemComparer,
    )).toList(growable: false);
  }

  bool get _isSearching => _searchResults != null;

  List<T> get _visibleItems => _searchResults ?? _allItems;

  // TextStyle get _titleTextStyle =>
  //     _itemTile.themeData?.titleStyle ?? typography.titleMedium;

  // TextStyle get _subtitleTextStyle =>
  //     _itemTile.themeData?.subtitleStyle ?? typography.bodyMedium;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: sizes.sm,
      children: [
        if (widget.options.onSearch != null) _buildSearchField(),
        Expanded(child: _buildScrollableList()),
        if (_selection.isMultiSelect) _buildMultiSelectFooter(),
      ]
    );
  }

  Widget _buildSearchField() => Padding(
    padding: themeData.overlayTheme.searchPadding ?? EdgeInsets.only(
      top: sizes.sm,
      left: sizes.md,
      right: sizes.md,
    ),
    child: FxSearchField(
      hint: widget.options.searchHint,
      onChanged: (query) {
        final results = widget.options.onSearch?.call(query, _allItems);
        setState(() => _searchResults = results);
      }
    )
  );

  Widget _buildScrollableList() {
    final showFavorites = _favoriteItems.isNotEmpty && !_isSearching;
    final items = showFavorites ? _regularItems : _visibleItems;

    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        if (_favoriteItems.isNotEmpty) _buildFavorites(),
        _itemsSliver(items),
      ],
    );
  }

  Widget _buildFavorites() {
    final favoriteListView = Container(
      child: _itemsSliver(_favoriteItems)
    );

    if (themeData.overlayTheme.dividerTheme == null) {
      return favoriteListView;
    }

    return Column(
      children: [
        favoriteListView,
        FxDottedDivider.fromThemeData(
          themeData.overlayTheme.dividerTheme!
        )
      ]
    );
  }

  SliverList _itemsSliver(List<T> items) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => _buildItem(items[index]),
        childCount: items.length,
      ),
    );
  }

  void _handleItemTap(T item) {
    if (!_selection.isMultiSelect) return pop(item);
    setState(() => _selection.toggle(item));
  }

  void _confirmMultiSelection() {
    if (!_selection.canConfirm) return;
    pop(_selection.confirm());
  }

  // void _clearSelection() => setState(_selection.clear);

  Widget _buildMultiSelectFooter() => Padding(
    key: const Key('fx_overlay_list_multi_select_footer'),
    padding: EdgeInsets.fromLTRB(sizes.md, sizes.sm, sizes.md, sizes.md),
    child: FilledButton(
      onPressed: _selection.canConfirm ? _confirmMultiSelection : null,
      child: Text(widget.options.confirmLabel),
    )
  );

  Widget _buildItem(T item) {
    final isSelected = _selection.isSelected(item);
    final callback = _selection.canToggle(item) 
      ? () => _handleItemTap(item) 
      : null;

    if (widget.itemTile.builder != null) {
      return widget.itemTile.builder!(
        context, 
        item, 
        isSelected, 
        callback
      );
    }

    return FxOverlayTileView<T>(
      item: item,
      isSelected: isSelected,
      isMultiSelect: _selection.isMultiSelect,
      itemTile: widget.itemTile,
      onTap: callback,
    );
  }
}
