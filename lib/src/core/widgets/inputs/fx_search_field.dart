import 'dart:async';

import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_field_options.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_text_field.dart';
import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';

/// A search field with debounced [onChanged] and a clear button.
class FxSearchField extends StatefulWidget {
  const FxSearchField({
    super.key,
    this.debounceMs = 400,
    this.options = const FxFieldOptions(),
    this.decoration = const InputDecoration(),
    this.onChanged,
    this.controller,
    this.initialValue,
  });

  final int debounceMs;

  final String? initialValue;
  final FxFieldOptions options;
  final InputDecoration decoration;

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  State<FxSearchField> createState() => _FxSearchFieldState();
}

class _FxSearchFieldState extends State<FxSearchField> with FxUiToolkit {
  late final TextEditingController _controller;
  Timer? _debounce;
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: widget.debounceMs), () {
      widget.onChanged?.call(_controller.text);
      _showClear = _controller.text.isNotEmpty;
    });
    setState(() {});
  }

  @override
  void dispose() {
    _debounce?.cancel();
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return FxTextField(
      controller: _controller,
      options: widget.options.copyWith(
        prefixIcon: _buildPrefix(),
        suffixIcon: _buildSuffix()
      ),
      decoration: widget.decoration
    );
  }

  Widget _buildPrefix() => componentTheme.searchIcon(size: sizes.iconMd);

  Widget? _buildSuffix() {
    if(!_showClear) return null;

    return GestureDetector(
      onTap: () {
        _controller.clear();
        widget.onChanged?.call('');
        setState(() => _showClear = false);
      },
      child: componentTheme.clearIcon()
    );
  }
}
