import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/_overlay.dart';

part 'fx_select_field_data.dart';

class FxSelectField<T> extends StatefulWidget {

  FxSelectField({
    super.key,
    T? initialValue,
    required this.items,
    this.favoriteItems,
    this.onSearch,
    this.onChanged,
    this.valueLabelBuilder,
    this.decoration = const FxSelectFieldDecoration(),
    this.overlayType = FxOverlayType.bottomSheet,
    this.overlayTile = const FxOverlayTile(),
  })  : isMultiSelect = false,
        onSelectionChanged = null,
        initialValues = initialValue != null ? [initialValue] : null;

  const FxSelectField.multiSelect({
    super.key,
    this.initialValues,
    required this.items,
    this.favoriteItems,
    this.onSelectionChanged,
    this.onSearch,
    this.valueLabelBuilder,
    this.overlayType = FxOverlayType.bottomSheet,
    this.overlayTile = const FxOverlayTile(),
    this.decoration = const FxSelectFieldDecoration(),
  })  : isMultiSelect = true,
        onChanged = null;

  // Selected value(s)
  final List<T>? initialValues;

  final List<T> items;

  /// Optional pinned items shown above the main list (e.g. favorite countries).
  final List<T>? favoriteItems;

  final bool isMultiSelect;

  final FxOverlayType overlayType;

  final FxOverlayTile<T> overlayTile;

  final FxSelectFieldDecoration<T> decoration;

  final String Function(T value)? valueLabelBuilder;

  final void Function(T value)? onChanged;

  final void Function(List<T> values)? onSelectionChanged;
  
  final List<T>? Function(String? search, List<T> items)? onSearch;

  @override
  State<FxSelectField<T>> createState() => _FxSelectFieldState<T>();
}

class _FxSelectFieldState<T> extends State<FxSelectField<T>> with FxUiToolkit {

  List<T> _selectedValues = [];

  @override
  void initState() {
    super.initState();
    if(widget.initialValues != null && widget.initialValues!.isNotEmpty) {
      _selectedValues = [...widget.initialValues!];
    }
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: InputDecorator(
        expands: widget.decoration.expands,
        decoration: buildDecoration,
        isEmpty: _selectedValues.isEmpty,
        child: _selectedValues.isEmpty
          ? null
          : Text(
            ' $_displayText',
            style: widget.decoration.style,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
      )
    );
  }

  String get _displayText => _selectedValues.map(
    (v) => widget.valueLabelBuilder?.call(v) ?? v.toString()
  ).join(', ');

  InputDecoration get _decoration => widget.decoration
    .applyDefaults(theme.inputDecorationTheme);

  double get _spacing {
    double padding = _decoration.contentPadding?.horizontal ?? 0;
    return padding > 0 ? padding / 2 : 0;
  }

  InputDecoration get buildDecoration => _decoration.copyWith(
    prefixIcon: _buildPrefixIcon,
    suffixIcon: _buildSuffixIcon,
    label: null,
    labelText: null,
  );

  Widget? get _buildPrefixIcon {
    if(widget.decoration.prefixIconBuilder == null) return null;
    return Padding(
      padding: EdgeInsets.only(left: _spacing),
      child: widget.decoration.prefixIconBuilder!(_selectedValues.last),
    );
  }

  Widget? get _buildSuffixIcon {
    Widget icon = Icon(
      Icons.keyboard_arrow_down_rounded,
      size: sizes.iconSm,
    );

    if(widget.decoration.suffixIconBuilder != null) {
      icon = widget.decoration.suffixIconBuilder!(_selectedValues.last);
    }

    return Padding(
      padding: EdgeInsets.only(right: _spacing /2),
      child: icon,
    );
  }
  
  Future<void> _onTap() async {
    if (!widget.decoration.enabled) return;
    final result = await _showOverlay();
    if (result != null) {
      setState(() => _selectedValues = [result]);
      widget.onChanged?.call(result);
    }
  }

  Future<T?> _showOverlay() async {
    final data = FxOverlayData<T>(
      title: widget.decoration.overlayTitle,
      list: FxOverlayListData<T>(
        items: widget.items,
        favoriteItems: widget.favoriteItems,
        selectedItem: _selectedValues.isEmpty ? null : _selectedValues.last,
        searchHint: widget.decoration.searchHint,
        onSearch: widget.onSearch,
        itemTile: widget.overlayTile,
      ),
    );

    switch (widget.overlayType) {
      case FxOverlayType.bottomSheet:
        return showFxBottomSheet<T>(
          data: data,
          cancelable: true
        );
      default:
        return showFxDialog<T>(
          data: data,
          cancelable: true,
          style: widget.overlayType == FxOverlayType.dialog 
            ? FxDialogStyle.center 
            : FxDialogStyle.fullPage,
        );
    }
  }
}

