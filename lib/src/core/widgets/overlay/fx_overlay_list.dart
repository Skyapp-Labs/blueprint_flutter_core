part of 'fx_overlay.dart';

/// Searchable, selectable list body for overlay pickers.
class FxOverlayList<T> extends StatefulWidget {
  const FxOverlayList({
    super.key,
    required this.scrollController,
    required this.data,
    this.showMultiSelectFooter = true,
  });

  final FxOverlayListData<T> data;
  final ScrollController scrollController;
  final bool showMultiSelectFooter;

  @override
  State<FxOverlayList<T>> createState() => _FxOverlayListState<T>();
}

class _FxOverlayListState<T> extends State<FxOverlayList<T>> with FxUiToolkit {
  List<T>? _streamItems;
  List<T>? _searchResults;
  StreamSubscription<List<T>>? _itemsSubscription;
  late _FxOverlaySelection<T> _selection;

  @override
  void initState() {
    super.initState();
    _selection = _FxOverlaySelection<T>(widget.data);
    _itemsSubscription = widget.data.itemsAsStream?.listen((items) {
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

  FxOverlayTile<T> get _itemTile => widget.data.itemTile
    .applyThemeData(themeData.overlayTileTheme);

  List<T> get _allItems => _streamItems ?? widget.data.items ?? [];

  List<T> get _favoriteItems => widget.data.favoriteItems ?? [];

  List<T> get _regularItems {
    if (_searchResults != null) return _searchResults!;
    return _allItems
        .where(
          (item) => !fxOverlayListContains(
            _favoriteItems,
            item,
            widget.data.itemComparer,
          ),
        )
        .toList(growable: false);
  }

  bool get _isSearching => _searchResults != null;

  List<T> get _visibleItems => _searchResults ?? _allItems;

  TextStyle get _titleTextStyle =>
      _itemTile.themeData?.titleStyle ?? typography.titleMedium;

  TextStyle get _subtitleTextStyle =>
      _itemTile.themeData?.subtitleStyle ?? typography.bodyMedium;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: sizes.sm,
      children: [
        if (widget.data.onSearch != null) _buildSearchField(),
        Expanded(child: _buildScrollableList()),
        if (_selection.isMultiSelect && widget.showMultiSelectFooter)
          _buildMultiSelectFooter(),
      ],
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: EdgeInsets.only(
        top: sizes.sm,
        left: sizes.md,
        right: sizes.md,
      ),
      child: FxSearchField(
        hint: widget.data.searchHint ?? 'Search...',
        onChanged: (query) {
          final results = widget.data.onSearch!(query, _allItems);
          setState(() => _searchResults = results);
        },
      ),
    );
  }

  Widget _buildScrollableList() {
    final showFavorites = _favoriteItems.isNotEmpty && !_isSearching;
    final items = showFavorites ? _regularItems : _visibleItems;

    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        if (_favoriteItems.isNotEmpty) ...[
          _itemsSliver(_favoriteItems),
          SliverToBoxAdapter(child: FxDottedDivider()),
        ],
        _itemsSliver(items),
      ],
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
    if (_selection.isMultiSelect) {
      setState(() => _selection.toggle(item));
      return;
    }
    pop(item);
  }

  void _confirmMultiSelection() {
    if (!_selection.canConfirm) return;
    pop(_selection.confirm());
  }

  void _clearSelection() => setState(_selection.clear);

  Widget _buildMultiSelectFooter() {
    return Padding(
      padding: EdgeInsets.fromLTRB(sizes.md, sizes.sm, sizes.md, sizes.md),
      child: Row(
        spacing: sizes.sm,
        children: [
          if (widget.data.clearLabel != null)
            TextButton(
              onPressed:
                  _selection.selectedValues.isEmpty ? null : _clearSelection,
              child: Text(widget.data.clearLabel!),
            ),
          Expanded(
            child: FilledButton(
              onPressed: _selection.canConfirm ? _confirmMultiSelection : null,
              child: Text(widget.data.confirmLabel),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(T item) {
    final isSelected = _selection.isSelected(item);
    final callback = _selection.canToggle(item) ? () => _handleItemTap(item) : null;

    if (_itemTile.builder != null) {
      return _itemTile.builder!(context, item, isSelected, callback);
    }

    return Padding(
      padding: _itemTile.themeData?.margin ?? EdgeInsets.zero,
      child: Material(
        color: _itemTile.themeData?.backgroundColor?.call(isSelected),
        shape: _itemTile.themeData?.shape,
        child: ListTile(
          selected: isSelected,
          visualDensity: _itemTile.themeData?.visualDensity,
          contentPadding: _itemTile.themeData?.contentPadding,
          minTileHeight: _itemTile.themeData?.minTileHeight,
          horizontalTitleGap: _itemTile.themeData?.horizontalTitleGap,
          dense: _itemTile.themeData?.dense,
          onTap: callback,
          leading: _itemTile.leading?.call(item),
          title: _buildTileTitle(item, isSelected),
          subtitle: _buildTileSubtitle(item, isSelected),
          trailing: _buildTrailing(item, isSelected),
        )
      )
    );
  }

  Widget? _buildTrailing(T item, bool isSelected) {
    final showCheckbox = _selection.isMultiSelect &&
        (_itemTile.themeData?.showSelectionIndicator ?? true);

    if (showCheckbox) {
      return Checkbox(
        value: isSelected,
        onChanged: _selection.canToggle(item) || isSelected
            ? (_) => setState(() => _selection.toggle(item))
            : null,
      );
    }

    return _itemTile.trailing?.call(item);
  }

  Widget _buildTileTitle(T item, bool isSelected) {
    return Text(
      _itemTile.title?.call(item) ?? item.toString(),
      style: _titleTextStyle.copyWith(
        color: _itemTile.themeData?.foregroundColor?.call(isSelected),
      ),
    );
  }

  Widget? _buildTileSubtitle(T item, bool isSelected) {
    if (_itemTile.subtitle == null) return null;

    return Text(
      _itemTile.subtitle!.call(item),
      style: _subtitleTextStyle.copyWith(
        color: _itemTile.themeData?.foregroundColor?.call(isSelected),
      ),
    );
  }
}
