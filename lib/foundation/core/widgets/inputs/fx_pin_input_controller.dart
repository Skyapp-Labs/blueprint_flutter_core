part of '_index.dart';

/// Manages focus, text editing controllers, loading state, and submission
/// logic for [FxPinInput]. Owned and disposed by [FxPinInputState].
class FxPinInputController {
  FxPinInputController({
    required this.length,
    this.onCompleted,
  }) {
    _initialize();
  }

  final int length;
  final Future<void> Function(String)? onCompleted;

  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;

  bool isLoading = false;
  bool hasError = false;
  bool _isDisposed = false;

  /// Called whenever the composed pin value changes.
  void Function(String)? onValueChanged;

  /// Called when [isLoading] toggles so the parent state can call setState.
  void Function(bool)? onLoadingChanged;

  // ============================================
  // INITIALIZATION
  // ============================================

  void _initialize() {
    controllers = List.generate(length, (_) => TextEditingController());
    focusNodes = List.generate(length, (index) {
      final node = FocusNode();
      node.addListener(() => _onFocusChanged(index, node));
      return node;
    });
  }

  /// Intercepts focus on any cell and redirects to the active cell if needed.
  ///
  /// Runs in a microtask to avoid calling [requestFocus] synchronously
  /// inside a focus listener, which would cause recursive focus changes.
  void _onFocusChanged(int index, FocusNode node) {
    if (_isDisposed || !node.hasFocus) return;
    final activeIndex = controllers.indexWhere((c) => c.text.isEmpty);
    final target = activeIndex == -1 ? length - 1 : activeIndex;
    if (index != target) {
      Future.microtask(() {
        if (!_isDisposed) focusNodes[target].requestFocus();
      });
    }
  }

  void requestFirstFocus() {
    if (_isDisposed) return;
    Future.microtask(() {
      if (!_isDisposed && focusNodes.isNotEmpty) {
        focusNodes.first.requestFocus();
      }
    });
  }

  /// Focuses the first empty cell, or the last cell if all are filled.
  ///
  /// Call this on any cell tap to enforce strict left-to-right entry order —
  /// preventing users from jumping to an arbitrary cell.
  void focusActive() {
    if (_isDisposed) return;
    final activeIndex = controllers.indexWhere((c) => c.text.isEmpty);
    final target = activeIndex == -1 ? length - 1 : activeIndex;
    focusNodes[target].requestFocus();
  }

  // ============================================
  // EXTERNAL VALUE SYNC
  // ============================================

  /// Pushes an external string value into the PIN cells.
  /// Designed for custom keyboard widgets that control the field externally.
  void updateFromExternal(String value) {
    if (_isDisposed) return;

    final capped = value.length > length ? value.substring(0, length) : value;

    for (int i = 0; i < length; i++) {
      if (i < controllers.length) {
        controllers[i].text = i < capped.length ? capped[i] : '';
      }
    }

    if (capped.length == length) {
      _submit();
    }
  }

  // ============================================
  // INPUT HANDLING
  // ============================================

  void onChanged(String value, int index) {
    if (_isDisposed) return;

    if (hasError) hasError = false;

    if (value.length > 1) {
      _handlePaste(value);
      return;
    }

    if (value.isEmpty) {
      if (index > 0) focusNodes[index - 1].requestFocus();
      _notifyValueChanged();
      return;
    }

    if (index < length - 1) {
      focusNodes[index + 1].requestFocus();
    } else {
      focusNodes[index].unfocus();
      _submit();
    }

    _notifyValueChanged();
  }

  void onBackspace(int index) {
    if (_isDisposed) return;

    if (controllers[index].text.isEmpty && index > 0) {
      controllers[index - 1].clear();
      focusNodes[index - 1].requestFocus();
      _notifyValueChanged();
    }
  }

  // ============================================
  // PASTE SUPPORT
  // ============================================

  /// Fills cells from a pasted string. Supports partial pastes — fills as many
  /// cells as there are digits, then focuses the next empty cell.
  void _handlePaste(String value) {
    if (_isDisposed) return;

    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return;

    for (int i = 0; i < length; i++) {
      controllers[i].text = i < digits.length ? digits[i] : '';
    }

    _notifyValueChanged();

    if (digits.length >= length) {
      focusNodes.last.requestFocus();
      _submit();
    } else {
      focusNodes[digits.length].requestFocus();
    }
  }

  // ============================================
  // VALUE CHANGE NOTIFICATION
  // ============================================

  void _notifyValueChanged() {
    if (_isDisposed) return;
    onValueChanged?.call(currentValue);
  }

  // ============================================
  // SUBMISSION
  // ============================================

  Future<void> _submit() async {
    if (_isDisposed || onCompleted == null || currentValue.length != length) {
      return;
    }

    try {
      isLoading = true;
      onLoadingChanged?.call(true);
      await onCompleted!(currentValue);
    } catch (e) {
      if (!_isDisposed) hasError = true;
      rethrow;
    } finally {
      if (!_isDisposed) {
        isLoading = false;
        onLoadingChanged?.call(false);
      }
    }
  }

  // ============================================
  // UTILITIES
  // ============================================

  String get currentValue => controllers.map((c) => c.text).join();

  bool get isComplete => currentValue.length == length;

  void clear() {
    if (_isDisposed) return;

    for (final controller in controllers) {
      controller.clear();
    }
    hasError = false;
    _notifyValueChanged();

    if (focusNodes.isNotEmpty) {
      focusNodes.first.requestFocus();
    }
  }

  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;

    for (final controller in controllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
  }
}
