import 'dart:math';

import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/shell/models/fx_enum.dart';
import 'package:blueprint_flutter_core/src/core/shell/models/fx_pane_divider_style.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/_display.dart';

/// Shell body for the active pane.
typedef FxPaneBodyBuilder = Widget Function(
  BuildContext context,
  FxPane pane
);

/// One shell row: chrome (dock / drawer / end drawer) and optional body.
///
/// **Placement:** pass the pane in the matching [FxShell] list
/// (`dockPanes`, `drawerPanes`, `endDrawerPanes`). [site] must match;
/// [validateForSite] runs on sync.
///
/// **Dock + drawer, same screen:** reuse [key]; put [builder] on `.dock` (or
/// whichever owns the body). [mergeRegistry] fills the drawer row.

class FxPane extends FxTile {
  const FxPane._({
    required super.key,
    required super.title,
    required this.site,
    required this.type,
    this.icon,
    this.builder,
    this.onPressed,
    this.showAppBar = true,
    this.showDock = true,
    this.showDrawer = true,
    this.showEndDrawer = true,
    super.tileBuilder,
    super.trailingBuilder,
    super.subtitle,
    super.iconBuilder,
    this.extendBody = true,
    this.showFloatingActionButton = false,
    this.dividerStyle
  });

  /// Primary tab; shows dock when this pane is active.
  const FxPane.dock({
    required super.key,
    required super.title,
    required this.builder,
    super.subtitle,
    this.icon,
    super.iconBuilder,
    this.onPressed,
    super.tileBuilder,
    this.showAppBar = true,
    this.showDrawer = true,
    this.extendBody = true,
    this.showEndDrawer = true,
    this.showFloatingActionButton = true,
  })  : site = FxSite.dock,
        type = FxPaneType.content,
        showDock = true,
        dividerStyle = null;

  /// Start drawer menu item.
  const FxPane.drawer({
    required super.key,
    required super.title,
    this.builder,
    super.subtitle,
    this.icon,
    super.iconBuilder,
    this.onPressed,
    super.tileBuilder,
    this.showDock = true,
    this.showAppBar = true,
    this.showDrawer = true,
    this.extendBody = true,
    this.showEndDrawer = true,
    this.showFloatingActionButton = false
  })  : site = FxSite.drawer,
        type = FxPaneType.content,
        dividerStyle = null;

  /// End drawer menu item.
  const FxPane.endDrawer({
    required super.key,
    required super.title,
    this.builder,
    super.subtitle,
    this.icon,
    super.iconBuilder,
    this.onPressed,
    super.tileBuilder,
    this.showDock = true,
    this.showAppBar = true,
    this.showDrawer = true,
    this.extendBody = true,
    this.showEndDrawer = true,
    super.trailingBuilder,
    this.showFloatingActionButton = false,
  })  : site = FxSite.endDrawer,
        type = FxPaneType.content,
        dividerStyle = null;

  /// Pinned above drawer footer; does not scroll.
  const FxPane.stickyBottom({
    required super.key,
    required super.title,
    this.builder,
    super.subtitle,
    this.icon,
    super.iconBuilder,
    this.onPressed,
    super.tileBuilder,
    this.showAppBar = true,
    this.showDrawer = true,
    this.extendBody = true,
    this.showEndDrawer = true,
    super.trailingBuilder,
    this.showFloatingActionButton = false,
    bool isEndDrawer = false,
  })  : site = isEndDrawer ? FxSite.endDrawer : FxSite.drawer,
        type = FxPaneType.stickyBottom,
        showDock = false,
        dividerStyle = null;

  /// Section divider ([FxTextDivider]). [isEndDrawer] sets [site] for validation.
  FxPane.divider({
    super.title = '',
    Color? color,
    double strokeWidth = 1,
    EdgeInsets padding = EdgeInsets.zero,
    EdgeInsets margin = EdgeInsets.zero,
    BoxDecoration? decoration,
    TextStyle? textStyle,
    FxPaneDividerStyle? style,
    bool isEndDrawer = false,
  })  : site = isEndDrawer ? FxSite.endDrawer : FxSite.drawer,
        type = FxPaneType.divider,
        builder = null,
        icon = null,
        onPressed = null,
        showAppBar = true,
        showDrawer = true,
        showEndDrawer = true,
        showDock = false,
        extendBody = false,
        dividerStyle = style ?? FxPaneDividerStyle(
          color: color,
          textStyle: textStyle,
          margin: margin,
          padding: padding,
          decoration: decoration,
          strokeWidth: strokeWidth,
        ),
        showFloatingActionButton = false,
        super(
          key: 'divider-${_randomUUID()}',
          subtitle: null,
          isExpanded: true,
        );

  /// Vertical gap; [site] must match the list you pass into [FxShell].
    FxPane.spacer()
      : type = FxPaneType.spacer,
        builder = null,
        icon = null,
        onPressed = null,
        showAppBar = true,
        showDrawer = true,
        showEndDrawer = true,
        showDock = true,
        showFloatingActionButton = false,
        dividerStyle = null,
        site = FxSite.dock,
        extendBody = false,
        super(
          key: 'spacer-${_randomUUID()}',
          title: '',
          isExpanded: true,
        );

  final bool showAppBar;
  final bool showDock;
  final bool showDrawer;
  final bool extendBody;
  final bool showEndDrawer;
  final bool showFloatingActionButton;

  final FxSite site;
  final FxPaneType type;
  final FxPaneBodyBuilder? builder;
  final FxTileState<IconData>? icon;
  final FxTileTapWithContext<FxPane>? onPressed;

  /// Non-null when [type] == [FxPaneType.divider].
  final FxPaneDividerStyle? dividerStyle;
  
  /// True if the pane has an icon.
  @override
  bool get hasIcon => super.hasIcon || icon != null;

  FxPane copyWith({
    bool? showDock,
    bool? showAppBar,
    bool? showDrawer,
    bool? extendBody,
    bool? showEndDrawer,
    bool? showFloatingActionButton,
    FxPaneDividerStyle? dividerStyle,
    FxTileBuilder? tileBuilder,
    FxTileTrailingBuilder? trailingBuilder,
    FxTileIconBuilder? iconBuilder,
  }) => FxPane._(
    key: key,
    site: site,
    type: type,
    icon: icon,
    title: title,
    builder: builder,
    subtitle: subtitle,
    showDock: showDock ?? this.showDock,
    onPressed: onPressed,
    showAppBar: showAppBar ?? this.showAppBar,
    showDrawer: showDrawer ?? this.showDrawer,
    extendBody: extendBody ?? this.extendBody,
    tileBuilder: tileBuilder ?? super.tileBuilder,
    iconBuilder: iconBuilder ?? super.iconBuilder,
    dividerStyle: dividerStyle ?? this.dividerStyle,
    showEndDrawer: showEndDrawer ?? this.showEndDrawer,
    trailingBuilder: trailingBuilder ?? super.trailingBuilder,
    showFloatingActionButton: showFloatingActionButton ?? this.showFloatingActionButton,
  );

  /// Contributes to body / history (resolved via [mergeRegistry] when needed).
  bool get isNavigable =>
      type == FxPaneType.content && (builder != null || onPressed != null);

  /// True if the pane is a chrome only pane. 
  /// meaning it does not contribute to the body or history.
  bool get isChromeOnly => 
      type == FxPaneType.divider ||
      type == FxPaneType.spacer;

  @override
  Widget? buildIcon(bool isActive, double? size, Color? color) {
    if (icon == null) return super.buildIcon(isActive, size, color);
    return Icon(icon!.call(isActive), size: size, color: color);
  }

  Widget buildDividerWidget() {
    if (type != FxPaneType.divider) return SizedBox.shrink();
    final style = dividerStyle ?? const FxPaneDividerStyle();

    return Container(
      padding: style.padding,
      width: double.infinity,
      margin: style.margin,
      decoration: style.decoration ?? BoxDecoration(
        color: style.color,
      ),
      child: FxTextDivider(
        text: title,
        dashSpace: style.dashSpace,
        dashWidth: style.dashWidth,
        spacing: style.spacing,
        strokeWidth: style.strokeWidth,
        color: style.color,
        align: style.align,
        style: style.textStyle,
      ),
    );
  }

  Widget buildSpacerWidget() {
    assert(type == FxPaneType.spacer);
    return SizedBox.square();
  }

  static String _randomUUID() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;

    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join('');
  }

  static void validateForSite(List<FxPane> panes, FxSite expected) {
    for (final pane in panes) {
      if (pane.site != expected) {
        throw ArgumentError.value(
          pane,
          'panes',
          'Pane "${pane.key}" has site ${pane.site} but was placed in '
          '$expected list.',
        );
      }
    }
  }

  /// Body registry keyed by [key] (navigable panes with a [builder]).
  static Map<String, FxPane> mergeRegistry({
    required List<FxPane> dockPanes,
    List<FxPane> drawerPanes = const [],
    List<FxPane> endDrawerPanes = const [],
  }) {
    validateForSite(dockPanes, FxSite.dock);
    validateForSite(drawerPanes, FxSite.drawer);
    validateForSite(endDrawerPanes, FxSite.endDrawer);

    final registry = <String, FxPane>{};

    void absorb(FxPane pane) {
      if (!pane.isNavigable && pane.builder == null) return;

      final existing = registry[pane.key];
      if (existing == null) {
        if (pane.builder != null) registry[pane.key] = pane;
        return;
      }

      final mergedBuilder = existing.builder ?? pane.builder;
      if (mergedBuilder == null) return;

      final hasBuilder = existing.builder != null;
      registry[pane.key] = FxPane._(
        key: pane.key,
        title: existing.title.isNotEmpty ? existing.title : pane.title,
        site: hasBuilder ? existing.site : pane.site,
        type: FxPaneType.content,
        builder: mergedBuilder,
        subtitle: existing.subtitle ?? pane.subtitle,
        icon: existing.icon ?? pane.icon,
        iconBuilder: existing.iconBuilder ?? pane.iconBuilder,
        onPressed: existing.onPressed ?? pane.onPressed,
        tileBuilder: existing.tileBuilder ?? pane.tileBuilder,
        showAppBar: hasBuilder ? existing.showAppBar : pane.showAppBar,
        showDock: hasBuilder ? existing.showDock : pane.showDock,
        showDrawer: hasBuilder ? existing.showDrawer : pane.showDrawer,
        showEndDrawer: hasBuilder ? existing.showEndDrawer : pane.showEndDrawer,
        trailingBuilder: existing.trailingBuilder ?? pane.trailingBuilder
      );
    }

    for (final p in [...dockPanes, ...drawerPanes, ...endDrawerPanes]) {
      absorb(p);
    }

    return registry;
  }
}