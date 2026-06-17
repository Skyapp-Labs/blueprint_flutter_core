import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_field_options.dart';
import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/fx_overlay.dart';

import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_field.dart';

class FxSelectField<Result, T> extends StatefulWidget {
  FxSelectField({
    super.key,
    this.expands = false,
    this.options = const FxFieldOptions(),
    this.decoration = const InputDecoration(),
    this.overlayType = FxOverlayType.bottomSheet,
    this.valueBuilder,
    required this.overlayOptions,
    required this.onChanged,
  })  : assert(
        overlayOptions.isListOverlay, 
        '\n\nFxSelectField: overlayOptions must be a list overlay options\n'
      );

  final bool expands;
  final FxOverlayType overlayType;
  final FxFieldOptions options;
  final InputDecoration decoration;
  final FxOverlayOptions<T> overlayOptions;
  final ValueChanged<Result>? onChanged;
  final String Function(T)? valueBuilder;

  @override
  State<FxSelectField<Result, T>> createState() => _FxSelectFieldState<Result, T>();
}

class _FxSelectFieldState<Result, T> extends State<FxSelectField<Result, T>> with FxUiToolkit {
  List<T> _result = [];

  @override
  void initState() {
    super.initState();
    _result = List.from(widget.overlayOptions.selectedItems ?? []);
  }

  @override
  void didUpdateWidget(covariant FxSelectField<Result, T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.overlayOptions.selectedItems != widget.overlayOptions.selectedItems) {
      _result = List.from(widget.overlayOptions.selectedItems ?? []);
    }
  }
    
  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return FxField(
      options: widget.options,
      decoration: _themedDecoration,
      child: GestureDetector(
        onTap: widget.options.enabled ? _openOverlay : null,
        behavior: HitTestBehavior.opaque,
        child: InputDecorator(
          isEmpty: !_hasValue,
          expands: widget.expands,
          decoration: widget.decoration.copyWith(
            prefixIcon: _prefixIcon,
            suffixIcon: _suffixIcon,
            prefixIconConstraints: BoxConstraints()
          ),
          child: _hasValue ? _selectedLabel : null,
        ),
      )
    );
  }

  bool get _hasValue => _result.isNotEmpty;

  InputDecoration get _themedDecoration => FxField.resolveDecoration(
    context: context,
    options: widget.options,
    decoration: widget.decoration,
  );

  double get _horizontalInset {
    final padding = _themedDecoration.contentPadding?.horizontal ?? 0;
    return padding > 0 ? padding / 2 : 0;
  }

  Widget get _selectedLabel {
    final text = _result.map((value) {
      final label = (widget.valueBuilder ?? widget.overlayOptions.itemTile.title)?.call(value);
      return label ?? value.toString();
    }).join(', ');
    
    return Text(
      ' $text',
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget? get _prefixIcon {
    if (widget.options.prefixIcon == null) return null;
    
    return Padding(
      padding: EdgeInsets.only(left: _horizontalInset),
      child: widget.options.prefixIcon,
    );
  }

  Widget get _suffixIcon => Padding(
    padding: EdgeInsets.only(right: _horizontalInset / 2),
    child: widget.decoration.suffix ?? componentTheme.arrowDownIcon,
  );

  Future<void> _openOverlay() async {
    final result = await _presentOverlay();
    if (!mounted || result == null) return;

    if(result is List<T>) {
      setState(() => _result = result);
    } else {
      setState(() => _result = [result as T]);
    }

    widget.onChanged?.call(result as Result);
  }

  Future<Result?> _presentOverlay() => showFxOverlay<Result, T>(
    context,
    type: widget.overlayType,
    options: widget.overlayOptions
  );
}
