import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core_example/router.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';

class SplashScreen extends StatelessWidget with FxUiToolkit {

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return FxScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(size: sizes.icon45),
                SizedBox(height: sizes.lg),
                Text('Splash Screen', style: typography.headlineSmall)
              ]
            )
          ),
          FxButton(
            label: 'Login',
            onPressed: () => push(AppPaths.login),
          ),
          SizedBox(height: sizes.lg),
        ],
      ),
    );
  }
}
