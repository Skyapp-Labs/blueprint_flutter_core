import 'package:blueprint_flutter_core/blueprint_flutter_core.dart' show fxConfigProvider;
import 'package:blueprint_flutter_core/blueprint_widgets.dart'
    show FxUiToolkitContext;
import 'package:example/modules/splash/splash_controller.dart';
import 'package:example/routes/app_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashControllerProvider, (_, next) {
      next.whenData((target) {
        final path = GoRouter.of(context).state.uri.path;
        if (!context.mounted || path != AppPaths.splash) return;
        if (target == NavigationTarget.home) context.pushReplacement(AppPaths.home);
        if (target == NavigationTarget.login) context.pushReplacement(AppPaths.login);
      });
    });

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Center(
        child: Text(
          ref.read(fxConfigProvider).appName,
          style: context.typography.titleLarge.copyWith(
            fontSize: context.sizes.text2xl,
            fontWeight: FontWeight.bold,
            color: context.colors.onPrimary,
          )
        ),
      ),
    );
  }
}
