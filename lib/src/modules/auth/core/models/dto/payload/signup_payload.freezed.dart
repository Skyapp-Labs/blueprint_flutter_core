// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupPayload {

 String? get verificationToken; String? get email; String? get password; String? get phoneNumber;// String? countryCode,
 SignupProfilePayload get profile;
/// Create a copy of SignupPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupPayloadCopyWith<SignupPayload> get copyWith => _$SignupPayloadCopyWithImpl<SignupPayload>(this as SignupPayload, _$identity);

  /// Serializes this SignupPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupPayload&&(identical(other.verificationToken, verificationToken) || other.verificationToken == verificationToken)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.profile, profile) || other.profile == profile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationToken,email,password,phoneNumber,profile);

@override
String toString() {
  return 'SignupPayload(verificationToken: $verificationToken, email: $email, password: $password, phoneNumber: $phoneNumber, profile: $profile)';
}


}

/// @nodoc
abstract mixin class $SignupPayloadCopyWith<$Res>  {
  factory $SignupPayloadCopyWith(SignupPayload value, $Res Function(SignupPayload) _then) = _$SignupPayloadCopyWithImpl;
@useResult
$Res call({
 String? verificationToken, String? email, String? password, String? phoneNumber, SignupProfilePayload profile
});




}
/// @nodoc
class _$SignupPayloadCopyWithImpl<$Res>
    implements $SignupPayloadCopyWith<$Res> {
  _$SignupPayloadCopyWithImpl(this._self, this._then);

  final SignupPayload _self;
  final $Res Function(SignupPayload) _then;

/// Create a copy of SignupPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verificationToken = freezed,Object? email = freezed,Object? password = freezed,Object? phoneNumber = freezed,Object? profile = null,}) {
  return _then(_self.copyWith(
verificationToken: freezed == verificationToken ? _self.verificationToken : verificationToken // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as SignupProfilePayload,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupPayload].
extension SignupPayloadPatterns on SignupPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupPayload value)  $default,){
final _that = this;
switch (_that) {
case _SignupPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupPayload value)?  $default,){
final _that = this;
switch (_that) {
case _SignupPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? verificationToken,  String? email,  String? password,  String? phoneNumber,  SignupProfilePayload profile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupPayload() when $default != null:
return $default(_that.verificationToken,_that.email,_that.password,_that.phoneNumber,_that.profile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? verificationToken,  String? email,  String? password,  String? phoneNumber,  SignupProfilePayload profile)  $default,) {final _that = this;
switch (_that) {
case _SignupPayload():
return $default(_that.verificationToken,_that.email,_that.password,_that.phoneNumber,_that.profile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? verificationToken,  String? email,  String? password,  String? phoneNumber,  SignupProfilePayload profile)?  $default,) {final _that = this;
switch (_that) {
case _SignupPayload() when $default != null:
return $default(_that.verificationToken,_that.email,_that.password,_that.phoneNumber,_that.profile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignupPayload implements SignupPayload {
  const _SignupPayload({this.verificationToken, this.email, this.password, this.phoneNumber, this.profile = const SignupProfilePayload()});
  factory _SignupPayload.fromJson(Map<String, dynamic> json) => _$SignupPayloadFromJson(json);

@override final  String? verificationToken;
@override final  String? email;
@override final  String? password;
@override final  String? phoneNumber;
// String? countryCode,
@override@JsonKey() final  SignupProfilePayload profile;

/// Create a copy of SignupPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupPayloadCopyWith<_SignupPayload> get copyWith => __$SignupPayloadCopyWithImpl<_SignupPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignupPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupPayload&&(identical(other.verificationToken, verificationToken) || other.verificationToken == verificationToken)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.profile, profile) || other.profile == profile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationToken,email,password,phoneNumber,profile);

@override
String toString() {
  return 'SignupPayload(verificationToken: $verificationToken, email: $email, password: $password, phoneNumber: $phoneNumber, profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$SignupPayloadCopyWith<$Res> implements $SignupPayloadCopyWith<$Res> {
  factory _$SignupPayloadCopyWith(_SignupPayload value, $Res Function(_SignupPayload) _then) = __$SignupPayloadCopyWithImpl;
@override @useResult
$Res call({
 String? verificationToken, String? email, String? password, String? phoneNumber, SignupProfilePayload profile
});




}
/// @nodoc
class __$SignupPayloadCopyWithImpl<$Res>
    implements _$SignupPayloadCopyWith<$Res> {
  __$SignupPayloadCopyWithImpl(this._self, this._then);

  final _SignupPayload _self;
  final $Res Function(_SignupPayload) _then;

/// Create a copy of SignupPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verificationToken = freezed,Object? email = freezed,Object? password = freezed,Object? phoneNumber = freezed,Object? profile = null,}) {
  return _then(_SignupPayload(
verificationToken: freezed == verificationToken ? _self.verificationToken : verificationToken // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as SignupProfilePayload,
  ));
}


}

// dart format on
