part of 'fx_overlay.dart';

class FxOverlayTileView<T> extends StatelessWidget with FxUiToolkit {

  FxOverlayTileView({
    super.key,
    required this.item,
    required this.onTap,
    required this.isSelected,
    required this.isMultiSelect,
    required this.itemTile,
  });

  final T item;
  final bool isSelected;
  final bool isMultiSelect;
  final VoidCallback? onTap;
  final FxOverlayTile<T> itemTile;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Padding(
      padding: themeData.overlayTileTheme.margin ?? EdgeInsets.zero,
      child: Material(
        color: themeData.overlayTileTheme.backgroundColor?.call(isSelected),
        shape: themeData.overlayTileTheme.shape,
        child: ListTile(
          selected: isSelected,
          visualDensity: themeData.overlayTileTheme.visualDensity,
          contentPadding: themeData.overlayTileTheme.contentPadding,
          minTileHeight: themeData.overlayTileTheme.minTileHeight,
          horizontalTitleGap: themeData.overlayTileTheme.horizontalTitleGap,
          dense: themeData.overlayTileTheme.dense,
          onTap: onTap,
          leading: _hasLeading ? _buildTileLeading(context, item, isSelected) : null,
          title: _buildTileTitle(context, item, isSelected),
          subtitle: _buildTileSubtitle(context, item, isSelected),
          trailing: _hasTrailing ? _buildTileTrailing(context, item, isSelected) : null,
        )
      )
    );
  }

  bool get _hasLeading => (
    itemTile.leadingBuilder != null ||
    isMultiSelect
  );

  bool get _hasTrailing => itemTile.trailingBuilder != null;

  Widget _buildCheckbox(bool isSelected) {
    final tileTheme = themeData.overlayTileTheme;

    final color = tileTheme.foregroundColor?.call(isSelected) ?? colors.textPrimary;
    final checkedCheckboxIcon = componentTheme.checkedCheckboxIcon(color: color);
    final uncheckedCheckboxIcon = componentTheme.uncheckedCheckboxIcon(color: color);

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: KeyedSubtree(
        key: ValueKey('checkbox_${isSelected ? 'checked' : 'unchecked'}'),
        child: isSelected ? checkedCheckboxIcon : uncheckedCheckboxIcon
      )
    );
  }

  Widget? _buildTileLeading(BuildContext context, T item, bool isSelected) {
    Widget? checkbox = AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isMultiSelect
        ? _buildCheckbox(isSelected)
        : const SizedBox.shrink(),
    );
    
    if (itemTile.leadingBuilder == null) return checkbox;
    if (!isMultiSelect) return itemTile.leadingBuilder!(context, item, isSelected);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: themeData.overlayTileTheme.horizontalTitleGap ?? sizes.md,
      children: [
        checkbox,
        itemTile.leadingBuilder!(context, item, isSelected),
      ]
    );
  }

  Widget _buildTileTitle(BuildContext context, T item, bool isSelected) {
    if(itemTile.titleBuilder != null) {
      return itemTile.titleBuilder!(context, item, isSelected);
    }

    return Text(
      itemTile.title?.call(item) ?? item.toString(),
      style: themeData.overlayTileTheme.titleStyle?.copyWith(
        color: themeData.overlayTileTheme.foregroundColor?.call(isSelected),
      )
    );
  }

  Widget? _buildTileSubtitle(BuildContext context, T item, bool isSelected) {
    if(itemTile.subtitle == null) return null;

    if (itemTile.subtitleBuilder != null) {
      return itemTile.subtitleBuilder!(context, item, isSelected);
    }

    return Text(
      itemTile.subtitle!(item),
      style: themeData.overlayTileTheme.subtitleStyle?.copyWith(
        color: themeData.overlayTileTheme.foregroundColor?.call(isSelected),
      )
    );
  }

  Widget? _buildTileTrailing(BuildContext context, T item, bool isSelected) {
    if(itemTile.trailingBuilder == null) return null;

    return itemTile.trailingBuilder?.call(
      context, 
      item, 
      isSelected
    );
  }
}