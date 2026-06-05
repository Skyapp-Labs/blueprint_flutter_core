// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendOtpPayload {

 String get phone;
/// Create a copy of SendOtpPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOtpPayloadCopyWith<SendOtpPayload> get copyWith => _$SendOtpPayloadCopyWithImpl<SendOtpPayload>(this as SendOtpPayload, _$identity);

  /// Serializes this SendOtpPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpPayload&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'SendOtpPayload(phone: $phone)';
}


}

/// @nodoc
abstract mixin class $SendOtpPayloadCopyWith<$Res>  {
  factory $SendOtpPayloadCopyWith(SendOtpPayload value, $Res Function(SendOtpPayload) _then) = _$SendOtpPayloadCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class _$SendOtpPayloadCopyWithImpl<$Res>
    implements $SendOtpPayloadCopyWith<$Res> {
  _$SendOtpPayloadCopyWithImpl(this._self, this._then);

  final SendOtpPayload _self;
  final $Res Function(SendOtpPayload) _then;

/// Create a copy of SendOtpPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SendOtpPayload].
extension SendOtpPayloadPatterns on SendOtpPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendOtpPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendOtpPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendOtpPayload value)  $default,){
final _that = this;
switch (_that) {
case _SendOtpPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendOtpPayload value)?  $default,){
final _that = this;
switch (_that) {
case _SendOtpPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendOtpPayload() when $default != null:
return $default(_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone)  $default,) {final _that = this;
switch (_that) {
case _SendOtpPayload():
return $default(_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone)?  $default,) {final _that = this;
switch (_that) {
case _SendOtpPayload() when $default != null:
return $default(_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendOtpPayload implements SendOtpPayload {
  const _SendOtpPayload({required this.phone});
  factory _SendOtpPayload.fromJson(Map<String, dynamic> json) => _$SendOtpPayloadFromJson(json);

@override final  String phone;

/// Create a copy of SendOtpPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendOtpPayloadCopyWith<_SendOtpPayload> get copyWith => __$SendOtpPayloadCopyWithImpl<_SendOtpPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendOtpPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOtpPayload&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'SendOtpPayload(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$SendOtpPayloadCopyWith<$Res> implements $SendOtpPayloadCopyWith<$Res> {
  factory _$SendOtpPayloadCopyWith(_SendOtpPayload value, $Res Function(_SendOtpPayload) _then) = __$SendOtpPayloadCopyWithImpl;
@override @useResult
$Res call({
 String phone
});




}
/// @nodoc
class __$SendOtpPayloadCopyWithImpl<$Res>
    implements _$SendOtpPayloadCopyWith<$Res> {
  __$SendOtpPayloadCopyWithImpl(this._self, this._then);

  final _SendOtpPayload _self;
  final $Res Function(_SendOtpPayload) _then;

/// Create a copy of SendOtpPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_SendOtpPayload(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
