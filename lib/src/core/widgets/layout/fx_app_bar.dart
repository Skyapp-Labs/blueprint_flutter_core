import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';

class FxAppBarStyle {
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final double elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool automaticallyImplyLeading;

  const FxAppBarStyle({
    this.titleWidget,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.elevation = 0,
    this.backgroundColor,
    this.foregroundColor,
    this.automaticallyImplyLeading = true,
  });
}

/// A consistent app bar for the blueprint.
class FxAppBar extends StatelessWidget with FxUiToolkit implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final double elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool automaticallyImplyLeading;

  FxAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.elevation = 0,
    this.backgroundColor,
    this.foregroundColor,
    this.automaticallyImplyLeading = true,
  });

  factory FxAppBar.fromStyle(FxAppBarStyle style, {String? title}) => FxAppBar(
    title: title,
    titleWidget: style.titleWidget,
    actions: style.actions,
    leading: style.leading,
    centerTitle: style.centerTitle,
    elevation: style.elevation,
    backgroundColor: style.backgroundColor,
    foregroundColor: style.foregroundColor,
    automaticallyImplyLeading: style.automaticallyImplyLeading,
  );

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return AppBar(
      title: titleWidget ?? (title != null ? Text(title!) : null),
      actions: actions,
      leading: leading,
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize {
    try {
      return Size.fromHeight(sizes.appBarHeight);
    } catch (e) {
      return Size.fromHeight(kToolbarHeight);
    }
  }
}