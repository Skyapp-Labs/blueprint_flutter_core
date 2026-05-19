import 'package:blueprint_flutter_core/src/core/widgets/layout/fx_tile.dart';
import 'package:flutter/material.dart';

/// Vertical list or horizontal row of [FxTile]s.
///
/// In row mode, [Expanded] is applied only in [_buildRow] when
/// [FxTile.isExpanded] is true. Custom [FxTileBuilder]s must not return
/// [Expanded].
@immutable
class FxTileView<T extends FxTile> extends StatelessWidget {
  const FxTileView({
    super.key,
    Widget? header,
    Widget? footer,
    required this.tiles,
    required this.tileStyle,
    this.activeKey,
    this.tileBuilder,
    this.onTilePressed,
    this.separatorBuilder,
    this.padding = EdgeInsets.zero,
    this.primary = false,
    this.physics = const BouncingScrollPhysics(),
    this.shrinkWrap = false,
  })  : isListView = true,
        spacing = 0,
        mainAxisSize = MainAxisSize.max,
        mainAxisAlignment = MainAxisAlignment.start,
        crossAxisAlignment = CrossAxisAlignment.stretch,
        start = header,
        end = footer,
        assert(
          tiles.length > 0 || header != null || footer != null,
          '\n\n[FxTileView] Provide at least one of: non-empty tiles, '
          'header, or footer.\n',
        );

  const FxTileView.row({
    super.key,
    required this.tiles,
    required FxRowTileStyle style,
    this.activeKey,
    this.tileBuilder,
    this.onTilePressed,
    this.spacing = 0,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  })  : isListView = false,
        tileStyle = style,
        physics = const NeverScrollableScrollPhysics(),
        padding = EdgeInsets.zero,
        separatorBuilder = null,
        shrinkWrap = false,
        primary = false,
        start = null,
        end = null,
        assert(
          tiles.length > 0,
          '\n\n[FxTileView.row] tiles must not be empty\n',
        );

  final bool isListView;
  final bool shrinkWrap;
  final bool primary;
  final List<T> tiles;
  final double spacing;
  final Widget? end;
  final Widget? start;
  final String? activeKey;
  final FxTileStyle tileStyle;
  final FxTileTap<T>? onTilePressed;
  final ScrollPhysics physics;
  final FxTileBuilder<T>? tileBuilder;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry padding;
  final IndexedWidgetBuilder? separatorBuilder;

  @override
  Widget build(BuildContext context) => isListView 
    ? _buildList(context) 
    : _buildRow(context);

  Widget _buildList(BuildContext context) {
    final view = ListView.separated(
      itemCount: tiles.length,
      shrinkWrap: shrinkWrap,
      physics: physics,
      primary: primary,
      padding: padding,
      separatorBuilder:
          separatorBuilder ?? (_, _) => const SizedBox.shrink(),
      itemBuilder: (context, index) => _buildTile(
        context,
        tiles[index],
        tiles[index].key == activeKey,
      ),
    );

    if (start == null && end == null) return view;

    return Column(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      spacing: spacing,
      children: [?start, Expanded(child: view), ?end],
    );
  }

  Widget _buildRow(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      spacing: spacing,
      children: [
        ?start,
        ...tiles.map((tile) {
          final cell = _buildTile(
            context,
            tile,
            tile.key == activeKey,
          );
          return tile.isExpanded ? Expanded(child: cell) : cell;
        }),
        ?end,
      ],
    );
  }

  Widget _buildTile(BuildContext context, T tile, bool isActive) {
    VoidCallback onTap() => () => onTilePressed?.call(tile);
    final itemTileBuilder = tile.tileBuilder?.call(tile, isActive, onTap);
    final viewTileBuilder = tileBuilder?.call(tile, isActive, onTap);
    
    if (itemTileBuilder != null || viewTileBuilder != null) {
      return itemTileBuilder ?? viewTileBuilder!;
    }

    if (isListView) {
      return _animatedTile(
        tile,
        isActive,
        _buildListTile(context, tile, isActive),
      );
    }

    return InkWell(
      onTap: () => onTilePressed?.call(tile),
      child: _animatedTile(
        tile,
        isActive,
        _buildRowTile(context, tile, isActive),
      ),
    );
  }

  Widget _animatedTile(FxTile tile, bool isActive, Widget child) {
    return AnimatedSwitcher(
      duration: tileStyle.duration,
      reverseDuration: tileStyle.reverseDuration,
      switchInCurve: tileStyle.switchInCurve,
      switchOutCurve: tileStyle.switchOutCurve,
      layoutBuilder: tileStyle.layoutBuilder,
      transitionBuilder: tileStyle.transitionBuilder,
      child: KeyedSubtree(
        key: ValueKey<String>('${tile.key}_tile_${isActive ? 'on' : 'off'}'),
        child: child,
      ),
    );
  }

  Widget _buildListTile(BuildContext context, T tile, bool isActive) {
    return Material(
      color: tileStyle.backgroundColor?.call(isActive) ?? Colors.transparent,
      child: ListTile(
        onTap: () => onTilePressed?.call(tile),
        selected: isActive,
        visualDensity: VisualDensity.compact,
        contentPadding: tileStyle.padding,
        leading: _buildIconView(tile, isActive),
        title: _buildTextView(tile, isActive),
        subtitle: _buildSubtitle(tile, isActive),
        trailing: tile.trailingBuilder?.call(context, isActive),
      ),
    );
  }

  Widget _buildRowTile(BuildContext context, T tile, bool isActive) {
    final rowStyle = tileStyle is FxRowTileStyle
        ? tileStyle as FxRowTileStyle
        : FxRowTileStyle.fromTileStyle(tileStyle);

    Widget content = (tile.subtitle == null && !tile.hasIcon)
      ? _buildTextView(tile, isActive)
      : Column(
        mainAxisSize: rowStyle.mainAxisSize,
        mainAxisAlignment: rowStyle.mainAxisAlignment,
        crossAxisAlignment: rowStyle.crossAxisAlignment,
        spacing: rowStyle.spacing,
        children: [
          ?_buildIconView(tile, isActive),
          _buildTextView(tile, isActive),
          ?_buildSubtitle(tile, isActive),
        ],
      );

    return Container(
      color: rowStyle.backgroundColor?.call(isActive) ?? Colors.transparent,
      padding: rowStyle.padding,
      alignment: Alignment.center,
      child: content,
    );
  }

  Widget? _buildIconView(FxTile tile, bool isActive) {
    if (!tile.hasIcon) return null;
    return tile.buildIcon(
      isActive,
      tileStyle.iconSize?.call(isActive),
      tileStyle.iconColor?.call(isActive),
    );
  }

  Widget _buildTextView(FxTile tile, bool isActive) {
    return Text(
      tile.title,
      style: tileStyle.textStyle?.call(isActive),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget? _buildSubtitle(FxTile tile, bool isActive) {
    if (tile.subtitle == null) return null;
    return Text(
      tile.subtitle!,
      style: tileStyle.subtitleStyle?.call(isActive),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}