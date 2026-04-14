import 'package:blueprint_flutter_core/src/core/models/pagination_meta.dart';

/// Generic wrapper for all paginated API responses.
///
/// Usage:
/// ```dart
/// final response = PaginatedResponse.fromJson(
///   json,
///   (item) => MyModel.fromJson(item as Map<String, dynamic>),
/// );
/// ```
class PaginatedResponse<T> {
  const PaginatedResponse({required this.data, required this.meta});

  final List<T> data;
  final PaginationMeta meta;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return PaginatedResponse<T>(
      data: (json['data'] as List).map(fromJsonT).toList(),
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  bool get hasNextPage => meta.page < meta.totalPages;
  bool get isFirstPage => meta.page == 1;
  bool get isLastPage => meta.page == meta.totalPages;
}
