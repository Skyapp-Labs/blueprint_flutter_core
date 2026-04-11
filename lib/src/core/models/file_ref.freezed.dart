// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileRef {

 String get url; String? get name; String? get mimeType; int? get sizeBytes;
/// Create a copy of FileRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileRefCopyWith<FileRef> get copyWith => _$FileRefCopyWithImpl<FileRef>(this as FileRef, _$identity);

  /// Serializes this FileRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileRef&&(identical(other.url, url) || other.url == url)&&(identical(other.name, name) || other.name == name)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,name,mimeType,sizeBytes);

@override
String toString() {
  return 'FileRef(url: $url, name: $name, mimeType: $mimeType, sizeBytes: $sizeBytes)';
}


}

/// @nodoc
abstract mixin class $FileRefCopyWith<$Res>  {
  factory $FileRefCopyWith(FileRef value, $Res Function(FileRef) _then) = _$FileRefCopyWithImpl;
@useResult
$Res call({
 String url, String? name, String? mimeType, int? sizeBytes
});




}
/// @nodoc
class _$FileRefCopyWithImpl<$Res>
    implements $FileRefCopyWith<$Res> {
  _$FileRefCopyWithImpl(this._self, this._then);

  final FileRef _self;
  final $Res Function(FileRef) _then;

/// Create a copy of FileRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? name = freezed,Object? mimeType = freezed,Object? sizeBytes = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,sizeBytes: freezed == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FileRef].
extension FileRefPatterns on FileRef {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileRef() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileRef value)  $default,){
final _that = this;
switch (_that) {
case _FileRef():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileRef value)?  $default,){
final _that = this;
switch (_that) {
case _FileRef() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String? name,  String? mimeType,  int? sizeBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileRef() when $default != null:
return $default(_that.url,_that.name,_that.mimeType,_that.sizeBytes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String? name,  String? mimeType,  int? sizeBytes)  $default,) {final _that = this;
switch (_that) {
case _FileRef():
return $default(_that.url,_that.name,_that.mimeType,_that.sizeBytes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String? name,  String? mimeType,  int? sizeBytes)?  $default,) {final _that = this;
switch (_that) {
case _FileRef() when $default != null:
return $default(_that.url,_that.name,_that.mimeType,_that.sizeBytes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FileRef implements FileRef {
  const _FileRef({required this.url, this.name, this.mimeType, this.sizeBytes});
  factory _FileRef.fromJson(Map<String, dynamic> json) => _$FileRefFromJson(json);

@override final  String url;
@override final  String? name;
@override final  String? mimeType;
@override final  int? sizeBytes;

/// Create a copy of FileRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileRefCopyWith<_FileRef> get copyWith => __$FileRefCopyWithImpl<_FileRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileRef&&(identical(other.url, url) || other.url == url)&&(identical(other.name, name) || other.name == name)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,name,mimeType,sizeBytes);

@override
String toString() {
  return 'FileRef(url: $url, name: $name, mimeType: $mimeType, sizeBytes: $sizeBytes)';
}


}

/// @nodoc
abstract mixin class _$FileRefCopyWith<$Res> implements $FileRefCopyWith<$Res> {
  factory _$FileRefCopyWith(_FileRef value, $Res Function(_FileRef) _then) = __$FileRefCopyWithImpl;
@override @useResult
$Res call({
 String url, String? name, String? mimeType, int? sizeBytes
});




}
/// @nodoc
class __$FileRefCopyWithImpl<$Res>
    implements _$FileRefCopyWith<$Res> {
  __$FileRefCopyWithImpl(this._self, this._then);

  final _FileRef _self;
  final $Res Function(_FileRef) _then;

/// Create a copy of FileRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? name = freezed,Object? mimeType = freezed,Object? sizeBytes = freezed,}) {
  return _then(_FileRef(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,sizeBytes: freezed == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
