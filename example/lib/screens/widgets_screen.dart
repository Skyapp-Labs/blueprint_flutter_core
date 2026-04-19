import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';

/// A comprehensive showcase of the Fx widget library.
///
/// Sections: Typography, Buttons, Inputs, Display, Feedback, Overlays.
class WidgetsShowcaseScreen extends StatefulWidget {
  const WidgetsShowcaseScreen({super.key});

  @override
  State<WidgetsShowcaseScreen> createState() => _WidgetsShowcaseScreenState();
}

class _WidgetsShowcaseScreenState extends State<WidgetsShowcaseScreen>
    with FxUiToolkit {
  bool _isLoading = false;
  String? _selectedOption;
  String _searchQuery = '';
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return FxScaffold(
      appBar: AppBar(title: const Text('Widget Showcase')),
      padding: EdgeInsets.zero,
      body: ListView(
        padding: EdgeInsets.all(sizes.md),
        children: [
          _sectionHeader('Typography'),
          _typographySection(),
          _sectionHeader('Buttons'),
          _buttonsSection(),
          _sectionHeader('Inputs'),
          _inputsSection(),
          _sectionHeader('Display'),
          _displaySection(),
          _sectionHeader('Feedback'),
          _feedbackSection(),
          _sectionHeader('Overlays'),
          _overlaysSection(),
          SizedBox(height: sizes.xl),
        ],
      ),
    );
  }

  // ── Section header ──────────────────────────────────────────────────────────

  Widget _sectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(top: sizes.xl, bottom: sizes.md),
      child: Row(
        children: [
          Text(title, style: typography.titleLarge),
          SizedBox(width: sizes.sm),
          Expanded(child: Divider(color: colors.outline)),
        ],
      ),
    );
  }

  // ── Typography ──────────────────────────────────────────────────────────────

  Widget _typographySection() {
    final styles = [
      ('headlineMedium', typography.headlineMedium, 'Headline Medium'),
      ('headlineSmall', typography.headlineSmall, 'Headline Small'),
      ('titleLarge', typography.titleLarge, 'Title Large'),
      ('titleMedium', typography.titleMedium, 'Title Medium'),
      ('bodyLarge', typography.bodyLarge, 'Body Large'),
      ('bodyMedium', typography.bodyMedium, 'Body Medium'),
      ('bodySmall', typography.bodySmall, 'Body Small'),
      ('labelLarge', typography.labelLarge, 'Label Large'),
      ('caption', typography.caption, 'Caption'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (token, style, sample) in styles)
          Padding(
            padding: EdgeInsets.only(bottom: sizes.xs),
            child: Row(
              children: [
                SizedBox(
                  width: 140,
                  child: Text(
                    token,
                    style: typography.captionSmall.copyWith(
                      fontFamily: 'monospace',
                      color: colors.primary,
                    ),
                  ),
                ),
                Expanded(child: Text(sample, style: style)),
              ],
            ),
          ),
        SizedBox(height: sizes.sm),
        FxText(
          'FxText supports [tappable] and [linked] spans inline.',
          style: FxTextStyle(
            textStyle: typography.bodyMedium,
            linkColor: colors.primary,
          ),
          onTap: (index, text) {
            FxSnackbar.show(
              context,
              message: 'Tapped: "$text"',
              type: FxSnackbarType.info,
            );
          },
        ),
      ],
    );
  }

  // ── Buttons ─────────────────────────────────────────────────────────────────

  Widget _buttonsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxButton(
          label: 'Primary',
          onPressed: () => FxSnackbar.show(
            context,
            message: 'Primary pressed',
            type: FxSnackbarType.success,
          ),
        ),
        SizedBox(height: sizes.sm),
        FxButton(
          label: 'Secondary',
          variant: FxButtonVariant.secondary,
          onPressed: () => FxSnackbar.show(
            context,
            message: 'Secondary pressed',
            type: FxSnackbarType.info,
          ),
        ),
        SizedBox(height: sizes.sm),
        FxButton(
          label: 'Outline',
          variant: FxButtonVariant.outline,
          onPressed: () => FxSnackbar.show(
            context,
            message: 'Outline pressed',
            type: FxSnackbarType.info,
          ),
        ),
        SizedBox(height: sizes.sm),
        FxButton(
          label: 'Danger',
          variant: FxButtonVariant.danger,
          onPressed: () => FxSnackbar.show(
            context,
            message: 'Danger pressed',
            type: FxSnackbarType.error,
          ),
        ),
        SizedBox(height: sizes.sm),
        FxButton(
          label: 'Loading…',
          isLoading: true,
          onPressed: () {},
        ),
        SizedBox(height: sizes.sm),
        FxButton(
          label: 'With Icon',
          prefixIcon: const Icon(Icons.rocket_launch_outlined, size: 18),
          onPressed: () {},
        ),
        SizedBox(height: sizes.sm),
        Row(
          children: [
            Expanded(
              child: FxButton(
                label: 'Toggle Load',
                variant: FxButtonVariant.outline,
                isLoading: _isLoading,
                onPressed: () async {
                  setState(() => _isLoading = true);
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() => _isLoading = false);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ── Inputs ──────────────────────────────────────────────────────────────────

  Widget _inputsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxTextField(
          controller: _emailController,
          label: 'Email',
          hint: 'you@example.com',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.mail_outline_rounded),
        ),
        SizedBox(height: sizes.md),
        FxTextField(
          label: 'Password',
          hint: 'Enter your password',
          obscureText: true,
          prefixIcon: const Icon(Icons.lock_outline_rounded),
        ),
        SizedBox(height: sizes.md),
        FxTextField(
          label: 'Disabled field',
          hint: 'Cannot edit',
          enabled: false,
        ),
        SizedBox(height: sizes.md),
        FxSearchField(
          hint: 'Search widgets…',
          onChanged: (v) => setState(() => _searchQuery = v),
        ),
        if (_searchQuery.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: sizes.xs),
            child: Text(
              'Searching for "$_searchQuery"',
              style: typography.caption,
            ),
          ),
        SizedBox(height: sizes.md),
        FxSelectField<String>(
          label: 'Select an option',
          selectedValue: _selectedOption,
          data: FxSelectFieldData<String>(
            items: const ['Flutter', 'Dart', 'Firebase'],
            labelBuilder: (v) => v,
          ),
          onChanged: (v, _) => setState(() => _selectedOption = v),
        ),
      ],
    );
  }

  // ── Display ─────────────────────────────────────────────────────────────────

  Widget _displaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatars
        Text('Avatars', style: typography.titleSmall),
        SizedBox(height: sizes.sm),
        Row(
          spacing: sizes.md,
          children: [
            FxAvatar(name: 'Alice Johnson', radius: sizes.avatarXl / 2),
            FxAvatar(name: 'Bob Smith', radius: sizes.avatarLg / 2),
            FxAvatar(name: 'Carol White', radius: sizes.avatarMd / 2),
            FxAvatar(
              name: 'Dave',
              radius: sizes.avatarSm / 2,
              showOnlineIndicator: true,
            ),
          ],
        ),
        SizedBox(height: sizes.lg),
        // FxListTile
        Text('List Tiles', style: typography.titleSmall),
        SizedBox(height: sizes.sm),
        Card(
          child: Column(
            children: [
              FxListTile(
                leading: const Icon(Icons.person_outline_rounded),
                title: 'Alice Johnson',
                subtitle: 'alice@example.com',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => FxSnackbar.show(
                  context,
                  message: 'Tapped Alice',
                  type: FxSnackbarType.info,
                ),
              ),
              const Divider(height: 0),
              FxListTile(
                leading: FxAvatar(name: 'Bob Smith', radius: sizes.avatarSm / 2),
                title: 'Bob Smith',
                subtitle: 'bob@example.com',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: sizes.lg),
        // Empty state
        Text('Empty State', style: typography.titleSmall),
        SizedBox(height: sizes.sm),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: colors.surfaceVariant.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(sizes.radiusLg),
          ),
          child: FxEmptyState(
            icon: const Icon(Icons.inbox_outlined),
            title: 'Nothing here yet',
            subtitle: 'Add items to see them listed here.',
            actionLabel: 'Add Item',
            onAction: () => FxSnackbar.show(
              context,
              message: 'Add item tapped',
              type: FxSnackbarType.info,
            ),
          ),
        ),
      ],
    );
  }

  // ── Feedback ─────────────────────────────────────────────────────────────────

  Widget _feedbackSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Snackbars', style: typography.titleSmall),
        SizedBox(height: sizes.sm),
        Wrap(
          spacing: sizes.sm,
          runSpacing: sizes.sm,
          children: [
            for (final type in FxSnackbarType.values)
              FxButton(
                label: type.name.toUpperCase(),
                variant: FxButtonVariant.outline,
                isFullWidth: false,
                onPressed: () => FxSnackbar.show(
                  context,
                  message: '${type.name} message example',
                  type: type,
                ),
              ),
          ],
        ),
        SizedBox(height: sizes.lg),
        Text('Loader', style: typography.titleSmall),
        SizedBox(height: sizes.sm),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FxLoader(fullScreen: false, message: 'Loading…'),
          ],
        ),
      ],
    );
  }

  // ── Overlays ─────────────────────────────────────────────────────────────────

  Widget _overlaysSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxButton(
          label: 'Show Bottom Sheet',
          variant: FxButtonVariant.outline,
          prefixIcon: const Icon(Icons.expand_less_rounded, size: 18),
          onPressed: () => showFxBottomSheet(
            data: FxOverlayData(
              title: 'Blueprint Bottom Sheet',
              builder: (ctx) => Padding(
                padding: EdgeInsets.all(sizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'This is a draggable bottom sheet built with FxBottomSheet.',
                      style: typography.bodyMedium,
                    ),
                    SizedBox(height: sizes.md),
                    FxButton(
                      label: 'Close',
                      variant: FxButtonVariant.primary,
                      onPressed: () => pop(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: sizes.sm),
        FxButton(
          label: 'Show Dialog',
          variant: FxButtonVariant.outline,
          prefixIcon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
          onPressed: () => showFxDialog(
            data: FxOverlayData(
              title: 'Confirm Action',
              builder: (ctx) => Padding(
                padding: EdgeInsets.symmetric(horizontal: sizes.md),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Are you sure you want to proceed? This action cannot be undone.',
                      style: typography.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: sizes.lg),
                    Row(
                      spacing: sizes.sm,
                      children: [
                        Expanded(
                          child: FxButton(
                            label: 'Cancel',
                            variant: FxButtonVariant.outline,
                            onPressed: () => pop(),
                          ),
                        ),
                        Expanded(
                          child: FxButton(
                            label: 'Confirm',
                            onPressed: () {
                              pop();
                              FxSnackbar.show(
                                context,
                                message: 'Action confirmed!',
                                type: FxSnackbarType.success,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
