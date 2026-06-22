import 'package:blueprint_flutter_core/blueprint_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Optional pre-PIN gate — extend or replace in your app.
class OnboardingGateScreen extends ConsumerStatefulWidget {
  const OnboardingGateScreen({super.key});

  @override
  ConsumerState<OnboardingGateScreen> createState() => _OnboardingGateScreenState();
}

class _OnboardingGateScreenState extends ConsumerState<OnboardingGateScreen> with FxUiToolkit {

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(sizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                'Welcome back',
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: sizes.sm),
              Text(
                'Complete this quick step before accessing your dashboard.',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // FilledButton(
              //   onPressed: () {
              //     ref
              //         .read(homeAccessControllerProvider.notifier)
              //         .completeStep(const ExampleOnboardingHomeAccessStep().id);
              //     context.go(AppPaths.home);
              //   },
              //   child: const Text('Continue'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
