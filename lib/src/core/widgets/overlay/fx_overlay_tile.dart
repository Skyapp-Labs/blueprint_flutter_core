part of 'fx_overlay.dart';

typedef FxOverlayTileBuilder<T> = Widget Function(
  BuildContext context, 
  T item, 
  bool isSelected, 
  VoidCallback? onTap
);

typedef FxOverlayTileWidgetBuilder<T> = Widget Function(
  BuildContext context, 
  T item, 
  bool isSelected
);

@immutable
class FxOverlayTile<T> {
  const FxOverlayTile({
    this.title,
    this.builder,
    this.subtitle,
    this.titleBuilder,
    this.leadingBuilder,
    this.subtitleBuilder,
    this.trailingBuilder,
  });
  
  final String Function(T item)? title;
  final String Function(T item)? subtitle;
  final FxOverlayTileBuilder<T>? builder;
  final FxOverlayTileWidgetBuilder<T>? titleBuilder;
  final FxOverlayTileWidgetBuilder<T>? leadingBuilder;
  final FxOverlayTileWidgetBuilder<T>? subtitleBuilder;
  final FxOverlayTileWidgetBuilder<T>? trailingBuilder;
}