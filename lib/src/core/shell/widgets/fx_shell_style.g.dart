// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_shell_style.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

typedef FxShellStyleCopyWithFn =
    FxShellStyle Function({
      FxDockStyle dockStyle,
      FxAppBarStyle appBarStyle,
      FxDrawerStyle drawerStyle,
      FxScaffoldStyle scaffoldStyle,
      FxDrawerStyle endDrawerStyle,
      Duration animationDuration,
      FloatingActionButtonLocation floatingActionButtonLocation,
    });

const Object _fxShellStyleCopyWithPlaceholder = Object();

extension FxShellStyleCopyWith on FxShellStyle {
  FxShellStyleCopyWithFn get copyWith {
    final instance = this;
    FxShellStyle copyWithFn({
      Object dockStyle = _fxShellStyleCopyWithPlaceholder,
      Object appBarStyle = _fxShellStyleCopyWithPlaceholder,
      Object drawerStyle = _fxShellStyleCopyWithPlaceholder,
      Object scaffoldStyle = _fxShellStyleCopyWithPlaceholder,
      Object endDrawerStyle = _fxShellStyleCopyWithPlaceholder,
      Object animationDuration = _fxShellStyleCopyWithPlaceholder,
      Object floatingActionButtonLocation = _fxShellStyleCopyWithPlaceholder,
    }) {
      return FxShellStyle(
        dockStyle: identical(dockStyle, _fxShellStyleCopyWithPlaceholder)
            ? instance.dockStyle
            : dockStyle as FxDockStyle,
        appBarStyle: identical(appBarStyle, _fxShellStyleCopyWithPlaceholder)
            ? instance.appBarStyle
            : appBarStyle as FxAppBarStyle,
        drawerStyle: identical(drawerStyle, _fxShellStyleCopyWithPlaceholder)
            ? instance.drawerStyle
            : drawerStyle as FxDrawerStyle,
        scaffoldStyle:
            identical(scaffoldStyle, _fxShellStyleCopyWithPlaceholder)
            ? instance.scaffoldStyle
            : scaffoldStyle as FxScaffoldStyle,
        endDrawerStyle:
            identical(endDrawerStyle, _fxShellStyleCopyWithPlaceholder)
            ? instance.endDrawerStyle
            : endDrawerStyle as FxDrawerStyle,
        animationDuration:
            identical(animationDuration, _fxShellStyleCopyWithPlaceholder)
            ? instance.animationDuration
            : animationDuration as Duration,
        floatingActionButtonLocation:
            identical(
              floatingActionButtonLocation,
              _fxShellStyleCopyWithPlaceholder,
            )
            ? instance.floatingActionButtonLocation
            : floatingActionButtonLocation as FloatingActionButtonLocation,
      );
    }

    return copyWithFn as FxShellStyleCopyWithFn;
  }
}
