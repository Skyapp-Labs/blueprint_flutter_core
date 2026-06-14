import 'package:blueprint_flutter_core/blueprint_flutter_core.dart' show fxConfigProvider;
import 'package:blueprint_flutter_core/blueprint_widgets.dart'
    show FxUiToolkit;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerWidget with FxUiToolkit {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    // ref.listen(splashControllerProvider, (_, next) {
    //   next.whenData((target) {
    //     final path = GoRouter.of(context).state.uri.path;
    //     if (!context.mounted || path != AppPaths.splash) return;
    //     if (target == NavigationTarget.home) pushReplace(AppPaths.home);
    //     if (target == NavigationTarget.login) pushReplace(AppPaths.login);
    //     if (target == NavigationTarget.onboarding) pushReplace(AppPaths.onboarding);
    //   });
    // });

    return Scaffold(
      backgroundColor: colors.primary,
      body: Center(
        child: Text(
          ref.read(fxConfigProvider).appName,
          style: typography.titleLarge.copyWith(
            fontSize: sizes.text2xl,
            fontWeight: FontWeight.bold,
            color: colors.onPrimary,
          )
        ),
      ),
    );
  }
}
