import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta.freezed.dart';
part 'pagination_meta.g.dart';

/// Pagination metadata returned by every list endpoint.
///
/// Response shape: { "total": 100, "page": 1, "limit": 20, "totalPages": 5 }
@freezed
abstract class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

const defaultPaginationMeta = PaginationMeta(total: 0, page: 1, limit: 20, totalPages: 0);
Map<String, dynamic> defaultPaginationMetaJson = defaultPaginationMeta.toJson();
