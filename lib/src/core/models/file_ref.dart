import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_ref.freezed.dart';
part 'file_ref.g.dart';

/// A reference to a remote file (image, document, etc.).
@freezed
abstract class FileRef with _$FileRef {
  const factory FileRef({
    required String url,
    String? name,
    String? mimeType,
    int? sizeBytes,
  }) = _FileRef;

  factory FileRef.fromJson(Map<String, dynamic> json) =>
      _$FileRefFromJson(json);
}
