// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhoneRegisterRequest {

 String get lastName; String get firstName; String get verificationToken; String? get email; String? get phone; String? get countryCode;
/// Create a copy of PhoneRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneRegisterRequestCopyWith<PhoneRegisterRequest> get copyWith => _$PhoneRegisterRequestCopyWithImpl<PhoneRegisterRequest>(this as PhoneRegisterRequest, _$identity);

  /// Serializes this PhoneRegisterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneRegisterRequest&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.verificationToken, verificationToken) || other.verificationToken == verificationToken)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastName,firstName,verificationToken,email,phone,countryCode);

@override
String toString() {
  return 'PhoneRegisterRequest(lastName: $lastName, firstName: $firstName, verificationToken: $verificationToken, email: $email, phone: $phone, countryCode: $countryCode)';
}


}

/// @nodoc
abstract mixin class $PhoneRegisterRequestCopyWith<$Res>  {
  factory $PhoneRegisterRequestCopyWith(PhoneRegisterRequest value, $Res Function(PhoneRegisterRequest) _then) = _$PhoneRegisterRequestCopyWithImpl;
@useResult
$Res call({
 String lastName, String firstName, String verificationToken, String? email, String? phone, String? countryCode
});




}
/// @nodoc
class _$PhoneRegisterRequestCopyWithImpl<$Res>
    implements $PhoneRegisterRequestCopyWith<$Res> {
  _$PhoneRegisterRequestCopyWithImpl(this._self, this._then);

  final PhoneRegisterRequest _self;
  final $Res Function(PhoneRegisterRequest) _then;

/// Create a copy of PhoneRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastName = null,Object? firstName = null,Object? verificationToken = null,Object? email = freezed,Object? phone = freezed,Object? countryCode = freezed,}) {
  return _then(_self.copyWith(
lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,verificationToken: null == verificationToken ? _self.verificationToken : verificationToken // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneRegisterRequest].
extension PhoneRegisterRequestPatterns on PhoneRegisterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneRegisterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneRegisterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneRegisterRequest value)  $default,){
final _that = this;
switch (_that) {
case _PhoneRegisterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneRegisterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneRegisterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lastName,  String firstName,  String verificationToken,  String? email,  String? phone,  String? countryCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneRegisterRequest() when $default != null:
return $default(_that.lastName,_that.firstName,_that.verificationToken,_that.email,_that.phone,_that.countryCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lastName,  String firstName,  String verificationToken,  String? email,  String? phone,  String? countryCode)  $default,) {final _that = this;
switch (_that) {
case _PhoneRegisterRequest():
return $default(_that.lastName,_that.firstName,_that.verificationToken,_that.email,_that.phone,_that.countryCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lastName,  String firstName,  String verificationToken,  String? email,  String? phone,  String? countryCode)?  $default,) {final _that = this;
switch (_that) {
case _PhoneRegisterRequest() when $default != null:
return $default(_that.lastName,_that.firstName,_that.verificationToken,_that.email,_that.phone,_that.countryCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhoneRegisterRequest implements PhoneRegisterRequest {
  const _PhoneRegisterRequest({required this.lastName, required this.firstName, required this.verificationToken, this.email, this.phone, this.countryCode});
  factory _PhoneRegisterRequest.fromJson(Map<String, dynamic> json) => _$PhoneRegisterRequestFromJson(json);

@override final  String lastName;
@override final  String firstName;
@override final  String verificationToken;
@override final  String? email;
@override final  String? phone;
@override final  String? countryCode;

/// Create a copy of PhoneRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneRegisterRequestCopyWith<_PhoneRegisterRequest> get copyWith => __$PhoneRegisterRequestCopyWithImpl<_PhoneRegisterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhoneRegisterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneRegisterRequest&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.verificationToken, verificationToken) || other.verificationToken == verificationToken)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastName,firstName,verificationToken,email,phone,countryCode);

@override
String toString() {
  return 'PhoneRegisterRequest(lastName: $lastName, firstName: $firstName, verificationToken: $verificationToken, email: $email, phone: $phone, countryCode: $countryCode)';
}


}

/// @nodoc
abstract mixin class _$PhoneRegisterRequestCopyWith<$Res> implements $PhoneRegisterRequestCopyWith<$Res> {
  factory _$PhoneRegisterRequestCopyWith(_PhoneRegisterRequest value, $Res Function(_PhoneRegisterRequest) _then) = __$PhoneRegisterRequestCopyWithImpl;
@override @useResult
$Res call({
 String lastName, String firstName, String verificationToken, String? email, String? phone, String? countryCode
});




}
/// @nodoc
class __$PhoneRegisterRequestCopyWithImpl<$Res>
    implements _$PhoneRegisterRequestCopyWith<$Res> {
  __$PhoneRegisterRequestCopyWithImpl(this._self, this._then);

  final _PhoneRegisterRequest _self;
  final $Res Function(_PhoneRegisterRequest) _then;

/// Create a copy of PhoneRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastName = null,Object? firstName = null,Object? verificationToken = null,Object? email = freezed,Object? phone = freezed,Object? countryCode = freezed,}) {
  return _then(_PhoneRegisterRequest(
lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,verificationToken: null == verificationToken ? _self.verificationToken : verificationToken // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
