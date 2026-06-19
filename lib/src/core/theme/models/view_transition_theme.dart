import 'package:flutter/material.dart';

class FxViewTransitionTheme {
  const FxViewTransitionTheme({
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  });
  
  final Duration duration;
  final Duration? reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final Widget Function(Widget, Animation<double>) transitionBuilder;
  final Widget Function(Widget?, List<Widget>) layoutBuilder;

  FxViewTransitionTheme copyWith({
    Duration? duration,
    Duration? reverseDuration,
    Curve? switchInCurve,
    Curve? switchOutCurve,
    Widget Function(Widget, Animation<double>)? transitionBuilder,
    Widget Function(Widget?, List<Widget>)? layoutBuilder,
  }) => FxViewTransitionTheme(
    duration: duration ?? this.duration,
    reverseDuration: reverseDuration ?? this.reverseDuration,
    switchInCurve: switchInCurve ?? this.switchInCurve,
    switchOutCurve: switchOutCurve ?? this.switchOutCurve,
    transitionBuilder: transitionBuilder ?? this.transitionBuilder,
    layoutBuilder: layoutBuilder ?? this.layoutBuilder,
  );
}

class ClampedAnimation extends Animation<double> {

  const ClampedAnimation(this.parent);

  final Animation<double> parent;

  @override

  void addListener(VoidCallback listener) =>

      parent.addListener(listener);

  @override

  void removeListener(VoidCallback listener) =>

      parent.removeListener(listener);

  @override

  void addStatusListener(AnimationStatusListener listener) =>

      parent.addStatusListener(listener);

  @override

  void removeStatusListener(AnimationStatusListener listener) =>

      parent.removeStatusListener(listener);

  @override

  AnimationStatus get status => parent.status;

  @override

  double get value => parent.value.clamp(0.0, 1.0);

}