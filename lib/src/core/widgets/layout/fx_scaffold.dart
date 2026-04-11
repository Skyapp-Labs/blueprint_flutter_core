import 'package:flutter/material.dart';

import 'package:skyapp_flutter_core/src/core/widgets/fx_context.dart';

/// A scaffold that wires the blueprint theme and handles safe area consistently.
class FxScaffold extends StatelessWidget with FxUiToolkit {
  /// The app bar of the scaffold. Default is null.
  final PreferredSizeWidget? appBar;
  /// The body of the scaffold.
  final Widget body;
  /// The floating action button of the scaffold. Default is null.
  final Widget? floatingActionButton;
  /// The bottom navigation bar of the scaffold. Default is null.
  final Widget? bottomNavigationBar;
  /// The background color of the scaffold. Default is [colors.background].
  final Color? backgroundColor;
  /// The resize to avoid bottom inset of the scaffold. Default is [true].
  final bool resizeToAvoidBottomInset;
  /// The padding of the scaffold. Default is [sizes.md].
  final EdgeInsetsGeometry? padding;

  FxScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: Padding(
          padding: padding ?? EdgeInsets.all(sizes.md),
          child: body
        )
      )
    );
  }
}
