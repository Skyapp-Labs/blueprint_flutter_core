import 'package:blueprint_flutter_core/blueprint_auth.dart' show authControllerProvider;
import 'package:blueprint_flutter_core/blueprint_widgets.dart';
import 'package:flutter/material.dart';
import 'package:example/routes/app_paths.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:blueprint_flutter_core/blueprint_notifications.dart';

// ─────────────────────────────────────────────
// DEV ZONE — Replace this screen with your own UI.
// ─────────────────────────────────────────────
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider).user;

    return FxScaffold(
      appBar: FxAppBar(
        leading: IconButton(
          onPressed: FxShellScope.of(context).openDrawer,
          icon: const Icon(Icons.menu),
        ),
        title: 'Home'
      ),
      body: Center(
        child: Column(
          children: [
            Text('Welcome, ${user?.displayName ?? 'User'}!'),
            FxNotificationIcon(
              onPressed: () => context.push(AppPaths.notifications)
            )
          ]
        )
      )
    );
  }
}
