import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerificationScreen extends ConsumerWidget with FxUiToolkit{
  VerificationScreen({
    super.key, 
    this.primary = false,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    this.error,
    this.success,
  });

  final bool primary;

  final String title;
  final String subtitle;
  final String buttonLabel;
  final String? error;
  final String? success;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final transitionTheme = componentTheme.switchingViewTransition();

    return Scaffold(
      primary: primary,
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          onPressed: () {}, 
          icon: context.componentTheme.navigateBackIcon
        ),
      ),
      body: AnimatedSwitcher(
        duration: transitionTheme.duration,
        switchInCurve: transitionTheme.switchInCurve,
        switchOutCurve: transitionTheme.switchOutCurve,
        transitionBuilder: transitionTheme.transitionBuilder,
        layoutBuilder: transitionTheme.layoutBuilder,
        reverseDuration: transitionTheme.reverseDuration,
        child: const SizedBox.shrink(),
      ),
    );
  }
}