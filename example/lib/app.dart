import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blueprint_flutter_core/blueprint_theme.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';

import 'theme/app_theme.dart';
import 'router.dart';

/// Root application widget.
///
/// Watches [themeControllerProvider] to apply the persisted theme mode
/// and initialises [ScreenUtil] via the [MaterialApp] builder.
class ExampleApp extends ConsumerWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final appTheme = AppTheme();

    return MaterialApp.router(
      title: 'Blueprint Flutter Core',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: appTheme.build(Brightness.light),
      darkTheme: appTheme.build(Brightness.dark),
      routerConfig: appRouter,
      builder: (context, child) {
        ScreenUtil.init(context, designWidth: 390, designHeight: 844);
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
