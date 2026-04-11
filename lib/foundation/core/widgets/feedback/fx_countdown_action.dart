part of '_index.dart';

/// A tappable action widget with a countdown timer.
///
/// Shows a tappable [actionText] that becomes disabled for [duration] after
/// each press. While disabled, displays a live countdown alongside
/// [countdownPrefixText]. Supports a full [builder] override for custom UI.
///
/// To restart the countdown externally, use a [GlobalKey<FxCountdownActionState>]
/// and call [FxCountdownActionState.restart].
///
/// Example:
/// ```dart
/// FxCountdownAction(
///   prefixText: "Didn't receive a code?",
///   actionText: 'Resend',
///   countdownPrefixText: 'Resend in',
///   onPressed: () async => await resendOtp(),
/// )
/// ```
class FxCountdownAction extends StatefulWidget {
  const FxCountdownAction({
    super.key,
    this.builder,
    this.textAlign,
    this.duration = const Duration(seconds: 30),
    this.textStyle,
    this.prefixText = '',
    this.enabledColor,
    this.disabledColor,
    this.countdownPrefixText = '',
    required this.actionText,
    required this.onPressed,
  });

  final String prefixText;
  final String actionText;
  final TextAlign? textAlign;
  final Duration duration;
  final Color? enabledColor;
  final Color? disabledColor;
  final String countdownPrefixText;
  final TextStyle? textStyle;
  final Future<void> Function() onPressed;
  final Widget Function(String countdown, bool isEnabled)? builder;

  @override
  State<FxCountdownAction> createState() => FxCountdownActionState();
}

class FxCountdownActionState extends State<FxCountdownAction> with FxUiToolkit {
  Timer? _timer;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Restarts the countdown from the full [FxCountdownAction.duration].
  ///
  /// Use via [GlobalKey<FxCountdownActionState>] when an external event
  /// should reset the timer without the user pressing the action.
  void restart() => _startCountdown();

  void _startCountdown() {
    _remainingSeconds = widget.duration.inSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _tick(),
    );
  }

  void _tick() {
    if (_remainingSeconds <= 1) {
      _timer?.cancel();
      _remainingSeconds = 0;
    } else {
      _remainingSeconds--;
    }
    setState(() {});
  }

  bool get _isDisabled => _remainingSeconds > 0;

  String get _countdown => _remainingSeconds.toString().padLeft(2, '0');

  /// Builds the display string passed to [FxText].
  ///
  /// When enabled:  "Didn't receive a code? [Resend]"
  /// When disabled: "Didn't receive a code? Resend in (30 s)"
  String get _displayText {
    final prefix = widget.prefixText.isEmpty ? '' : '${widget.prefixText} ';

    if (!_isDisabled) return '$prefix[${widget.actionText}]';

    final countdownPrefix = widget.countdownPrefixText.isEmpty
        ? ''
        : '${widget.countdownPrefixText} ';

    return '$prefix$countdownPrefix($_countdown s)';
  }

  FxTextStyle get _resolvedTextStyle {
    final base = widget.textStyle != null
        ? FxTextStyle.fromStyle(widget.textStyle!)
        : FxTextStyle();

    return base.copyWith(
      textAlign: widget.textAlign ?? TextAlign.center,
      linkColor: widget.enabledColor,
      color: _isDisabled ? widget.disabledColor : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    if (widget.builder != null) return widget.builder!(_countdown, !_isDisabled);

    return FxText(
      _displayText,
      style: _resolvedTextStyle,
      onTap: (_, __) async {
        if (_isDisabled) return;
        await widget.onPressed();
        _startCountdown();
      },
    );
  }
}
