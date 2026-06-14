import 'package:blueprint_flutter_core/blueprint_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/blueprint_widgets.dart';
import 'package:example/routes/app_paths.dart';

import 'package:example/modules/dashboard/navigation/dock_items.dart';
import 'package:example/modules/dashboard/navigation/drawer_items.dart';

import 'package:example/modules/dashboard/styles/home_dock_style.dart';
import 'package:example/modules/dashboard/styles/home_drawer_style.dart';
import 'package:example/modules/dashboard/styles/home_end_drawer_styles.dart';

import 'package:example/modules/home/home_controller.dart';
import 'package:go_router/go_router.dart';


// ─────────────────────────────────────────────
// DEV ZONE — Replace this screen with your own UI.
// ─────────────────────────────────────────────
class DashboardScreen extends ConsumerWidget with FxUiToolkit {

  DashboardScreen({super.key});

  /// The initial pane key to display.
  String get initialPaneKey => dockItems.first.key;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    return FxShell(
      dockPanes: dockItems,
      drawerPanes: drawerItems(context, () => _onLogout(context, ref)),
      initialPaneKey: initialPaneKey,
      style: FxShellStyle(
        appBarStyle: FxAppBarStyle(
          actions: [
            FxNotificationIcon(
              onPressed: () => context.push(AppPaths.notifications),
            )

          ]
        ),
        dockStyle: AppDockStyle.build(context),
        drawerStyle: AppDrawerStyle.build(context),
        endDrawerStyle: AppEndDrawerStyle.build(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      floatingActionButton: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {},
        child: const Icon(Icons.add),
      )
    );
  }

  Future<void> _onLogout(BuildContext context, WidgetRef ref) async {
    final controller = ref.read(homeControllerProvider.notifier);
    await controller.logout();
    if (!context.mounted) return;
    GoRouter.of(context).pushReplacementNamed(AppPaths.login);
  }
}
