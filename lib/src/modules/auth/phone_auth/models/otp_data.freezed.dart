// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtpData {

 String get verificationId; int get expiresAt;
/// Create a copy of OtpData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpDataCopyWith<OtpData> get copyWith => _$OtpDataCopyWithImpl<OtpData>(this as OtpData, _$identity);

  /// Serializes this OtpData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpData&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationId,expiresAt);

@override
String toString() {
  return 'OtpData(verificationId: $verificationId, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $OtpDataCopyWith<$Res>  {
  factory $OtpDataCopyWith(OtpData value, $Res Function(OtpData) _then) = _$OtpDataCopyWithImpl;
@useResult
$Res call({
 String verificationId, int expiresAt
});




}
/// @nodoc
class _$OtpDataCopyWithImpl<$Res>
    implements $OtpDataCopyWith<$Res> {
  _$OtpDataCopyWithImpl(this._self, this._then);

  final OtpData _self;
  final $Res Function(OtpData) _then;

/// Create a copy of OtpData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verificationId = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpData].
extension OtpDataPatterns on OtpData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpData value)  $default,){
final _that = this;
switch (_that) {
case _OtpData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpData value)?  $default,){
final _that = this;
switch (_that) {
case _OtpData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String verificationId,  int expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpData() when $default != null:
return $default(_that.verificationId,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String verificationId,  int expiresAt)  $default,) {final _that = this;
switch (_that) {
case _OtpData():
return $default(_that.verificationId,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String verificationId,  int expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _OtpData() when $default != null:
return $default(_that.verificationId,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpData implements OtpData {
  const _OtpData({required this.verificationId, required this.expiresAt});
  factory _OtpData.fromJson(Map<String, dynamic> json) => _$OtpDataFromJson(json);

@override final  String verificationId;
@override final  int expiresAt;

/// Create a copy of OtpData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpDataCopyWith<_OtpData> get copyWith => __$OtpDataCopyWithImpl<_OtpData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpData&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationId,expiresAt);

@override
String toString() {
  return 'OtpData(verificationId: $verificationId, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$OtpDataCopyWith<$Res> implements $OtpDataCopyWith<$Res> {
  factory _$OtpDataCopyWith(_OtpData value, $Res Function(_OtpData) _then) = __$OtpDataCopyWithImpl;
@override @useResult
$Res call({
 String verificationId, int expiresAt
});




}
/// @nodoc
class __$OtpDataCopyWithImpl<$Res>
    implements _$OtpDataCopyWith<$Res> {
  __$OtpDataCopyWithImpl(this._self, this._then);

  final _OtpData _self;
  final $Res Function(_OtpData) _then;

/// Create a copy of OtpData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verificationId = null,Object? expiresAt = null,}) {
  return _then(_OtpData(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
