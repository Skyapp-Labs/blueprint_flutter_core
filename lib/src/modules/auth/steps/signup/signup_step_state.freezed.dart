// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_step_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupStepState {

 String? get email; String? get password; String? get firstName; String? get lastName; String? get fullNumber; String? get gender; String? get phone; String? get countryCode; bool get isLoading; String? get error;
/// Create a copy of SignupStepState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStepStateCopyWith<SignupStepState> get copyWith => _$SignupStepStateCopyWithImpl<SignupStepState>(this as SignupStepState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupStepState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullNumber, fullNumber) || other.fullNumber == fullNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,firstName,lastName,fullNumber,gender,phone,countryCode,isLoading,error);

@override
String toString() {
  return 'SignupStepState(email: $email, password: $password, firstName: $firstName, lastName: $lastName, fullNumber: $fullNumber, gender: $gender, phone: $phone, countryCode: $countryCode, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $SignupStepStateCopyWith<$Res>  {
  factory $SignupStepStateCopyWith(SignupStepState value, $Res Function(SignupStepState) _then) = _$SignupStepStateCopyWithImpl;
@useResult
$Res call({
 String? email, String? password, String? firstName, String? lastName, String? fullNumber, String? gender, String? phone, String? countryCode, bool isLoading, String? error
});




}
/// @nodoc
class _$SignupStepStateCopyWithImpl<$Res>
    implements $SignupStepStateCopyWith<$Res> {
  _$SignupStepStateCopyWithImpl(this._self, this._then);

  final SignupStepState _self;
  final $Res Function(SignupStepState) _then;

/// Create a copy of SignupStepState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? password = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullNumber = freezed,Object? gender = freezed,Object? phone = freezed,Object? countryCode = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullNumber: freezed == fullNumber ? _self.fullNumber : fullNumber // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupStepState].
extension SignupStepStatePatterns on SignupStepState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupStepState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupStepState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupStepState value)  $default,){
final _that = this;
switch (_that) {
case _SignupStepState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupStepState value)?  $default,){
final _that = this;
switch (_that) {
case _SignupStepState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  String? password,  String? firstName,  String? lastName,  String? fullNumber,  String? gender,  String? phone,  String? countryCode,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupStepState() when $default != null:
return $default(_that.email,_that.password,_that.firstName,_that.lastName,_that.fullNumber,_that.gender,_that.phone,_that.countryCode,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  String? password,  String? firstName,  String? lastName,  String? fullNumber,  String? gender,  String? phone,  String? countryCode,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SignupStepState():
return $default(_that.email,_that.password,_that.firstName,_that.lastName,_that.fullNumber,_that.gender,_that.phone,_that.countryCode,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  String? password,  String? firstName,  String? lastName,  String? fullNumber,  String? gender,  String? phone,  String? countryCode,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SignupStepState() when $default != null:
return $default(_that.email,_that.password,_that.firstName,_that.lastName,_that.fullNumber,_that.gender,_that.phone,_that.countryCode,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SignupStepState implements SignupStepState {
  const _SignupStepState({this.email, this.password, this.firstName, this.lastName, this.fullNumber, this.gender, this.phone, this.countryCode, this.isLoading = false, this.error});
  

@override final  String? email;
@override final  String? password;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? fullNumber;
@override final  String? gender;
@override final  String? phone;
@override final  String? countryCode;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of SignupStepState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupStepStateCopyWith<_SignupStepState> get copyWith => __$SignupStepStateCopyWithImpl<_SignupStepState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupStepState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullNumber, fullNumber) || other.fullNumber == fullNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,firstName,lastName,fullNumber,gender,phone,countryCode,isLoading,error);

@override
String toString() {
  return 'SignupStepState(email: $email, password: $password, firstName: $firstName, lastName: $lastName, fullNumber: $fullNumber, gender: $gender, phone: $phone, countryCode: $countryCode, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SignupStepStateCopyWith<$Res> implements $SignupStepStateCopyWith<$Res> {
  factory _$SignupStepStateCopyWith(_SignupStepState value, $Res Function(_SignupStepState) _then) = __$SignupStepStateCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? password, String? firstName, String? lastName, String? fullNumber, String? gender, String? phone, String? countryCode, bool isLoading, String? error
});




}
/// @nodoc
class __$SignupStepStateCopyWithImpl<$Res>
    implements _$SignupStepStateCopyWith<$Res> {
  __$SignupStepStateCopyWithImpl(this._self, this._then);

  final _SignupStepState _self;
  final $Res Function(_SignupStepState) _then;

/// Create a copy of SignupStepState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? password = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullNumber = freezed,Object? gender = freezed,Object? phone = freezed,Object? countryCode = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_SignupStepState(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullNumber: freezed == fullNumber ? _self.fullNumber : fullNumber // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
