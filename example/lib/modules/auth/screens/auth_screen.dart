import 'package:example/modules/auth/templates/phone_template.dart';
import 'package:example/routes/app_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/blueprint_auth.dart';
import 'package:go_router/go_router.dart';


class AuthScreen extends ConsumerWidget {

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    body: AuthFlowScreen(
      authMethod: AuthMethod.phone,
      onAuthSuccess: (_, _) => context.go(AppPaths.home),
      templates: AuthStepTemplates(
        phone: PhoneTemplate(),
      ),
    )
  );
}
