part of 'fx_overlay.dart';

class FxBottomSheet<T> extends StatelessWidget {
  const FxBottomSheet._({
    super.key,
    required this.data,
    required this.maxChildSize,
    required this.minChildSize,
    required this.scrollController,
    required this.sheetController,
  });

  final FxOverlayData<T> data;
  final double maxChildSize;
  final double minChildSize;
  final ScrollController scrollController;
  final DraggableScrollableController sheetController;

  static Future<R?> show<R, I>(
    BuildContext context, {
    bool cancelable = true,
    bool allowFullHeight = true,
    Color backgroundColor = Colors.transparent,
    double maxChildSize = 0.9,
    double minChildSize = 0.25,
    double initialChildSize = 0.5,
    required FxOverlayData<I> data,
  }) {
    final sheetController = DraggableScrollableController();

    return showModalBottomSheet<R>(
      context: context,
      isDismissible: cancelable,
      backgroundColor: backgroundColor,
      isScrollControlled: allowFullHeight,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        maxChildSize: maxChildSize,
        minChildSize: minChildSize,
        controller: sheetController,
        initialChildSize: initialChildSize,
        builder: (context, scrollController) => FxBottomSheet._(
          data: data,
          maxChildSize: maxChildSize,
          minChildSize: minChildSize,
          sheetController: sheetController,
          scrollController: scrollController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBottomSheetShell<T>(
      data: data,
      scrollController: scrollController,
      sheetController: sheetController,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
    );
  }
}
