import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/fx_overlay.dart';

part 'fx_select_field_data.dart';

/// A read-only field that opens an overlay to pick one or more items.
///
/// Uses [InputDecorator] for consistent input styling (fill, borders, errors).
///
/// Single select:
/// ```dart
/// FxSelectField<Country>(
///   initialValue: _country,
///   items: countries,
///   valueLabelBuilder: (c) => c.name,
///   onChanged: (country) => setState(() => _country = country),
/// )
/// ```
///
/// Multi select:
/// ```dart
/// FxSelectField<Tag>.multi(
///   initialValues: _tags,
///   items: allTags,
///   onSelectionChanged: (tags) => setState(() => _tags = tags),
/// )
/// ```
class FxSelectField<T> extends StatefulWidget {
  const FxSelectField({
    super.key,
    this.initialValue,
    required this.items,
    this.favoriteItems,
    this.onSearch,
    this.onChanged,
    this.valueLabelBuilder,
    this.decoration = const FxSelectFieldDecoration(),
    this.overlayType = FxOverlayType.bottomSheet,
    this.overlayTile = const FxOverlayTile(),
  })  : isMultiSelect = false,
        initialValues = null,
        onSelectionChanged = null;

  const FxSelectField.multi({
    super.key,
    this.initialValues,
    required this.items,
    this.favoriteItems,
    this.onSearch,
    this.onSelectionChanged,
    this.valueLabelBuilder,
    this.decoration = const FxSelectFieldDecoration(),
    this.overlayType = FxOverlayType.bottomSheet,
    this.overlayTile = const FxOverlayTile(),
  })  : isMultiSelect = true,
        initialValue = null,
        onChanged = null;

  final bool isMultiSelect;

  final T? initialValue;
  final List<T>? initialValues;

  final List<T> items;
  final List<T>? favoriteItems;
  final List<T>? Function(String? search, List<T> items)? onSearch;

  final ValueChanged<T>? onChanged;
  final ValueChanged<List<T>>? onSelectionChanged;

  final String Function(T value)? valueLabelBuilder;
  final FxSelectFieldDecoration<T> decoration;
  final FxOverlayType overlayType;
  final FxOverlayTile<T> overlayTile;

  @override
  State<FxSelectField<T>> createState() => _FxSelectFieldState<T>();
}

class _FxSelectFieldState<T> extends State<FxSelectField<T>> with FxUiToolkit {
  T? _value;
  List<T> _values = [];

  @override
  void initState() {
    super.initState();
    _syncFromWidget();
  }

  @override
  void didUpdateWidget(covariant FxSelectField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue ||
        oldWidget.initialValues != widget.initialValues) {
      _syncFromWidget();
    }
  }

  void _syncFromWidget() {
    if (widget.isMultiSelect) {
      _values = [...?widget.initialValues];
    } else {
      _value = widget.initialValue;
    }
  }

  bool get _hasValue =>
      widget.isMultiSelect ? _values.isNotEmpty : _value != null;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return GestureDetector(
      onTap: widget.decoration.enabled ? _openOverlay : null,
      behavior: HitTestBehavior.opaque,
      child: InputDecorator(
        expands: widget.decoration.expands,
        decoration: _fieldDecoration,
        isEmpty: !_hasValue,
        child: _hasValue ? _selectedLabel : null,
      ),
    );
  }

  InputDecoration get _themedDecoration =>
      widget.decoration.applyDefaults(theme.inputDecorationTheme);

  double get _horizontalInset {
    final padding = _themedDecoration.contentPadding?.horizontal ?? 0;
    return padding > 0 ? padding / 2 : 0;
  }

  InputDecoration get _fieldDecoration {
    return _themedDecoration.copyWith(
      labelText: widget.decoration.selectLabel,
      hintText: _hasValue ? null : widget.decoration.selectHint,
      prefixIcon: _prefixIcon,
      suffixIcon: _suffixIcon,
    );
  }

  Widget get _selectedLabel {
    final text = widget.isMultiSelect
        ? _values
            .map(
              (value) =>
                  fxSelectFieldLabel(value, valueLabelBuilder: widget.valueLabelBuilder),
            )
            .join(', ')
        : fxSelectFieldLabel(_value as T, valueLabelBuilder: widget.valueLabelBuilder);

    return Text(
      ' $text',
      style: widget.decoration.style ?? typography.bodyMedium,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget? get _prefixIcon {
    final builder = widget.decoration.prefixIconBuilder;
    if (builder == null || !_hasValue) return null;

    final sample = widget.isMultiSelect ? _values.first : _value as T;
    return Padding(
      padding: EdgeInsets.only(left: _horizontalInset),
      child: builder(sample),
    );
  }

  Widget get _suffixIcon {
    final builder = widget.decoration.suffixIconBuilder;
    final sample = _hasValue
        ? (widget.isMultiSelect ? _values.first : _value as T)
        : null;

    final icon = builder != null && sample != null
        ? builder(sample)
        : Icon(Icons.keyboard_arrow_down_rounded, size: sizes.iconSm);

    return Padding(
      padding: EdgeInsets.only(right: _horizontalInset / 2),
      child: icon,
    );
  }

  Future<void> _openOverlay() async {
    if (widget.isMultiSelect) {
      final selected = await _presentMultiOverlay();
      if (!mounted || selected == null) return;
      setState(() => _values = selected);
      widget.onSelectionChanged?.call(selected);
      return;
    }

    final selected = await _presentSingleOverlay();
    if (!mounted || selected == null) return;
    setState(() => _value = selected);
    widget.onChanged?.call(selected);
  }

  Future<T?> _presentSingleOverlay() {
    return switch (widget.overlayType) {
      FxOverlayType.bottomSheet =>
        showFxBottomSheet<T, T>(data: _singleOverlayData),
      FxOverlayType.dialog => showFxDialog<T, T>(
          data: _singleOverlayData,
          style: FxDialogStyle.center,
        ),
      FxOverlayType.modal => showFxDialog<T, T>(
          data: _singleOverlayData,
          style: FxDialogStyle.fullPage,
        ),
    };
  }

  Future<List<T>?> _presentMultiOverlay() {
    return switch (widget.overlayType) {
      FxOverlayType.bottomSheet =>
        showFxBottomSheet<List<T>, T>(data: _multiOverlayData),
      FxOverlayType.dialog => showFxDialog<List<T>, T>(
          data: _multiOverlayData,
          style: FxDialogStyle.center,
        ),
      FxOverlayType.modal => showFxDialog<List<T>, T>(
          data: _multiOverlayData,
          style: FxDialogStyle.fullPage,
        ),
    };
  }

  FxOverlayData<T> get _singleOverlayData => FxOverlayData<T>(
        title: widget.decoration.overlayTitle,
        list: FxOverlayListData<T>(
          items: widget.items,
          favoriteItems: widget.favoriteItems,
          selectedItem: _value,
          searchHint: widget.decoration.searchHint,
          onSearch: widget.onSearch,
          itemTile: widget.overlayTile,
        ),
      );

  FxOverlayData<T> get _multiOverlayData => FxOverlayData<T>(
        title: widget.decoration.overlayTitle,
        list: FxOverlayListData<T>.multiSelect(
          items: widget.items,
          favoriteItems: widget.favoriteItems,
          selectedItems: _values,
          searchHint: widget.decoration.searchHint,
          onSearch: widget.onSearch,
          itemTile: widget.overlayTile,
          confirmLabel: widget.decoration.confirmLabel,
          clearLabel: widget.decoration.clearLabel,
          minSelection: widget.decoration.minSelection,
          maxSelection: widget.decoration.maxSelection,
        ),
      );
}
