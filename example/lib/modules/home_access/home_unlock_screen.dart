import 'package:blueprint_flutter_core/blueprint_security.dart';
import 'package:example/routes/app_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// PIN gate route used by [FxHomeAccessGuard].
class HomeUnlockScreen extends StatelessWidget {
  const HomeUnlockScreen({super.key});

  @override
  Widget build(BuildContext context) => LockScreen(
    onUnlocked: () => context.go(AppPaths.home),
  );
}
