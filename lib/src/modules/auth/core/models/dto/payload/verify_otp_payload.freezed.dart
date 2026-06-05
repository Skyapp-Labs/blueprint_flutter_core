// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyOtpPayload {

 String get verificationId; String get otp;
/// Create a copy of VerifyOtpPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpPayloadCopyWith<VerifyOtpPayload> get copyWith => _$VerifyOtpPayloadCopyWithImpl<VerifyOtpPayload>(this as VerifyOtpPayload, _$identity);

  /// Serializes this VerifyOtpPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpPayload&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationId,otp);

@override
String toString() {
  return 'VerifyOtpPayload(verificationId: $verificationId, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpPayloadCopyWith<$Res>  {
  factory $VerifyOtpPayloadCopyWith(VerifyOtpPayload value, $Res Function(VerifyOtpPayload) _then) = _$VerifyOtpPayloadCopyWithImpl;
@useResult
$Res call({
 String verificationId, String otp
});




}
/// @nodoc
class _$VerifyOtpPayloadCopyWithImpl<$Res>
    implements $VerifyOtpPayloadCopyWith<$Res> {
  _$VerifyOtpPayloadCopyWithImpl(this._self, this._then);

  final VerifyOtpPayload _self;
  final $Res Function(VerifyOtpPayload) _then;

/// Create a copy of VerifyOtpPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verificationId = null,Object? otp = null,}) {
  return _then(_self.copyWith(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpPayload].
extension VerifyOtpPayloadPatterns on VerifyOtpPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpPayload value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpPayload value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String verificationId,  String otp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpPayload() when $default != null:
return $default(_that.verificationId,_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String verificationId,  String otp)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpPayload():
return $default(_that.verificationId,_that.otp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String verificationId,  String otp)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpPayload() when $default != null:
return $default(_that.verificationId,_that.otp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpPayload implements VerifyOtpPayload {
  const _VerifyOtpPayload({required this.verificationId, required this.otp});
  factory _VerifyOtpPayload.fromJson(Map<String, dynamic> json) => _$VerifyOtpPayloadFromJson(json);

@override final  String verificationId;
@override final  String otp;

/// Create a copy of VerifyOtpPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpPayloadCopyWith<_VerifyOtpPayload> get copyWith => __$VerifyOtpPayloadCopyWithImpl<_VerifyOtpPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpPayload&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationId,otp);

@override
String toString() {
  return 'VerifyOtpPayload(verificationId: $verificationId, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpPayloadCopyWith<$Res> implements $VerifyOtpPayloadCopyWith<$Res> {
  factory _$VerifyOtpPayloadCopyWith(_VerifyOtpPayload value, $Res Function(_VerifyOtpPayload) _then) = __$VerifyOtpPayloadCopyWithImpl;
@override @useResult
$Res call({
 String verificationId, String otp
});




}
/// @nodoc
class __$VerifyOtpPayloadCopyWithImpl<$Res>
    implements _$VerifyOtpPayloadCopyWith<$Res> {
  __$VerifyOtpPayloadCopyWithImpl(this._self, this._then);

  final _VerifyOtpPayload _self;
  final $Res Function(_VerifyOtpPayload) _then;

/// Create a copy of VerifyOtpPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verificationId = null,Object? otp = null,}) {
  return _then(_VerifyOtpPayload(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
