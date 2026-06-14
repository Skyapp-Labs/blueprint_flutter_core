// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_step_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OtpStepState {

 String? get otp; String? get resendToken; String? get verificationId; bool get isLoading; String? get error;
/// Create a copy of OtpStepState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpStepStateCopyWith<OtpStepState> get copyWith => _$OtpStepStateCopyWithImpl<OtpStepState>(this as OtpStepState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpStepState&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.resendToken, resendToken) || other.resendToken == resendToken)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,otp,resendToken,verificationId,isLoading,error);

@override
String toString() {
  return 'OtpStepState(otp: $otp, resendToken: $resendToken, verificationId: $verificationId, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $OtpStepStateCopyWith<$Res>  {
  factory $OtpStepStateCopyWith(OtpStepState value, $Res Function(OtpStepState) _then) = _$OtpStepStateCopyWithImpl;
@useResult
$Res call({
 String? otp, String? resendToken, String? verificationId, bool isLoading, String? error
});




}
/// @nodoc
class _$OtpStepStateCopyWithImpl<$Res>
    implements $OtpStepStateCopyWith<$Res> {
  _$OtpStepStateCopyWithImpl(this._self, this._then);

  final OtpStepState _self;
  final $Res Function(OtpStepState) _then;

/// Create a copy of OtpStepState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otp = freezed,Object? resendToken = freezed,Object? verificationId = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
otp: freezed == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String?,resendToken: freezed == resendToken ? _self.resendToken : resendToken // ignore: cast_nullable_to_non_nullable
as String?,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpStepState].
extension OtpStepStatePatterns on OtpStepState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpStepState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpStepState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpStepState value)  $default,){
final _that = this;
switch (_that) {
case _OtpStepState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpStepState value)?  $default,){
final _that = this;
switch (_that) {
case _OtpStepState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? otp,  String? resendToken,  String? verificationId,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpStepState() when $default != null:
return $default(_that.otp,_that.resendToken,_that.verificationId,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? otp,  String? resendToken,  String? verificationId,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _OtpStepState():
return $default(_that.otp,_that.resendToken,_that.verificationId,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? otp,  String? resendToken,  String? verificationId,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _OtpStepState() when $default != null:
return $default(_that.otp,_that.resendToken,_that.verificationId,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _OtpStepState implements OtpStepState {
  const _OtpStepState({this.otp, this.resendToken, this.verificationId, this.isLoading = false, this.error});
  

@override final  String? otp;
@override final  String? resendToken;
@override final  String? verificationId;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of OtpStepState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpStepStateCopyWith<_OtpStepState> get copyWith => __$OtpStepStateCopyWithImpl<_OtpStepState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpStepState&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.resendToken, resendToken) || other.resendToken == resendToken)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,otp,resendToken,verificationId,isLoading,error);

@override
String toString() {
  return 'OtpStepState(otp: $otp, resendToken: $resendToken, verificationId: $verificationId, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$OtpStepStateCopyWith<$Res> implements $OtpStepStateCopyWith<$Res> {
  factory _$OtpStepStateCopyWith(_OtpStepState value, $Res Function(_OtpStepState) _then) = __$OtpStepStateCopyWithImpl;
@override @useResult
$Res call({
 String? otp, String? resendToken, String? verificationId, bool isLoading, String? error
});




}
/// @nodoc
class __$OtpStepStateCopyWithImpl<$Res>
    implements _$OtpStepStateCopyWith<$Res> {
  __$OtpStepStateCopyWithImpl(this._self, this._then);

  final _OtpStepState _self;
  final $Res Function(_OtpStepState) _then;

/// Create a copy of OtpStepState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otp = freezed,Object? resendToken = freezed,Object? verificationId = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_OtpStepState(
otp: freezed == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String?,resendToken: freezed == resendToken ? _self.resendToken : resendToken // ignore: cast_nullable_to_non_nullable
as String?,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
