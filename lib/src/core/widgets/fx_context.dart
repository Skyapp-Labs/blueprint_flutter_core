import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/theme/fx_colors.dart';
import 'package:blueprint_flutter_core/src/core/theme/fx_sizes.dart';
import 'package:blueprint_flutter_core/src/core/theme/fx_typography.dart';
import 'package:blueprint_flutter_core/src/core/theme/fx_theme_data.dart';
import 'package:blueprint_flutter_core/src/core/theme/fx_component_theme.dart';
import 'package:blueprint_flutter_core/src/core/theme/fx_theme_controller.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/fx_overlay.dart';

import 'package:blueprint_flutter_core/src/core/shell/widgets/fx_shell_scope.dart';

mixin FxUiToolkit {
  BuildContext? _context;

	void setToolkitContext(BuildContext ctx) {
    if(_context == ctx) return;
		_context = ctx;
	}

	BuildContext get _ctx {
		if(_context == null) throw Exception('Context not set before using FxUiToolkit');
		return _context!;
	}
  
  // ── Flutter theme (still useful for colorScheme) ──────────────────────────

  /// Returns the theme data for the context.
	ThemeData get theme => Theme.of(_ctx);

  /// Returns the color scheme for the context.
	ColorScheme get colorScheme => theme.colorScheme;

  /// Returns the text theme for the context.
  TextTheme get flutterTextTheme => theme.textTheme;


  // ── Your custom theme system ──────────────────────────────────────────────

  /// Returns the sizes for the context.
  FxSizes      get sizes      => theme.extension<FxSizes>()!;

  /// Returns the typography for the context.
  FxTypography get typography => theme.extension<FxTypography>()!;

  /// Returns the colors for the context.
  FxColors get colors => typography.colors;

  /// Returns the theme data for the context.
  FxThemeData get themeData => theme.extension<FxThemeData>()!;

  /// Returns the component theme for the context.
  FxComponentTheme get componentTheme => theme.extension<FxComponentTheme>()!;

  // ── Screen ─────────────────────────────────────────────

  /// Returns the media query data for the context.
  MediaQueryData get mediaQuery   => MediaQuery.of(_ctx);
  /// Returns the safe area padding for the context.
  EdgeInsets     get safePadding      => mediaQuery.padding;
  /// Returns the screen size for the context.
  Size           get screenSize   => mediaQuery.size;
  /// Returns the screen width for the context.
  double         get screenWidth  => screenSize.width;
  /// Returns the screen height for the context.
  double         get screenHeight => screenSize.height;
  /// Returns true if the screen is a phone.
  bool           get isPhone      => screenWidth < 600;
  /// Returns true if the screen is a tablet.
  bool           get isTablet     => screenWidth >= 600;
  /// Returns true if the screen is a desktop.
  bool           get isDesktop    => screenWidth >= 1024;

  // ── Shell ─────────────────────────────────────────────
  /// Returns the [FxShellScope] if it exists, otherwise returns null.
  /// Example:
  /// ```dart
  /// FxUiContext.of(context).shellScope;
  /// ```
  FxShellScope? get shellScope => FxShellScope.maybeOf(_ctx);

  // ── Navigation ─────────────────────────────────────────────

  /// Pushes a named route onto the stack.
  ///
  /// Example: `push('/home')`
  void push(String route) {
    if(_ctx.mounted) GoRouter.of(_ctx).push(route);
  }

  /// Replaces the current route with a named route.
  ///
  /// Use this when you don't want the user to go back — e.g. after login.
  /// Example: `pushReplace('/home')`
  void pushReplace(String route) {
    if(_ctx.mounted) GoRouter.of(_ctx).pushReplacement(route);
  }

  /// Clears the entire stack and pushes a named route.
  ///
  /// Use this for logout or onboarding completion.
  /// Example: `pushAndClearStack('/login')`
  void pushAndClearStack(String route) {
    if(_ctx.mounted) GoRouter.of(_ctx).go(route);
  }

  /// Pops the current route off the stack.
  ///
  /// Optionally pass a [result] back to the previous route.
  void pop<T>([T? result]) => GoRouter.of(_ctx).pop(result);

  /// Returns true if there is a route to pop.
  bool get canPop => GoRouter.of(_ctx).canPop();


  // ── Overlay / Focus ─────────────────────────────────────────────

  /// Shows the blueprint bottom sheet.
  ///
  /// Use [FxOverlayData] to configure title, content, list, heading, and footer.
  ///
  /// Single-select lists return `T`; multi-select lists return `List<T>`:
  /// ```dart
  /// final country = await showFxBottomSheet<Country>(data: singleData);
  /// final tags = await showFxBottomSheet<List<Tag>>(data: multiData);
  /// ```
  Future<R?> showFxBottomSheet<R, I>({
    /// Whether the bottom sheet can be dismissed by tapping outside.
    bool cancelable = true,
    /// Allows the sheet to expand to full screen height.
    bool allowFullHeight = true,
    /// The maximum fraction of screen height the sheet can occupy.
    double maxChildSize = 0.9,
    /// The minimum fraction of screen height the sheet can occupy.
    double minChildSize = 0.25,
    /// The initial fraction of screen height the sheet occupies when opened.
    double initialChildSize = 0.5,
    /// The data for the bottom sheet.
    required FxOverlayData<I> data,
  }) =>
      FxBottomSheet.show<R, I>(
        _ctx,
        data: data,
        cancelable: cancelable,
        allowFullHeight: allowFullHeight,
        maxChildSize: maxChildSize,
        minChildSize: minChildSize,
        initialChildSize: initialChildSize,
      );

  /// Shows the blueprint dialog.
  ///
  /// Use [FxDialogStyle.center] for confirmations and alerts.
  /// Use [FxDialogStyle.fullPage] for complex forms or detail views.
  Future<R?> showFxDialog<R, I>({
    /// Whether the dialog can be dismissed by tapping outside.
    bool cancelable = true,
    /// The style of the dialog: centered or full page. Default is centered.
    FxDialogStyle style = FxDialogStyle.center,
    /// The data for the dialog.
    required FxOverlayData<I> data,
  }) =>
      FxDialog.show<R, I>(
        _ctx,
        data: data,
        cancelable: cancelable,
        style: style,
      );

  /// Unfocuses the current focus node.
  void unfocus() => FocusScope.of(_ctx).unfocus();
  /// Shows a snack bar.
  void showSnackBar(SnackBar snackBar) => ScaffoldMessenger.of(_ctx).showSnackBar(snackBar);


  // ── Mode ───────────────────────────────────────────────

  /// Returns true if the theme is dark mode.
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Toggles the theme between light and dark mode.
  ///
  /// Requires a [WidgetRef] — only available in [ConsumerWidget] or [ConsumerStatefulWidget].
  /// Call this from your widget's `build` method or a callback that has access to `ref`.
  ///
  /// Example:
  /// ```dart
  /// ElevatedButton(
  ///   onPressed: () => toggleTheme(ref),
  ///   child: Text('Toggle Theme'),
  /// )
  /// ```
  void toggleTheme(WidgetRef ref) =>
    ref.read(fxThemeControllerProvider.notifier).toggleDark();


  // ── Localisation ─────────────────────────────────────────────
  // AppLocalizations get l10n => AppLocalizations.of(_ctx)!;
}

class FxUiContext with FxUiToolkit {

  FxUiContext._(BuildContext context) {
    super.setToolkitContext(context);
  }

  /// Constructor for the [FxUiContext].
  /// Example:
  /// ```dart
  /// FxUiContext.of(context);
  /// ```
  FxUiContext.of(BuildContext context) : this._(context);
}

extension FxUiToolkitContext on BuildContext {
  FxUiContext get fxUiToolkit => FxUiContext.of(this);
}