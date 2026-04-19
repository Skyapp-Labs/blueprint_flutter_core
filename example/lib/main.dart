import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';

import 'config/app_config.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    BlueprintFlutterCore(
      config: ExampleAppConfig(),
      child: const ExampleApp(),
    ),
  );
}
