import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';
import 'package:blueprint_flutter_core/blueprint_theme.dart';

// ignore: must_be_immutable
class HomeScreen extends ConsumerWidget with FxUiToolkit {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    return FxScaffold(
      appBar: AppBar(
        title: const Text('Blueprint Widgets'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(fxThemeControllerProvider.notifier).toggleDark();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Typography', style: typography.headlineMedium),
            SizedBox(height: sizes.sm),
            Text('This is a body text.', style: typography.bodyMedium),
            SizedBox(height: sizes.lg),

            Text('Buttons', style: typography.headlineMedium),
            SizedBox(height: sizes.sm),
            FxButton(
              label: 'Primary Button',
              onPressed: () {},
            ),
            SizedBox(height: sizes.sm),
            FxButton(
              label: 'Outline Button',
              variant: FxButtonVariant.outline,
              onPressed: () {},
            ),
            SizedBox(height: sizes.sm),
            FxButton(
              label: 'Danger Button',
              variant: FxButtonVariant.danger,
              onPressed: () {},
            ),
            SizedBox(height: sizes.lg),

            Text('Text Fields', style: typography.headlineMedium),
            SizedBox(height: sizes.sm),
            FxTextField(
              options: FxFieldOptions(
                label: 'Email',
                hint: 'you@example.com',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.mail_outline_rounded),
              ),
            ),
            SizedBox(height: sizes.sm),
            FxTextField(
              options: const FxFieldOptions(
                label: 'Password',
                obscureText: true,
              ),
            ),
            SizedBox(height: sizes.lg),

            Text('Alerts & Snackbars', style: typography.headlineMedium),
            SizedBox(height: sizes.sm),
            FxButton(
              label: 'Show Success Snackbar',
              variant: FxButtonVariant.secondary,
              onPressed: () {
                FxSnackbar.show(
                  context,
                  message: 'This is a success message!',
                  type: FxSnackbarType.success,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
