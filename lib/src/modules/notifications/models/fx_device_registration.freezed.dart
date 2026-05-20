// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fx_device_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FxDeviceRegistration {

 String get fcmToken; DeviceType get deviceType; String get deviceName;
/// Create a copy of FxDeviceRegistration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FxDeviceRegistrationCopyWith<FxDeviceRegistration> get copyWith => _$FxDeviceRegistrationCopyWithImpl<FxDeviceRegistration>(this as FxDeviceRegistration, _$identity);

  /// Serializes this FxDeviceRegistration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FxDeviceRegistration&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fcmToken,deviceType,deviceName);

@override
String toString() {
  return 'FxDeviceRegistration(fcmToken: $fcmToken, deviceType: $deviceType, deviceName: $deviceName)';
}


}

/// @nodoc
abstract mixin class $FxDeviceRegistrationCopyWith<$Res>  {
  factory $FxDeviceRegistrationCopyWith(FxDeviceRegistration value, $Res Function(FxDeviceRegistration) _then) = _$FxDeviceRegistrationCopyWithImpl;
@useResult
$Res call({
 String fcmToken, DeviceType deviceType, String deviceName
});




}
/// @nodoc
class _$FxDeviceRegistrationCopyWithImpl<$Res>
    implements $FxDeviceRegistrationCopyWith<$Res> {
  _$FxDeviceRegistrationCopyWithImpl(this._self, this._then);

  final FxDeviceRegistration _self;
  final $Res Function(FxDeviceRegistration) _then;

/// Create a copy of FxDeviceRegistration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fcmToken = null,Object? deviceType = null,Object? deviceName = null,}) {
  return _then(_self.copyWith(
fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as DeviceType,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FxDeviceRegistration].
extension FxDeviceRegistrationPatterns on FxDeviceRegistration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FxDeviceRegistration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FxDeviceRegistration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FxDeviceRegistration value)  $default,){
final _that = this;
switch (_that) {
case _FxDeviceRegistration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FxDeviceRegistration value)?  $default,){
final _that = this;
switch (_that) {
case _FxDeviceRegistration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fcmToken,  DeviceType deviceType,  String deviceName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FxDeviceRegistration() when $default != null:
return $default(_that.fcmToken,_that.deviceType,_that.deviceName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fcmToken,  DeviceType deviceType,  String deviceName)  $default,) {final _that = this;
switch (_that) {
case _FxDeviceRegistration():
return $default(_that.fcmToken,_that.deviceType,_that.deviceName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fcmToken,  DeviceType deviceType,  String deviceName)?  $default,) {final _that = this;
switch (_that) {
case _FxDeviceRegistration() when $default != null:
return $default(_that.fcmToken,_that.deviceType,_that.deviceName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FxDeviceRegistration implements FxDeviceRegistration {
  const _FxDeviceRegistration({required this.fcmToken, required this.deviceType, required this.deviceName});
  factory _FxDeviceRegistration.fromJson(Map<String, dynamic> json) => _$FxDeviceRegistrationFromJson(json);

@override final  String fcmToken;
@override final  DeviceType deviceType;
@override final  String deviceName;

/// Create a copy of FxDeviceRegistration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FxDeviceRegistrationCopyWith<_FxDeviceRegistration> get copyWith => __$FxDeviceRegistrationCopyWithImpl<_FxDeviceRegistration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FxDeviceRegistrationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FxDeviceRegistration&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fcmToken,deviceType,deviceName);

@override
String toString() {
  return 'FxDeviceRegistration(fcmToken: $fcmToken, deviceType: $deviceType, deviceName: $deviceName)';
}


}

/// @nodoc
abstract mixin class _$FxDeviceRegistrationCopyWith<$Res> implements $FxDeviceRegistrationCopyWith<$Res> {
  factory _$FxDeviceRegistrationCopyWith(_FxDeviceRegistration value, $Res Function(_FxDeviceRegistration) _then) = __$FxDeviceRegistrationCopyWithImpl;
@override @useResult
$Res call({
 String fcmToken, DeviceType deviceType, String deviceName
});




}
/// @nodoc
class __$FxDeviceRegistrationCopyWithImpl<$Res>
    implements _$FxDeviceRegistrationCopyWith<$Res> {
  __$FxDeviceRegistrationCopyWithImpl(this._self, this._then);

  final _FxDeviceRegistration _self;
  final $Res Function(_FxDeviceRegistration) _then;

/// Create a copy of FxDeviceRegistration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fcmToken = null,Object? deviceType = null,Object? deviceName = null,}) {
  return _then(_FxDeviceRegistration(
fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as DeviceType,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
