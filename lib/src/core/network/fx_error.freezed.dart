// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fx_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FxError {

 String get message; String? get code; int? get statusCode;
/// Create a copy of FxError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FxErrorCopyWith<FxError> get copyWith => _$FxErrorCopyWithImpl<FxError>(this as FxError, _$identity);

  /// Serializes this FxError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FxError&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,code,statusCode);

@override
String toString() {
  return 'FxError(message: $message, code: $code, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $FxErrorCopyWith<$Res>  {
  factory $FxErrorCopyWith(FxError value, $Res Function(FxError) _then) = _$FxErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? code, int? statusCode
});




}
/// @nodoc
class _$FxErrorCopyWithImpl<$Res>
    implements $FxErrorCopyWith<$Res> {
  _$FxErrorCopyWithImpl(this._self, this._then);

  final FxError _self;
  final $Res Function(FxError) _then;

/// Create a copy of FxError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? code = freezed,Object? statusCode = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FxError].
extension FxErrorPatterns on FxError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FxError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FxError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FxError value)  $default,){
final _that = this;
switch (_that) {
case _FxError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FxError value)?  $default,){
final _that = this;
switch (_that) {
case _FxError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  String? code,  int? statusCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FxError() when $default != null:
return $default(_that.message,_that.code,_that.statusCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  String? code,  int? statusCode)  $default,) {final _that = this;
switch (_that) {
case _FxError():
return $default(_that.message,_that.code,_that.statusCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  String? code,  int? statusCode)?  $default,) {final _that = this;
switch (_that) {
case _FxError() when $default != null:
return $default(_that.message,_that.code,_that.statusCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FxError implements FxError {
  const _FxError({required this.message, this.code, this.statusCode});
  factory _FxError.fromJson(Map<String, dynamic> json) => _$FxErrorFromJson(json);

@override final  String message;
@override final  String? code;
@override final  int? statusCode;

/// Create a copy of FxError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FxErrorCopyWith<_FxError> get copyWith => __$FxErrorCopyWithImpl<_FxError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FxErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FxError&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,code,statusCode);

@override
String toString() {
  return 'FxError(message: $message, code: $code, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class _$FxErrorCopyWith<$Res> implements $FxErrorCopyWith<$Res> {
  factory _$FxErrorCopyWith(_FxError value, $Res Function(_FxError) _then) = __$FxErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, String? code, int? statusCode
});




}
/// @nodoc
class __$FxErrorCopyWithImpl<$Res>
    implements _$FxErrorCopyWith<$Res> {
  __$FxErrorCopyWithImpl(this._self, this._then);

  final _FxError _self;
  final $Res Function(_FxError) _then;

/// Create a copy of FxError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? code = freezed,Object? statusCode = freezed,}) {
  return _then(_FxError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
