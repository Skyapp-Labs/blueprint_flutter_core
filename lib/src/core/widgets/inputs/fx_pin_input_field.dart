import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_pin_input_theme.dart';



/// A single digit cell used by [FxPinInput].
///
/// Wraps a [TextFormField] with a [KeyboardListener] to detect backspace
/// on an empty cell, allowing focus to return to the previous cell.
class FxPinInputField extends StatefulWidget {
  const FxPinInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    this.obscureText = false,
    this.enabled = true,
    this.hasError = false,
    this.inputTheme = const FxPinInputTheme(),
    this.onBackspace,
    this.onTap,
    this.pasteLength = 1,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final bool enabled;
  final bool hasError;
  final FxPinInputTheme inputTheme;

  /// Called when backspace is pressed on an empty cell.
  final VoidCallback? onBackspace;

  /// Called when the cell is tapped. Use to redirect focus to the active cell.
  final VoidCallback? onTap;

  /// Maximum number of characters allowed through [onChanged].
  ///
  /// Set to the full pin length on the active cell so that a pasted string
  /// reaches [onChanged] without being truncated — enabling paste distribution
  /// across all cells. All other cells keep the default of 1.
  final int pasteLength;

  @override
  State<FxPinInputField> createState() => _FxPinInputFieldState();
}

class _FxPinInputFieldState extends State<FxPinInputField> {
  late final FocusNode _keyboardFocusNode;

  @override
  void initState() {
    super.initState();
    _keyboardFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _keyboardFocusNode.dispose();
    super.dispose();
  }

  InputBorder? _border(Color? color) {
    if (color == null) return null;
    return widget.inputTheme.border.copyWith(
      borderSide: widget.inputTheme.border.borderSide.copyWith(color: color),
    );
  }

  @override
  Widget build(BuildContext context) => KeyboardListener(
    focusNode: _keyboardFocusNode,
    onKeyEvent: (event) {
      if (event is KeyDownEvent &&
          event.logicalKey == LogicalKeyboardKey.backspace &&
          widget.controller.text.isEmpty) {
        widget.onBackspace?.call();
      }
    },
    child: TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      enabled: widget.enabled,
      obscureText: widget.obscureText,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: widget.inputTheme.textStyle,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(widget.pasteLength),
      ],
      decoration: InputDecoration(
        counterText: '',
        filled: widget.inputTheme.backgroundColor != null,
        fillColor: widget.inputTheme.backgroundColor,
        contentPadding: widget.inputTheme.padding,
        border: _border(widget.inputTheme.borderColor),
        enabledBorder: _border(
          widget.hasError
              ? widget.inputTheme.errorBorderColor
              : widget.inputTheme.borderColor,
        ),
        focusedBorder: _border(
          widget.hasError
              ? widget.inputTheme.errorBorderColor
              : widget.inputTheme.focusBorderColor,
        ),
        disabledBorder: _border(
          widget.inputTheme.borderColor?.withValues(alpha: 0.5),
        ),
      ),
    ),
  );
}
