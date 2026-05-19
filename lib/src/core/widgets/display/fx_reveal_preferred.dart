import 'package:blueprint_flutter_core/src/core/widgets/display/fx_reveal_transitions.dart';
import 'package:flutter/material.dart';

/// Animated [PreferredSizeWidget] for [Scaffold.appBar] and similar slots.
///
/// Pass a [GlobalKey] via [key] (e.g. `GlobalKey<_FxRevealPreferredState>()`)
/// so [preferredSize] tracks the animation. [FxRevealPreferred.create] can
/// supply one automatically.
class FxRevealPreferred extends StatefulWidget implements PreferredSizeWidget {
  const FxRevealPreferred({
    super.key,
    required this.visible,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.fade = true,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
  });

  /// Same as [FxRevealPreferred] but owns an internal [GlobalKey].
  factory FxRevealPreferred.create({
    required bool visible,
    required PreferredSizeWidget child,
    Duration duration = const Duration(milliseconds: 250),
    Curve curve = Curves.easeInOut,
    bool fade = true,
    FxRevealTransitionBuilder transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
  }) {
    final stateKey = GlobalKey<_FxRevealPreferredState>();

    return FxRevealPreferred(
      key: stateKey,
      fade: fade,
      curve: curve,
      visible: visible,
      duration: duration,
      transitionBuilder: transitionBuilder,
      child: child,
    );

  }

  final bool visible;
  final PreferredSizeWidget child;
  final Duration duration;
  final Curve curve;
  final bool fade;
  final FxRevealTransitionBuilder transitionBuilder;

  @override
  Size get preferredSize {
    final state = key is GlobalKey<_FxRevealPreferredState>
        ? (key as GlobalKey<_FxRevealPreferredState>).currentState
        : null;
    if (state != null) return Size.fromHeight(state.extent);
    final h = child.preferredSize.height;
    return Size.fromHeight(visible ? h : 0);
  }

  @override
  State<FxRevealPreferred> createState() => _FxRevealPreferredState();
}

class _FxRevealPreferredState extends State<FxRevealPreferred> with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  late Animation<double> _factor;

  double get extent => widget.child.preferredSize.height * _factor.value;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);
    _factor = CurvedAnimation(parent: _controller, curve: widget.curve);
    _controller.addListener(_onTick);

    if (widget.visible) _controller.value = 1;
  }

  @override
  void didUpdateWidget(covariant FxRevealPreferred oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
    if (oldWidget.curve != widget.curve) {
      _factor = CurvedAnimation(parent: _controller, curve: widget.curve);
    }
    if (oldWidget.visible != widget.visible) {
      widget.visible ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onTick)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.transitionBuilder(
    widget.child,
    _factor,
  );

  void _onTick() {
    if (!mounted) return;
    setState(() {});
    context.findAncestorStateOfType<ScaffoldState>()?.setState(() {});
  }
}
