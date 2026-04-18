import 'package:flutter/material.dart';

enum FxSnackbarType { success, error, info, warning }

/// Snackbar utility with themed variants.
///
/// Usage:
/// ```dart
/// FxSnackbar.show(context, message: 'Saved!', type: FxSnackbarType.success);
/// ```
abstract final class FxSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    FxSnackbarType type = FxSnackbarType.info,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor = switch (type) {
      FxSnackbarType.success => Colors.green.shade700,
      FxSnackbarType.error => colorScheme.error,
      FxSnackbarType.warning => Colors.orange.shade700,
      FxSnackbarType.info => colorScheme.inverseSurface,
    };

    final icon = switch (type) {
      FxSnackbarType.success => Icons.check_circle_outline,
      FxSnackbarType.error => Icons.error_outline,
      FxSnackbarType.warning => Icons.warning_amber_outlined,
      FxSnackbarType.info => Icons.info_outline,
    };

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Row(
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          action:
              actionLabel != null
                  ? SnackBarAction(
                    label: actionLabel,
                    textColor: Colors.white,
                    onPressed: onAction ?? () {},
                  )
                  : null,
        ),
      );
  }
}
