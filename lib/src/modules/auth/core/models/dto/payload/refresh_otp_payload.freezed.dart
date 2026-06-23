// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_otp_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefreshOtpPayload {

 String get verificationId;
/// Create a copy of RefreshOtpPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshOtpPayloadCopyWith<RefreshOtpPayload> get copyWith => _$RefreshOtpPayloadCopyWithImpl<RefreshOtpPayload>(this as RefreshOtpPayload, _$identity);

  /// Serializes this RefreshOtpPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshOtpPayload&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationId);

@override
String toString() {
  return 'RefreshOtpPayload(verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class $RefreshOtpPayloadCopyWith<$Res>  {
  factory $RefreshOtpPayloadCopyWith(RefreshOtpPayload value, $Res Function(RefreshOtpPayload) _then) = _$RefreshOtpPayloadCopyWithImpl;
@useResult
$Res call({
 String verificationId
});




}
/// @nodoc
class _$RefreshOtpPayloadCopyWithImpl<$Res>
    implements $RefreshOtpPayloadCopyWith<$Res> {
  _$RefreshOtpPayloadCopyWithImpl(this._self, this._then);

  final RefreshOtpPayload _self;
  final $Res Function(RefreshOtpPayload) _then;

/// Create a copy of RefreshOtpPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verificationId = null,}) {
  return _then(_self.copyWith(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshOtpPayload].
extension RefreshOtpPayloadPatterns on RefreshOtpPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshOtpPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshOtpPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshOtpPayload value)  $default,){
final _that = this;
switch (_that) {
case _RefreshOtpPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshOtpPayload value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshOtpPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String verificationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshOtpPayload() when $default != null:
return $default(_that.verificationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String verificationId)  $default,) {final _that = this;
switch (_that) {
case _RefreshOtpPayload():
return $default(_that.verificationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String verificationId)?  $default,) {final _that = this;
switch (_that) {
case _RefreshOtpPayload() when $default != null:
return $default(_that.verificationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshOtpPayload implements RefreshOtpPayload {
  const _RefreshOtpPayload({required this.verificationId});
  factory _RefreshOtpPayload.fromJson(Map<String, dynamic> json) => _$RefreshOtpPayloadFromJson(json);

@override final  String verificationId;

/// Create a copy of RefreshOtpPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshOtpPayloadCopyWith<_RefreshOtpPayload> get copyWith => __$RefreshOtpPayloadCopyWithImpl<_RefreshOtpPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshOtpPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshOtpPayload&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationId);

@override
String toString() {
  return 'RefreshOtpPayload(verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class _$RefreshOtpPayloadCopyWith<$Res> implements $RefreshOtpPayloadCopyWith<$Res> {
  factory _$RefreshOtpPayloadCopyWith(_RefreshOtpPayload value, $Res Function(_RefreshOtpPayload) _then) = __$RefreshOtpPayloadCopyWithImpl;
@override @useResult
$Res call({
 String verificationId
});




}
/// @nodoc
class __$RefreshOtpPayloadCopyWithImpl<$Res>
    implements _$RefreshOtpPayloadCopyWith<$Res> {
  __$RefreshOtpPayloadCopyWithImpl(this._self, this._then);

  final _RefreshOtpPayload _self;
  final $Res Function(_RefreshOtpPayload) _then;

/// Create a copy of RefreshOtpPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verificationId = null,}) {
  return _then(_RefreshOtpPayload(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
