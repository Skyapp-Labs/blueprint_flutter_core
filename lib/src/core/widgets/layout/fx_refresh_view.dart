import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/_display.dart';
import 'package:blueprint_flutter_core/src/core/widgets/feedback/_feedback.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_empty_state.dart';

typedef FxRefreshViewBuilder<T> = Widget Function(
  T data,
  int itemCount,
  ScrollController scrollController,
  IndexedWidgetBuilder itemBuilder,
);

typedef FxRefreshItemBuilder = Widget Function(
  BuildContext context,
  dynamic item,
  int index,
);

/// Generic refreshable view with:
/// - Initial loading
/// - Pull to refresh
/// - Pagination
/// - Empty state
/// - Error state
class FxRefreshView<T> extends StatefulWidget {
  const FxRefreshView({
    super.key,
    required this.builder,
    required this.onLoad,
    this.errorState = FxStates.error,
    this.emptyState = FxStates.empty,
    this.onLoadMore,
    this.itemBuilder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
    this.loadMoreThreshold = 200,
    this.hasNextPage = false,
  })  : assert(
          !hasNextPage ||
              (onLoadMore != null && itemBuilder != null),
          'onLoadMore and itemBuilder must be provided when hasNextPage is true.',
        );

  /// Main content builder.
  final FxRefreshViewBuilder<T> builder;

  /// Empty state data.
  final FxStateData emptyState;

  /// Error state data.
  final FxStateData errorState;

  /// Initial load / refresh callback.
  final Future<T?> Function(bool refresh) onLoad;

  /// Pagination callback.
  ///
  /// Returning null means no data was returned.
  final Future<T?> Function()? onLoadMore;

  /// Whether more pages exist.
  final bool hasNextPage;

  /// Item builder for paginated lists.
  final FxRefreshItemBuilder? itemBuilder;

  /// Custom loading widget.
  final Widget Function(bool isLoadingMore)? loadingBuilder;

  /// Custom empty widget.
  final Widget Function(VoidCallback onRetry)? emptyBuilder;

  /// Custom error widget.
  final Widget Function(
    String error,
    VoidCallback onRetry,
  )? errorBuilder;

  /// Distance from bottom before pagination triggers.
  final double loadMoreThreshold;

  @override
  State<FxRefreshView<T>> createState() =>
      _FxRefreshViewState<T>();
}

class _FxRefreshViewState<T>
    extends State<FxRefreshView<T>>
    with FxUiToolkit {
  final ScrollController _scrollController =
      ScrollController();

  T? _responseData;

  bool _isInitialLoading = false;
  bool _isLoadingMore = false;
  bool _hasError = false;

  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _loadData(),
    );

    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();

    super.dispose();
  }

  bool get _hasData =>
      _responseData != null &&
      !(_responseData is List &&
          (_responseData as List).isEmpty) &&
      !(_responseData is Map &&
          (_responseData as Map).isEmpty);

  bool get _isPaginationEnabled =>
      widget.hasNextPage &&
      widget.onLoadMore != null &&
      widget.itemBuilder != null;

  List<dynamic> get _items {
    if (_responseData is List) {
      return _responseData as List<dynamic>;
    }

    if (_responseData is Map) {
      return (_responseData as Map)
          .values
          .toList();
    }

    return [];
  }

  int get _itemCount =>
      _items.length +
      (_isLoadingMore ? 1 : 0);

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    if (_isInitialLoading) {
      return _buildLoadingState(false);
    }

    if (_hasError) {
      return _buildErrorState();
    }

    if (!_hasData) {
      return RefreshIndicator(
        onRefresh: _refreshData,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics:
                  const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: constraints.maxHeight,
                child: _buildEmptyState(),
              ),
            );
          },
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: widget.builder(
        _responseData as T,
        _itemCount,
        _scrollController,
        _buildPaginatedItemBuilder,
      ),
    );
  }

  Widget _buildPaginatedItemBuilder(
    BuildContext context,
    int index,
  ) {
    final bool shouldShowLoader =
        _isLoadingMore &&
        index >= _items.length;

    if (shouldShowLoader) {
      return _buildLoadingState(true);
    }

    return widget.itemBuilder!(
      context,
      _items[index],
      index,
    );
  }

  Widget _buildLoadingState(bool isLoadingMore) {
    if (widget.loadingBuilder != null) {
      return widget.loadingBuilder!(
        isLoadingMore,
      );
    }

    return const Center(
      child: FxLoader(fullScreen: false),
    );
  }

  Widget _buildEmptyState() {
    if (widget.emptyBuilder != null) {
      return widget.emptyBuilder!(
        _refreshData,
      );
    }

    return FxStateView.fromData(widget.emptyState, onAction: _refreshData);
  }

  Widget _buildErrorState() {
    final String error =
        _errorMessage ??
        'Something went wrong. Please try again.';

    if (widget.errorBuilder != null) {
      return widget.errorBuilder!(
        error,
        _loadData,
      );
    }

    return FxStateView.fromData(widget.errorState.copyWith(description: error), onAction: _loadData);
  }

  Future<void> _refreshData() async {
    await _loadData(refresh: true);
  }

  Future<void> _loadData({
    bool refresh = false,
  }) async {
    try {
      setState(() {
        _isInitialLoading = true;
        _hasError = false;
      });

      final response =
          await widget.onLoad(refresh);

      if (!mounted) {
        return;
      }

      setState(() {
        _responseData = response;
        _isInitialLoading = false;
        _hasError = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _responseData = null;
        _errorMessage = _parseError(error);
        _hasError = true;
        _isInitialLoading = false;
      });
    }
  }

  Future<void> _handleScroll() async {
    if (!_isPaginationEnabled) {
      return;
    }

    if (!_scrollController.hasClients) {
      return;
    }

    if (_isLoadingMore) {
      return;
    }

    final position =
        _scrollController.position;

    final bool shouldLoadMore =
        position.pixels >=
        position.maxScrollExtent -
            widget.loadMoreThreshold;

    if (!shouldLoadMore) {
      return;
    }

    try {
      setState(() {
        _isLoadingMore = true;
      });

      final response =
          await widget.onLoadMore!.call();

      if (!mounted) {
        return;
      }

      if (response != null) {
        _appendPaginatedData(response);
      }

      setState(() {
        _isLoadingMore = false;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  void _appendPaginatedData(T newData) {
    if (_responseData is List &&
        newData is List) {
      (_responseData as List)
          .addAll(newData);

      return;
    }

    if (_responseData is Map &&
        newData is Map) {
      (_responseData as Map)
          .addAll(newData);

      return;
    }

    _responseData = newData;
  }

  String _parseError(dynamic error) {
    final String message =
        error.toString().trim();

    if (message.isEmpty) {
      return 'Something went wrong. Please try again.';
    }

    return message;
  }
}