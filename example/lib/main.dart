import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:example/config/app_config.dart';
import 'package:example/routes/app_router.dart';
import 'package:example/theme/app_theme.dart';

import 'package:blueprint_flutter_core/blueprint_theme.dart' show fxThemeControllerProvider;
import 'package:blueprint_flutter_core/blueprint_widgets.dart' show ScreenUtil;
import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';

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
      child: const App(),
    )
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(fxThemeControllerProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(context, designWidth: 390, designHeight: 844);

        return MaterialApp.router(
          title: ref.read(fxConfigProvider).appName,
          theme: AppTheme().build(Brightness.light),
          darkTheme: AppTheme().build(Brightness.dark),
          themeMode: themeMode,
          routerConfig: router,
        );
      },
    );
  }
}
