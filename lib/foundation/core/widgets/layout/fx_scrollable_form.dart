import 'package:flutter/material.dart';

import '../fx_context.dart';

class FxScrollableForm extends StatelessWidget with FxUiToolkit {
  FxScrollableForm({
    super.key,
    required this.children,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
    this.constraints,
    this.padding,
    this.spacing,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.footer,
    this.header,
  });

  /// The children widgets of the scrollable form.
  final List<Widget> children;
  /// The keyboard dismiss behavior of the scrollable form. Default is [ScrollViewKeyboardDismissBehavior.onDrag].
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  /// The constraints of the scrollable form. Default is null.
  final BoxConstraints? constraints;
  /// The padding of the scrollable form. Default is null.
  final EdgeInsets? padding;
  /// The main axis alignment of the children. Default is [MainAxisAlignment.center].
  final MainAxisAlignment mainAxisAlignment;
  /// The cross axis alignment of the children. Default is [CrossAxisAlignment.stretch].
  final CrossAxisAlignment crossAxisAlignment;
  /// The spacing between the children widgets Default is [sizes.md].
  final double? spacing;
  /// The footer widget Default is null.
  final Widget? footer;
  /// The header widget Default is null.
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    if(footer == null && header == null) return _buildContent();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        header ?? const SizedBox.shrink(),
        _buildContent(),
        footer ?? const SizedBox.shrink()
      ],
    );
  }

  Widget _buildContent() => Expanded(
    child: LayoutBuilder(
      builder: (context, boxConstraints) => SingleChildScrollView(
        keyboardDismissBehavior: keyboardDismissBehavior,
        padding: padding,
        child: ConstrainedBox(
          constraints: (constraints ?? BoxConstraints()).copyWith(
            minHeight: boxConstraints.maxHeight
          ),
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            spacing: spacing ?? sizes.md,
            children: children
          )
        )
      ),
    ),
  );
}
