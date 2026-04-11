part of '_index.dart';

/// A configurable PIN/digit input widget.
///
/// Renders [length] individual digit cells in a row with auto-advance,
/// backspace navigation, paste support, and shake animation on error.
/// Supports external controller sync for custom keyboards via [controller].
///
/// > **Layout note:** Each cell uses `Flexible + AspectRatio(1)` to be
/// > equally-sized and square. This requires the parent widget tree to provide
/// > a bounded height. Wrap in a `SizedBox(height: ...)` if the parent is
/// > height-unconstrained.
///
/// Use [FxOtpInput] for OTP verification flows that also need a resend countdown.
class FxPinInput extends StatefulWidget {
  const FxPinInput({
    super.key,
    required this.onCompleted,
    this.length = 6,
    this.theme,
    this.autoFocus = true,
    this.controller,
    this.focusNode,
  });

  final Future<void> Function(String)? onCompleted;
  final int length;
  final FxPinInputTheme? theme;
  final bool autoFocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<FxPinInput> createState() => FxPinInputState();
}

class FxPinInputState extends State<FxPinInput>
    with FxUiToolkit, SingleTickerProviderStateMixin {
  late final FxPinInputController _pinController;
  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _pinController = FxPinInputController(
      length: widget.length,
      onCompleted: _handleCompleted,
    );

    // Trigger setState whenever loading starts or stops so AnimatedOpacity updates.
    _pinController.onLoadingChanged = (_) {
      if (mounted) setState(() {});
    };

    if (widget.controller != null) {
      widget.controller!.addListener(_syncFromExternal);
      _pinController.onValueChanged = (value) {
        if (widget.controller!.text != value) {
          widget.controller!.text = value;
        }
      };
    }

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _shakeAnimation = Tween<double>(begin: 0, end: 10)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_shakeController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _shakeController.reverse();
        }
      });

    if (widget.autoFocus) _pinController.requestFirstFocus();
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_syncFromExternal);
    _shakeController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  /// Clears all cells and triggers the shake animation.
  ///
  /// Call via [GlobalKey<FxPinInputState>] to signal a wrong entry to the user.
  void triggerError() {
    _pinController.clear();
    _shakeController.forward(from: 0);
  }

  void _syncFromExternal() {
    final externalValue = widget.controller?.text ?? '';
    if (externalValue != _pinController.currentValue) {
      _pinController.updateFromExternal(externalValue);
      setState(() {});
    }
  }

  Future<void> _handleCompleted(String pin) async {
    try {
      await widget.onCompleted?.call(pin);
    } catch (e) {
      triggerError();
      setState(() {});
      rethrow;
    }
  }

  bool get _isLoading => _pinController.isLoading;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return AnimatedOpacity(
      opacity: _isLoading ? 0.3 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: AnimatedBuilder(
        animation: _shakeAnimation,
        builder: (context, child) => Transform.translate(
          offset: Offset(_shakeAnimation.value, 0),
          child: child,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: widget.theme?.spacing ?? 16,
          children: List.generate(widget.length, _buildField),
        ),
      ),
    );
  }

  Widget _buildField(int index) {
    final activeIndex = _pinController.controllers.indexWhere((c) => c.text.isEmpty);
    final isActiveCell = index == (activeIndex == -1 ? widget.length - 1 : activeIndex);

    return Flexible(
      child: AspectRatio(
        aspectRatio: 1,
        child: FxPinInputField(
          controller: _pinController.controllers[index],
          focusNode: _pinController.focusNodes[index],
          enabled: !_isLoading,
          hasError: _pinController.hasError,
          pasteLength: isActiveCell ? widget.length : 1,
          inputTheme: widget.theme ??
              FxPinInputTheme.fromTheme(theme).copyWith(
                padding: EdgeInsets.zero,
              ),
          onChanged: (value) {
            _pinController.onChanged(value, index);
            setState(() {});
          },
          onBackspace: () {
            _pinController.onBackspace(index);
            setState(() {});
          },
          onTap: _pinController.focusActive,
        ),
      ),
    );
  }
}
