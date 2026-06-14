import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';
import 'package:blueprint_flutter_core/blueprint_theme.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';
import 'package:go_router/go_router.dart';

import 'config/app_config.dart';
import 'theme/app_theme.dart';
import 'ui/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    BlueprintFlutterCore(
      config: MyAppConfig(),
      child: const MyApp(),
    ),
  );
}

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(fxThemeControllerProvider);
    final appTheme = AppTheme();

    return MaterialApp.router(
      title: 'Blueprint Example',
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
