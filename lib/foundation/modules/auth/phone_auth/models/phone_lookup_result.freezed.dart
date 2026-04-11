// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_lookup_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhoneLookupResult {

/// Whether the OTP was verified.
 bool get verified;/// Whether the user has an account.
 bool get hasAccount;/// Present when [hasAccount] is true.
/// Use to call POST /auth/login or POST /auth/register with the token.
 String? get phoneGrantToken;/// The phone number that was verified.
 String? get phoneNumber;
/// Create a copy of PhoneLookupResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneLookupResultCopyWith<PhoneLookupResult> get copyWith => _$PhoneLookupResultCopyWithImpl<PhoneLookupResult>(this as PhoneLookupResult, _$identity);

  /// Serializes this PhoneLookupResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneLookupResult&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.hasAccount, hasAccount) || other.hasAccount == hasAccount)&&(identical(other.phoneGrantToken, phoneGrantToken) || other.phoneGrantToken == phoneGrantToken)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verified,hasAccount,phoneGrantToken,phoneNumber);

@override
String toString() {
  return 'PhoneLookupResult(verified: $verified, hasAccount: $hasAccount, phoneGrantToken: $phoneGrantToken, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $PhoneLookupResultCopyWith<$Res>  {
  factory $PhoneLookupResultCopyWith(PhoneLookupResult value, $Res Function(PhoneLookupResult) _then) = _$PhoneLookupResultCopyWithImpl;
@useResult
$Res call({
 bool verified, bool hasAccount, String? phoneGrantToken, String? phoneNumber
});




}
/// @nodoc
class _$PhoneLookupResultCopyWithImpl<$Res>
    implements $PhoneLookupResultCopyWith<$Res> {
  _$PhoneLookupResultCopyWithImpl(this._self, this._then);

  final PhoneLookupResult _self;
  final $Res Function(PhoneLookupResult) _then;

/// Create a copy of PhoneLookupResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verified = null,Object? hasAccount = null,Object? phoneGrantToken = freezed,Object? phoneNumber = freezed,}) {
  return _then(_self.copyWith(
verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,hasAccount: null == hasAccount ? _self.hasAccount : hasAccount // ignore: cast_nullable_to_non_nullable
as bool,phoneGrantToken: freezed == phoneGrantToken ? _self.phoneGrantToken : phoneGrantToken // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneLookupResult].
extension PhoneLookupResultPatterns on PhoneLookupResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneLookupResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneLookupResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneLookupResult value)  $default,){
final _that = this;
switch (_that) {
case _PhoneLookupResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneLookupResult value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneLookupResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool verified,  bool hasAccount,  String? phoneGrantToken,  String? phoneNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneLookupResult() when $default != null:
return $default(_that.verified,_that.hasAccount,_that.phoneGrantToken,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool verified,  bool hasAccount,  String? phoneGrantToken,  String? phoneNumber)  $default,) {final _that = this;
switch (_that) {
case _PhoneLookupResult():
return $default(_that.verified,_that.hasAccount,_that.phoneGrantToken,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool verified,  bool hasAccount,  String? phoneGrantToken,  String? phoneNumber)?  $default,) {final _that = this;
switch (_that) {
case _PhoneLookupResult() when $default != null:
return $default(_that.verified,_that.hasAccount,_that.phoneGrantToken,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhoneLookupResult implements PhoneLookupResult {
  const _PhoneLookupResult({required this.verified, required this.hasAccount, this.phoneGrantToken, this.phoneNumber});
  factory _PhoneLookupResult.fromJson(Map<String, dynamic> json) => _$PhoneLookupResultFromJson(json);

/// Whether the OTP was verified.
@override final  bool verified;
/// Whether the user has an account.
@override final  bool hasAccount;
/// Present when [hasAccount] is true.
/// Use to call POST /auth/login or POST /auth/register with the token.
@override final  String? phoneGrantToken;
/// The phone number that was verified.
@override final  String? phoneNumber;

/// Create a copy of PhoneLookupResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneLookupResultCopyWith<_PhoneLookupResult> get copyWith => __$PhoneLookupResultCopyWithImpl<_PhoneLookupResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhoneLookupResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneLookupResult&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.hasAccount, hasAccount) || other.hasAccount == hasAccount)&&(identical(other.phoneGrantToken, phoneGrantToken) || other.phoneGrantToken == phoneGrantToken)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verified,hasAccount,phoneGrantToken,phoneNumber);

@override
String toString() {
  return 'PhoneLookupResult(verified: $verified, hasAccount: $hasAccount, phoneGrantToken: $phoneGrantToken, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$PhoneLookupResultCopyWith<$Res> implements $PhoneLookupResultCopyWith<$Res> {
  factory _$PhoneLookupResultCopyWith(_PhoneLookupResult value, $Res Function(_PhoneLookupResult) _then) = __$PhoneLookupResultCopyWithImpl;
@override @useResult
$Res call({
 bool verified, bool hasAccount, String? phoneGrantToken, String? phoneNumber
});




}
/// @nodoc
class __$PhoneLookupResultCopyWithImpl<$Res>
    implements _$PhoneLookupResultCopyWith<$Res> {
  __$PhoneLookupResultCopyWithImpl(this._self, this._then);

  final _PhoneLookupResult _self;
  final $Res Function(_PhoneLookupResult) _then;

/// Create a copy of PhoneLookupResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verified = null,Object? hasAccount = null,Object? phoneGrantToken = freezed,Object? phoneNumber = freezed,}) {
  return _then(_PhoneLookupResult(
verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,hasAccount: null == hasAccount ? _self.hasAccount : hasAccount // ignore: cast_nullable_to_non_nullable
as bool,phoneGrantToken: freezed == phoneGrantToken ? _self.phoneGrantToken : phoneGrantToken // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
