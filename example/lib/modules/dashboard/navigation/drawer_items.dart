import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/blueprint_widgets.dart' show FxPane, FxPaneDividerStyle, FxUiToolkitContext;

/// Panes for the home screen drawer.
List<FxPane> drawerItems(BuildContext context, VoidCallback onLogout) => [
  FxPane.drawer(
    key: 'drawer-catalog',
    icon: (isActive) => isActive ? Icons.home : Icons.home_outlined,
    title: 'Catalog',
    showAppBar: false,
    builder: (context, _) => Center(child: Text('My Catalog'))
  ),
  FxPane.drawer(
    key: 'drawer-explore',
    icon: (isActive) => isActive ? Icons.explore : Icons.explore_outlined,
    title: 'Explore',
    builder: (context, _) => Center(child: Text('Explore your options'))
  ),
  FxPane.drawer(
    key: 'drawer-products',
    icon: (isActive) => isActive ? Icons.production_quantity_limits : Icons.production_quantity_limits_outlined,
    title: 'Products',
    showEndDrawer: false,
    builder: (context, _) => Center(child: Text('Manage your products'))
  ),
  FxPane.divider(
    title: 'Settings',
    style: dividerStyle(context)
  ),
  FxPane.drawer(
    key: 'drawer-settings',
    icon: (isActive) => isActive ? Icons.settings : Icons.settings_outlined,
    title: 'Settings',
    builder: (context, _) => Center(child: Text('Manage your settings'))
  ),
  FxPane.drawer(
    key: 'drawer-help',
    icon: (isActive) => isActive ? Icons.help : Icons.help_outlined,
    title: 'Help',
    showDrawer: false,
    builder: (context, _) => Center(child: Text('Get help with your account'))
  ),
  FxPane.stickyBottom(
    key: 'signout',
    icon: (isActive) => isActive ? Icons.logout_outlined : Icons.logout_outlined,
    trailingBuilder: (_, _) => Icon(Icons.person),
    title: 'Sign out',
    subtitle: 'Sign out of your account',
    onPressed: (_, _) => onLogout()
  ),
];


FxPaneDividerStyle dividerStyle(BuildContext context) => FxPaneDividerStyle(
  strokeWidth: 0,
  margin: EdgeInsets.only(top: context.fxUiToolkit.sizes.lg),
  padding: EdgeInsets.symmetric(
    horizontal: context.fxUiToolkit.sizes.md,
    vertical: context.fxUiToolkit.sizes.sm
  ),
  color: context.fxUiToolkit.colors.outline,
  textStyle: context.fxUiToolkit.typography.bodyLarge.copyWith(
    color: context.fxUiToolkit.colors.textPrimary,
    fontSize: context.fxUiToolkit.sizes.textMd,
    fontWeight: FontWeight.w600,
  )
);
