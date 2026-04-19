import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';

/// Home screen showing links to each feature demo.
class HomeScreen extends ConsumerWidget with FxUiToolkit {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final features = [
      _Feature(
        icon: Icons.lock_outline_rounded,
        title: 'Authentication',
        subtitle: 'Email & phone auth flows',
        route: '/auth',
        color: colors.primary,
      ),
      _Feature(
        icon: Icons.widgets_outlined,
        title: 'Widget Showcase',
        subtitle: 'Buttons, inputs, overlays & more',
        route: '/widgets',
        color: colors.secondary,
      ),
    ];

    return FxScaffold(
      appBar: AppBar(
        title: const Text('Blueprint Flutter Core'),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            icon: Icon(
              isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
            onPressed: () => toggleTheme(ref),
          ),
        ],
      ),
      padding: EdgeInsets.all(sizes.md),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: sizes.lg),
          Text('Welcome', style: typography.headlineMedium),
          SizedBox(height: sizes.xs),
          Text(
            'Explore the core modules of blueprint_flutter_core.',
            style: typography.bodyMedium.copyWith(color: colors.textSecondary),
          ),
          SizedBox(height: sizes.xl),
          ...features.map((f) => _FeatureCard(feature: f)),
          const Spacer(),
          FxText(
            'Built with [blueprint_flutter_core].',
            style: FxTextStyle(
              textStyle: typography.bodySmall,
              linkColor: colors.primary,
            ),
          ),
          SizedBox(height: sizes.sm),
        ],
      ),
    );
  }
}

class _Feature {
  final IconData icon;
  final String title;
  final String subtitle;
  final String route;
  final Color color;

  const _Feature({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.route,
    required this.color,
  });
}

class _FeatureCard extends StatelessWidget with FxUiToolkit {
  _FeatureCard({required this.feature});

  final _Feature feature;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Padding(
      padding: EdgeInsets.only(bottom: sizes.md),
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(sizes.radiusLg),
          onTap: () => push(feature.route),
          child: Padding(
            padding: EdgeInsets.all(sizes.md),
            child: Row(
              children: [
                Container(
                  width: sizes.iconXl,
                  height: sizes.iconXl,
                  decoration: BoxDecoration(
                    color: feature.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(sizes.radiusMd),
                  ),
                  child: Icon(feature.icon, color: feature.color, size: sizes.iconMd),
                ),
                SizedBox(width: sizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(feature.title, style: typography.titleMedium),
                      SizedBox(height: sizes.xs / 2),
                      Text(
                        feature.subtitle,
                        style: typography.bodySmall,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: sizes.iconXs,
                  color: colors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
