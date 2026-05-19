import 'package:blueprint_flutter_core/src/core/widgets/display/fx_reveal_transitions.dart';
import 'package:flutter/material.dart';

/// Animates show/hide by collapsing along [axis] with optional fade.
///
/// For [Scaffold.appBar], use [FxRevealPreferred] instead.
class FxReveal extends StatefulWidget {
  const FxReveal({
    super.key,
    required this.visible,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.axis = Axis.vertical,
    this.fade = true,
    this.alignment = Alignment.topCenter,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
  });

  final bool visible;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Axis axis;
  final bool fade;
  final Alignment alignment;
  final FxRevealTransitionBuilder transitionBuilder;
  
  @override
  State<FxReveal> createState() => _FxRevealState();
}

class _FxRevealState extends State<FxReveal> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _factor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _factor = CurvedAnimation(parent: _controller, curve: widget.curve);
    _controller.addListener(() => setState(() {}));
    if (widget.visible) _controller.value = 1;
  }

  @override
  void didUpdateWidget(covariant FxReveal oldWidget) {
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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.transitionBuilder(
    widget.child,
    _factor,
  );
}