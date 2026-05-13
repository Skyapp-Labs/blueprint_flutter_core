import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/blueprint_theme.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';
import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';
import 'package:blueprint_flutter_core_example/config/app_config.dart';

import 'package:blueprint_flutter_core_example/router.dart';
import 'package:blueprint_flutter_core_example/theme/app_theme.dart';

// main.dart — must be top-level, outside any class
@pragma('vm:entry-point')
Future<void> _onBackgroundMessage(RemoteMessage message) async {
  // FxMessaging.onBackgroundMessage(message);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await FxCore.init(backgroundMessageHandler: _onBackgroundMessage);
  
  runApp(
    BlueprintFlutterCore(
      config: AppConfig(),
      child: const ExampleApp(),
    )
  );
}

class ExampleApp extends ConsumerWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeMode = ref.watch(fxThemeControllerProvider);

    return MaterialApp.router(
      title: ref.read(fxConfigProvider).appName,
      theme: AppTheme().build(Brightness.light),
      themeMode: themeMode,
      darkTheme: AppTheme().build(Brightness.dark),
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ScreenUtil.init(context, designWidth: 390, designHeight: 844);
        return child ?? const SizedBox.shrink();
      },
    );
  }
}