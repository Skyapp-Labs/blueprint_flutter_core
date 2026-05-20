import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_counter_text.dart';

/// Overlays a numeric badge on [child], typically for unread counts.
///
/// Hides the badge when [count] is zero unless [showZero] is true.
/// Values above [maxCount] display as `"$maxCount+"`.
class FxCounterBadge extends StatelessWidget with FxUiToolkit {
  FxCounterBadge({
    super.key,
    required this.size,
    required this.count,
    required this.child,
    this.offset = const Offset(0, 0),
    this.maxCount = 99,
    this.showZero = false,
    this.textStyle,
    this.borderColor,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  });

  final int count;
  final int maxCount;
  final bool showZero;
  final Widget Function(double size) child;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final Offset offset;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  bool get _isVisible => count > 0 || showZero;
  bool get _isAboveLimit => count > maxCount;

  Color get _bg => backgroundColor ?? colorScheme.error;
  Color get _fg => foregroundColor ?? colorScheme.onError;
  Color get _border => borderColor ?? colorScheme.surface;

  double get _iconSize => size * .84;
  double get _badgeSize => size * .57;
  double get _textSize => count > 9 ? _badgeSize * 0.55 : _badgeSize * 0.75;

  

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final icon = child(_iconSize);
    final stack = SizedBox(
      width: size,
      height: size,
      child:  _buildStack(icon)
    );

    final widget = !_isVisible ? icon : stack;

    if (onPressed == null) return widget;

    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(sizes.sm),
          child: widget
        )
      )
    );
  }

  Widget _buildStack(Widget icon) => Stack(
    clipBehavior: Clip.none,
    alignment: count > 0 || showZero ? Alignment.bottomLeft : Alignment.center,
    children: [
      icon,
      Positioned(
        top: offset.dy,
        right: offset.dx,
        child: _buildBadge()
      ),
    ]
  );

  Widget _buildBadge() => Container(
    width: _badgeSize,
    height: _badgeSize,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: _bg,
      borderRadius: BorderRadius.circular(sizes.radiusFull),
      border: Border.all(color: _border, width: 1),
    ),
    child: _buildCounter()
  );

  Widget _buildCounter() => FxCounterText(
    _isAboveLimit ? maxCount.toDouble() : count.toDouble(),
    fractionDigits: 0,
    suffix: _isAboveLimit ? '+' : null,
    textAlign: TextAlign.center,
    style: (textStyle ?? typography.labelSmall).copyWith(
      color: _fg,
      fontSize: _isAboveLimit ? _textSize * 0.65 : _textSize,
      height: 1,
      fontWeight: FontWeight.w700,
    )
  );
}
