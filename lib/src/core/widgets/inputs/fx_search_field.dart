import 'dart:async';

import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';

/// A search field with debounced [onChanged] and a clear button.
class FxSearchField extends StatefulWidget {
  const FxSearchField({
    super.key,
    this.hint = 'Search...',
    this.onChanged,
    this.debounceMs = 400,
    this.controller,
    this.autofocus = false,
  });

  final String hint;
  final ValueChanged<String>? onChanged;
  final int debounceMs;
  final TextEditingController? controller;
  final bool autofocus;

  @override
  State<FxSearchField> createState() => _FxSearchFieldState();
}

class _FxSearchFieldState extends State<FxSearchField> with FxUiToolkit {
  late final TextEditingController _controller;
  Timer? _debounce;

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

    return TextField(
      controller: _controller,
      autofocus: widget.autofocus,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(Icons.search, size: sizes.iconMd),
        suffixIcon:
            _controller.text.isNotEmpty
                ? IconButton(
                  icon: Icon(Icons.clear, size: sizes.iconMd),
                  onPressed: () {
                    _controller.clear();
                    widget.onChanged?.call('');
                  },
                )
                : null,
      ),
    );
  }
}
