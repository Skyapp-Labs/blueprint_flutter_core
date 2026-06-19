part of 'fx_overlay.dart';

enum FxOverlayType {
  /// A modal is anything that takes focus and prevents interaction with the background until dismissed.
  modal,
  /// A small overlay that interrupts the current flow and requires a decision or acknowledgement.
  dialog,
  /// A panel that slides from the bottom.
  bottomSheet,
}

class FxBottomSheetOptions {
  const FxBottomSheetOptions({
    this.initialChildSize = 0.5,
    this.maxChildSize = 0.9,
    this.minChildSize = 0.25,
    this.canFullHeight = true,
  });

  final bool canFullHeight;
  final double maxChildSize;
  final double minChildSize;
  final double initialChildSize;
}

Future<Result?> showFxOverlay<Result, T>(
  BuildContext context, {
  bool cancelable = true,
  bool useSafeArea = true,
  FxOverlayType type = FxOverlayType.bottomSheet,
  ScrollController? scrollController,
  FxBottomSheetOptions bottomSheetOptions = const FxBottomSheetOptions(),
  required FxOverlayOptions<T> options,
}) {
  final themeData = context.themeData.overlayTheme;
  DraggableScrollableController? sheetController;

  if (type == FxOverlayType.bottomSheet) {
    sheetController ??= DraggableScrollableController();
  }

  return switch (type) {
    FxOverlayType.bottomSheet => showModalBottomSheet<Result>(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: cancelable,
      isScrollControlled: bottomSheetOptions.canFullHeight,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        maxChildSize: bottomSheetOptions.maxChildSize,
        minChildSize: bottomSheetOptions.minChildSize,
        controller: sheetController!,
        initialChildSize: bottomSheetOptions.initialChildSize,
        builder: (context, controller) => FxBottomSheetShell<T>(
          type: type,
          options: options,
          useSafeArea: useSafeArea,
          sheetController: sheetController!,
          scrollController: scrollController ?? controller,
          bottomSheetOptions: bottomSheetOptions,
        )
      )
    ),
    FxOverlayType.modal => showGeneralDialog<Result>(
      context: context,
      barrierColor: themeData.barrierColor,
      fullscreenDialog: true,
      transitionDuration: context.componentTheme
        .switchingViewTransition().duration,
      transitionBuilder: (context, animation, _, child) => context.componentTheme
        .switchingViewTransition()
        .transitionBuilder(child, animation),
      pageBuilder: (context, _, _) => Material(
        color: Colors.transparent,
        child: FxBottomSheetShell<T>(
          type: type,
          useSafeArea: useSafeArea,
          options: options,
          scrollController: scrollController
        )
      )
    ),
    FxOverlayType.dialog => showDialog<Result>(
      context: context,
      barrierColor: themeData.barrierColor,
      barrierDismissible: cancelable,
      builder: (context) => Center(child: Material(
        color: Colors.transparent,
        child: FxBottomSheetShell<T>(
          type: type,
          options: options,
          useSafeArea: useSafeArea,
          scrollController: scrollController
        )
      ))
    )
  };
}