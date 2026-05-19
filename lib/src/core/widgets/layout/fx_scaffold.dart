import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FxScaffoldStyle {
  const FxScaffoldStyle({
    this.primary = true,
    this.safeArea = const FxSafeAreaInsets(),
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.padding,
    this.restorationId,
    this.backgroundColor,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.systemUiOverlayStyle,
    this.resizeToAvoidBottomInset,
  });

  final bool primary;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final String? restorationId;
  final DragStartBehavior drawerDragStartBehavior;
  final FxSafeAreaInsets? safeArea;
  final EdgeInsetsGeometry? padding;
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  FxScaffoldStyle copyWith({
    bool? primary,
    bool? extendBody,
    FxSafeAreaInsets? safeArea,
    EdgeInsetsGeometry? padding,
    SystemUiOverlayStyle? systemUiOverlayStyle,
  }) => FxScaffoldStyle(
    extendBody: extendBody ?? this.extendBody,
    extendBodyBehindAppBar: extendBodyBehindAppBar,
    drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
    endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
    resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    backgroundColor: backgroundColor,
    drawerScrimColor: drawerScrimColor,
    drawerEdgeDragWidth: drawerEdgeDragWidth,
    restorationId: restorationId,
    drawerDragStartBehavior: drawerDragStartBehavior,

    primary: primary ?? this.primary,
    safeArea: safeArea ?? this.safeArea,
    padding: padding ?? this.padding,
    systemUiOverlayStyle: systemUiOverlayStyle ?? this.systemUiOverlayStyle,
  );
}

class FxSafeAreaInsets {
  const FxSafeAreaInsets({
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
  });

  final bool left, top, right, bottom;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;
}

class FxScaffold extends StatelessWidget with FxUiToolkit {
  FxScaffold({
    super.key,
    required this.body,
    this.style = const FxScaffoldStyle(),
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.bottomSheet,
    this.scaffoldKey,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.persistentFooterButtons,
    this.floatingActionButtonLocation,
  });


  final Widget body;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;
  final FxScaffoldStyle style;
  final PreferredSizeWidget? appBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  Widget _buildBody() {
    Widget inner = body;
    final padding = style.padding;

    if(padding != EdgeInsets.zero) {
      inner = Padding(
        padding: padding ?? EdgeInsets.all(sizes.md), 
        child: inner
      );
    }

    if(style.safeArea == null) {
      inner = _buildSafeArea(style.safeArea, inner);
    }

    return inner;
  }

  Widget _buildSafeArea(FxSafeAreaInsets? safeArea, Widget body) {
    if(safeArea == null) return body;

    return SafeArea(
      left: safeArea.left,
      top: safeArea.top,
      right: safeArea.right,
      bottom: safeArea.bottom,
      minimum: safeArea.minimum,
      maintainBottomViewPadding: safeArea.maintainBottomViewPadding,
      child: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);
    
    Widget child = Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      body: _buildBody(),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      persistentFooterButtons: persistentFooterButtons,
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      backgroundColor: style.backgroundColor,
      resizeToAvoidBottomInset: style.resizeToAvoidBottomInset,
      primary: style.primary,
      drawerDragStartBehavior: style.drawerDragStartBehavior,
      extendBody: style.extendBody,
      extendBodyBehindAppBar: style.extendBodyBehindAppBar,
      drawerScrimColor: style.drawerScrimColor,
      drawerEdgeDragWidth: style.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: style.drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: style.endDrawerEnableOpenDragGesture,
      restorationId: style.restorationId,
    );

    final o = style.systemUiOverlayStyle;
    if (o == null) return child;

    final base = isDarkMode
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
        
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: base.copyWith(
        statusBarColor: o.statusBarColor,
        systemNavigationBarColor: o.systemNavigationBarColor,
        systemNavigationBarIconBrightness: o.systemNavigationBarIconBrightness,
        statusBarBrightness: o.statusBarBrightness,
        statusBarIconBrightness: o.statusBarIconBrightness,
        systemStatusBarContrastEnforced: o.systemStatusBarContrastEnforced,
        systemNavigationBarContrastEnforced:
            o.systemNavigationBarContrastEnforced,
        systemNavigationBarDividerColor: o.systemNavigationBarDividerColor,
      ),
      sized: false,
      child: child,
    );
  }
}
