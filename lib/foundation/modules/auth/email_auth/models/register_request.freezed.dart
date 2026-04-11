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
mixin _$EmailRegisterRequest {

 String get firstName; String get lastName; String get email; String get password; String? get phone; String? get countryCode;
/// Create a copy of EmailRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailRegisterRequestCopyWith<EmailRegisterRequest> get copyWith => _$EmailRegisterRequestCopyWithImpl<EmailRegisterRequest>(this as EmailRegisterRequest, _$identity);

  /// Serializes this EmailRegisterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailRegisterRequest&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,password,phone,countryCode);

@override
String toString() {
  return 'EmailRegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, phone: $phone, countryCode: $countryCode)';
}


}

/// @nodoc
abstract mixin class $EmailRegisterRequestCopyWith<$Res>  {
  factory $EmailRegisterRequestCopyWith(EmailRegisterRequest value, $Res Function(EmailRegisterRequest) _then) = _$EmailRegisterRequestCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String email, String password, String? phone, String? countryCode
});




}
/// @nodoc
class _$EmailRegisterRequestCopyWithImpl<$Res>
    implements $EmailRegisterRequestCopyWith<$Res> {
  _$EmailRegisterRequestCopyWithImpl(this._self, this._then);

  final EmailRegisterRequest _self;
  final $Res Function(EmailRegisterRequest) _then;

/// Create a copy of EmailRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? password = null,Object? phone = freezed,Object? countryCode = freezed,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailRegisterRequest].
extension EmailRegisterRequestPatterns on EmailRegisterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailRegisterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailRegisterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailRegisterRequest value)  $default,){
final _that = this;
switch (_that) {
case _EmailRegisterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailRegisterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EmailRegisterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String password,  String? phone,  String? countryCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailRegisterRequest() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.password,_that.phone,_that.countryCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String password,  String? phone,  String? countryCode)  $default,) {final _that = this;
switch (_that) {
case _EmailRegisterRequest():
return $default(_that.firstName,_that.lastName,_that.email,_that.password,_that.phone,_that.countryCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String email,  String password,  String? phone,  String? countryCode)?  $default,) {final _that = this;
switch (_that) {
case _EmailRegisterRequest() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.password,_that.phone,_that.countryCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailRegisterRequest implements EmailRegisterRequest {
  const _EmailRegisterRequest({required this.firstName, required this.lastName, required this.email, required this.password, this.phone, this.countryCode});
  factory _EmailRegisterRequest.fromJson(Map<String, dynamic> json) => _$EmailRegisterRequestFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  String email;
@override final  String password;
@override final  String? phone;
@override final  String? countryCode;

/// Create a copy of EmailRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailRegisterRequestCopyWith<_EmailRegisterRequest> get copyWith => __$EmailRegisterRequestCopyWithImpl<_EmailRegisterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailRegisterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailRegisterRequest&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,password,phone,countryCode);

@override
String toString() {
  return 'EmailRegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, phone: $phone, countryCode: $countryCode)';
}


}

/// @nodoc
abstract mixin class _$EmailRegisterRequestCopyWith<$Res> implements $EmailRegisterRequestCopyWith<$Res> {
  factory _$EmailRegisterRequestCopyWith(_EmailRegisterRequest value, $Res Function(_EmailRegisterRequest) _then) = __$EmailRegisterRequestCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String email, String password, String? phone, String? countryCode
});




}
/// @nodoc
class __$EmailRegisterRequestCopyWithImpl<$Res>
    implements _$EmailRegisterRequestCopyWith<$Res> {
  __$EmailRegisterRequestCopyWithImpl(this._self, this._then);

  final _EmailRegisterRequest _self;
  final $Res Function(_EmailRegisterRequest) _then;

/// Create a copy of EmailRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? password = null,Object? phone = freezed,Object? countryCode = freezed,}) {
  return _then(_EmailRegisterRequest(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
