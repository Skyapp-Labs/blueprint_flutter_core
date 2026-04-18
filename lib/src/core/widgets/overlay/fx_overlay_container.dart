part of '_overlay.dart';

class FxOverlayContainer<T> extends StatelessWidget with FxUiToolkit {

	final bool isScrollable;
	final ScrollController scrollController;
	final FxOverlayData<T> data;

	FxOverlayContainer({
		super.key,
		this.isScrollable = true,
		required this.data,
		required this.scrollController,
	}): assert(data.builder != null, 'FxOverlayData.builder must be provided when list is null');

	@override
	Widget build(BuildContext context) {
		setToolkitContext(context);

		final heading = data.heading?.call(context);
		final footer = data.footer?.call(context);

		if(heading == null && footer == null) {
			if(!isScrollable) return data.builder!(context);

      return PrimaryScrollController(
        controller: scrollController,
        child: data.builder!(context)
      );
		}

		return Column(
			spacing: sizes.sm,
			children: [
				if(heading != null) Padding(
					padding: EdgeInsets.symmetric(horizontal: sizes.lg),
					child: heading
				),
				// Flexible instead of Expanded — allows shrinking when parent
				// has no fixed height (e.g. center dialog without a title),
				// while still expanding to fill bounded parents (sheet, full-page dialog).
				Flexible(
					child: isScrollable
						? SingleChildScrollView(
							controller: scrollController,
							child: data.builder!(context)
						)
						: data.builder!(context)
				),
				if(footer != null) Padding(
					padding: EdgeInsets.only(
						bottom: sizes.sm,
						left: sizes.lg,
						right: sizes.lg
					),
					child: footer
				)
			]
		);
	}
}
