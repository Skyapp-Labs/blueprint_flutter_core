import 'package:flutter/material.dart';

class FxCounterText extends ImplicitlyAnimatedWidget {
  const FxCounterText(this.value, {
    super.key,
    this.style,
    this.locale,
    this.prefix,
    this.suffix,
    this.textScaler,
    super.curve = Curves.easeInOut,
    this.maxLines = 1,
    this.overflow = TextOverflow.clip,
    this.softWrap = true,
    this.textAlign = TextAlign.start,
    super.duration = const Duration(milliseconds: 300),
    this.textDirection = TextDirection.ltr,
    this.fractionDigits = 0,
  });

  /// The value to animate.
  final double value;
  
  /// The style of the text.
  final TextStyle? style;
  
  /// The number of decimal places to display.
  final int fractionDigits;
  
  /// The prefix to display before the number.
  final String? prefix;
  
  /// The suffix to display after the number.
  final String? suffix;

  /// The text alignment.
  final TextAlign textAlign;

  /// The text direction.
  final TextDirection textDirection;

  /// The text overflow.
  final TextOverflow overflow;

  /// The text max lines.
  final int? maxLines;

  /// The text soft wrap.
  final bool softWrap;

  /// The text locale.
  final Locale? locale;

  /// The text text scaler.
  final TextScaler? textScaler;

  @override
  AnimatedWidgetBaseState<FxCounterText> createState() => _FxCounterTextState();
}

class _FxCounterTextState extends AnimatedWidgetBaseState<FxCounterText> {
  Tween<double>? _valueTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _valueTween = visitor(
      _valueTween,
      widget.value,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    final value = _valueTween?.evaluate(animation) ?? widget.value;

    return Text(
      '${widget.prefix ?? ''}'
      '${value.toStringAsFixed(widget.fractionDigits)}'
      '${widget.suffix ?? ''}',
      style: widget.style,
      textAlign: widget.textAlign,
      overflow: widget.overflow,
      maxLines: widget.maxLines,
      softWrap: widget.softWrap,
      textDirection: widget.textDirection,
      locale: widget.locale,
      textScaler: widget.textScaler,
    );
  }
}