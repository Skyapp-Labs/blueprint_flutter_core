part of 'fx_overlay.dart';

/// Scrollable custom body for overlays without a list configuration.
class FxOverlayBody<T> extends StatelessWidget with FxUiToolkit {
  FxOverlayBody({
    super.key,
    this.isScrollable = true,
    required this.data,
    required this.scrollController,
  }) : assert(
          data.builder != null,
          'FxOverlayData.builder must be provided when list is null.',
        );

  final bool isScrollable;
  final ScrollController scrollController;
  final FxOverlayData<T> data;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final heading = data.heading?.call(context);
    final footer = data.footer?.call(context);
    final builder = data.builder!;

    if (heading == null && footer == null) {
      if (!isScrollable) return builder(context);

      return PrimaryScrollController(
        controller: scrollController,
        child: builder(context),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: sizes.sm,
      children: [
        if (heading != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sizes.lg),
            child: heading,
          ),
        Flexible(
          child: isScrollable
              ? SingleChildScrollView(
                  controller: scrollController,
                  child: builder(context),
                )
              : builder(context),
        ),
        if (footer != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: sizes.sm,
              left: sizes.lg,
              right: sizes.lg,
            ),
            child: footer,
          ),
      ],
    );
  }
}
