import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/blueprint_widgets.dart' show FxPane;
import 'package:example/modules/home/presentation/screens/home_screen.dart';

/// Panes for the home screen bottom navigation bar.
final List<FxPane> dockItems = [
  FxPane.dock(
    key: 'home',
    icon: (isActive) => isActive ? Icons.home : Icons.home_outlined,
    title: 'Home',
    builder: (context, _) => HomeScreen()
  ),
  FxPane.dock(
    key: 'about',
    icon: (isActive) => isActive ? Icons.info : Icons.info_outlined,
    title: 'About us',
    builder: (context, _) => Center(child: Text('About us')),
  ),

  FxPane.spacer(),
  FxPane.dock(
    key: 'contact',
    icon: (isActive) => isActive ? Icons.contact_mail : Icons.contact_mail_outlined,
    title: 'Contact us',
    builder: (context, _) => Center(child: Text('Contact us')),
  ),
  FxPane.dock(
    key: 'profile',
    icon: (isActive) => isActive ? Icons.person : Icons.person_outlined,
    title: 'Profile',
    builder: (context, _) => Center(child: Text('Profile')),
  ),
];
