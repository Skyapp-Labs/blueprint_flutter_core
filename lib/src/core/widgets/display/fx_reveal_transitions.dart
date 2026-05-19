import 'package:flutter/material.dart';

typedef FxRevealTransitionBuilder = Widget Function(
  Widget child,
  Animation<double> animation,
);

abstract final class FxRevealTransitions {
  /// Current behavior: clip + collapse + optional fade.
  static Widget collapseFade(
    Widget child,
    Animation<double> animation, {
    Axis axis = Axis.vertical,
    Alignment alignment = Alignment.topCenter,
    bool fade = true,
  }) {
    final revealed = ClipRect(
      child: Align(
        alignment: alignment,
        heightFactor: axis == Axis.vertical ? animation.value : 1,
        widthFactor: axis == Axis.horizontal ? animation.value : 1,
        child: fade
            ? FadeTransition(opacity: animation, child: child)
            : child,
      ),
    );
    return revealed;
  }

  static Widget fadeOnly(Widget child, Animation<double> animation) {
    return FadeTransition(opacity: animation, child: child);
  }

  static Widget slide(
    Widget child,
    Animation<double> animation, {
    Axis axis = Axis.vertical,
    Alignment alignment = Alignment.topCenter,
  }) {
    final offset = axis == Axis.vertical
        ? Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
        : Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero);

    return ClipRect(
      child: Align(
        alignment: alignment,
        heightFactor: axis == Axis.vertical ? animation.value : 1,
        widthFactor: axis == Axis.horizontal ? animation.value : 1,
        child: SlideTransition(
          position: animation.drive(offset),
          child: child,
        ),
      ),
    );
  }

  static Widget scale(
    Widget child,
    Animation<double> animation, {
    Alignment alignment = Alignment.topCenter,
  }) {
    return ClipRect(
      child: Align(
        alignment: alignment,
        heightFactor: animation.value,
        child: ScaleTransition(
          scale: animation,
          alignment: alignment,
          child: child,
        ),
      ),
    );
  }
}