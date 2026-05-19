import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Inherited scope for imperative shell actions from any descendant
/// (including nested [Scaffold]s inside [FxPane] bodies).
class FxShellScope extends InheritedWidget {
  const FxShellScope({
    super.key, 
    required this.scaffoldKey,
    required this.hasDrawer,
    required this.hasEndDrawer,
    required this.canPopShell,
    required this.popShell,
    required super.child,
  });

  /// The [GlobalKey] for the [ScaffoldState].
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).scaffoldKey;
  /// ```
  final GlobalKey<ScaffoldState> scaffoldKey;
  
  /// Whether the drawer is supported.
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).hasDrawer;
  /// ```
  final bool hasDrawer;

  /// Whether the end drawer is supported.
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).hasEndDrawer;
  /// ```
  final bool hasEndDrawer;

  /// Whether shell pane history can be popped ([FxShellCtrl.pop]).
  final bool canPopShell;

  /// Pops one pane from shell history. Returns `false` if [canPopShell] is false.
  final bool Function() popShell;

  ScaffoldState? get _scaffold => scaffoldKey.currentState;

  /// Whether the drawer is open.
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).isDrawerOpen;
  /// ```
  bool get isDrawerOpen => _scaffold?.isDrawerOpen ?? false;

  /// Whether the end drawer is open.
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).isEndDrawerOpen;
  /// ```
  bool get isEndDrawerOpen => _scaffold?.isEndDrawerOpen ?? false;

  /// Opens the drawer if it is not open.
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).openDrawer();
  /// ```
  void openDrawer() {
    if (!hasDrawer) return;
    _scaffold?.openDrawer();
  }

  /// Closes the drawer if it is open.
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).closeDrawer();
  /// ```
  void closeDrawer() {
    if (!isDrawerOpen) return;
    _scaffold?.closeDrawer();
  }

  /// Opens the end drawer if it is not open.
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).openEndDrawer();
  /// ```
  void openEndDrawer() {
    if (!hasEndDrawer) return;
    _scaffold?.openEndDrawer();
  }

  /// Closes the end drawer if it is open.
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).closeEndDrawer();
  /// ```
  void closeEndDrawer() {
    if (!isEndDrawerOpen) return;
    _scaffold?.closeEndDrawer();
  }

  /// Closes whichever drawer is open; no-op if none.
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).closeAnyDrawer();
  /// ```
  void closeAnyDrawer() {
    if (isDrawerOpen) {
      closeDrawer();
    } else if (isEndDrawerOpen) {
      closeEndDrawer();
    }
  }

  /// Whether back would close a drawer, pop shell, or pop [Navigator].
  bool canHandleBack(BuildContext context) {
    if (isDrawerOpen || isEndDrawerOpen) return true;
    if (canPopShell) return true;
    return Navigator.of(context).canPop();
  }
  /// System back order: drawer → shell history → route → `false` if nothing left.
  bool handleBack(BuildContext context) {
    if (isDrawerOpen) {
      closeDrawer();
      return true;
    }
    if (isEndDrawerOpen) {
      closeEndDrawer();
      return true;
    }
    if (canPopShell && popShell()) return true;
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
      return true;
    }
    return false;
  }

  /// Call when [handleBack] returns `false` (e.g. exit app).
  void exitApp() => SystemNavigator.pop();

  /// Returns the [FxShellScope] if it exists, otherwise throws an assertion.
  /// Use this to access the [FxShellScope] from any descendant widget.
  /// Example:
  /// ```dart
  /// FxShellScope.of(context).openDrawer();
  /// ```
  static FxShellScope of(BuildContext context) {
    final scope = maybeOf(context);
    assert(
      scope != null,
      '\n\n🚨 FxShellScope not found. Wrap your app (or route) with FxShell.\n\n',
    );
    return scope!;
  }

  /// Returns the [FxShellScope] if it exists, otherwise returns null.
  /// Use this to access the [FxShellScope] from any descendant widget.
  /// Example:
  /// ```dart
  /// FxShellScope.maybeOf(context)?.openDrawer();
  /// ```
  /// Note: This method is safer than [of] because it does not throw an assertion.
  /// It is recommended to use this method instead of [of] in most cases.
  /// If you are sure the [FxShellScope] exists, use [of] instead.
  static FxShellScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FxShellScope>();
  }

  @override
  bool updateShouldNotify(FxShellScope oldWidget) {
    return hasDrawer != oldWidget.hasDrawer ||
        hasEndDrawer != oldWidget.hasEndDrawer ||
        canPopShell != oldWidget.canPopShell ||
        popShell != oldWidget.popShell ||
        scaffoldKey != oldWidget.scaffoldKey;
  }
}

extension FxShellScopeContext on BuildContext {
  FxShellScope get shellScope => FxShellScope.of(this);
  FxShellScope? get shellScopeOrNull => FxShellScope.maybeOf(this);
}