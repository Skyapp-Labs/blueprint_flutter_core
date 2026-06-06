// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFlowState {

 AuthFlowType get type; AuthStep get step; AuthStep? get previousStep; String? get phone; String? get email; String? get countryCode; String? get formattedPhone; SendOtpResponse? get sendOtpResponse; VerifyOtpResponse? get verifyOtpResponse;
/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFlowStateCopyWith<AuthFlowState> get copyWith => _$AuthFlowStateCopyWithImpl<AuthFlowState>(this as AuthFlowState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFlowState&&(identical(other.type, type) || other.type == type)&&(identical(other.step, step) || other.step == step)&&(identical(other.previousStep, previousStep) || other.previousStep == previousStep)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.formattedPhone, formattedPhone) || other.formattedPhone == formattedPhone)&&(identical(other.sendOtpResponse, sendOtpResponse) || other.sendOtpResponse == sendOtpResponse)&&(identical(other.verifyOtpResponse, verifyOtpResponse) || other.verifyOtpResponse == verifyOtpResponse));
}


@override
int get hashCode => Object.hash(runtimeType,type,step,previousStep,phone,email,countryCode,formattedPhone,sendOtpResponse,verifyOtpResponse);

@override
String toString() {
  return 'AuthFlowState(type: $type, step: $step, previousStep: $previousStep, phone: $phone, email: $email, countryCode: $countryCode, formattedPhone: $formattedPhone, sendOtpResponse: $sendOtpResponse, verifyOtpResponse: $verifyOtpResponse)';
}


}

/// @nodoc
abstract mixin class $AuthFlowStateCopyWith<$Res>  {
  factory $AuthFlowStateCopyWith(AuthFlowState value, $Res Function(AuthFlowState) _then) = _$AuthFlowStateCopyWithImpl;
@useResult
$Res call({
 AuthFlowType type, AuthStep step, AuthStep? previousStep, String? phone, String? email, String? countryCode, String? formattedPhone, SendOtpResponse? sendOtpResponse, VerifyOtpResponse? verifyOtpResponse
});


$SendOtpResponseCopyWith<$Res>? get sendOtpResponse;$VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse;

}
/// @nodoc
class _$AuthFlowStateCopyWithImpl<$Res>
    implements $AuthFlowStateCopyWith<$Res> {
  _$AuthFlowStateCopyWithImpl(this._self, this._then);

  final AuthFlowState _self;
  final $Res Function(AuthFlowState) _then;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? step = null,Object? previousStep = freezed,Object? phone = freezed,Object? email = freezed,Object? countryCode = freezed,Object? formattedPhone = freezed,Object? sendOtpResponse = freezed,Object? verifyOtpResponse = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AuthFlowType,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as AuthStep,previousStep: freezed == previousStep ? _self.previousStep : previousStep // ignore: cast_nullable_to_non_nullable
as AuthStep?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,formattedPhone: freezed == formattedPhone ? _self.formattedPhone : formattedPhone // ignore: cast_nullable_to_non_nullable
as String?,sendOtpResponse: freezed == sendOtpResponse ? _self.sendOtpResponse : sendOtpResponse // ignore: cast_nullable_to_non_nullable
as SendOtpResponse?,verifyOtpResponse: freezed == verifyOtpResponse ? _self.verifyOtpResponse : verifyOtpResponse // ignore: cast_nullable_to_non_nullable
as VerifyOtpResponse?,
  ));
}
/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SendOtpResponseCopyWith<$Res>? get sendOtpResponse {
    if (_self.sendOtpResponse == null) {
    return null;
  }

  return $SendOtpResponseCopyWith<$Res>(_self.sendOtpResponse!, (value) {
    return _then(_self.copyWith(sendOtpResponse: value));
  });
}/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse {
    if (_self.verifyOtpResponse == null) {
    return null;
  }

  return $VerifyOtpResponseCopyWith<$Res>(_self.verifyOtpResponse!, (value) {
    return _then(_self.copyWith(verifyOtpResponse: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthFlowState].
extension AuthFlowStatePatterns on AuthFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthFlowState value)  $default,){
final _that = this;
switch (_that) {
case _AuthFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthFlowType type,  AuthStep step,  AuthStep? previousStep,  String? phone,  String? email,  String? countryCode,  String? formattedPhone,  SendOtpResponse? sendOtpResponse,  VerifyOtpResponse? verifyOtpResponse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
return $default(_that.type,_that.step,_that.previousStep,_that.phone,_that.email,_that.countryCode,_that.formattedPhone,_that.sendOtpResponse,_that.verifyOtpResponse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthFlowType type,  AuthStep step,  AuthStep? previousStep,  String? phone,  String? email,  String? countryCode,  String? formattedPhone,  SendOtpResponse? sendOtpResponse,  VerifyOtpResponse? verifyOtpResponse)  $default,) {final _that = this;
switch (_that) {
case _AuthFlowState():
return $default(_that.type,_that.step,_that.previousStep,_that.phone,_that.email,_that.countryCode,_that.formattedPhone,_that.sendOtpResponse,_that.verifyOtpResponse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthFlowType type,  AuthStep step,  AuthStep? previousStep,  String? phone,  String? email,  String? countryCode,  String? formattedPhone,  SendOtpResponse? sendOtpResponse,  VerifyOtpResponse? verifyOtpResponse)?  $default,) {final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
return $default(_that.type,_that.step,_that.previousStep,_that.phone,_that.email,_that.countryCode,_that.formattedPhone,_that.sendOtpResponse,_that.verifyOtpResponse);case _:
  return null;

}
}

}

/// @nodoc


class _AuthFlowState implements AuthFlowState {
  const _AuthFlowState({this.type = AuthFlowType.login, this.step = AuthStep.emailAndPassword, this.previousStep = null, this.phone, this.email, this.countryCode, this.formattedPhone, this.sendOtpResponse, this.verifyOtpResponse});
  

@override@JsonKey() final  AuthFlowType type;
@override@JsonKey() final  AuthStep step;
@override@JsonKey() final  AuthStep? previousStep;
@override final  String? phone;
@override final  String? email;
@override final  String? countryCode;
@override final  String? formattedPhone;
@override final  SendOtpResponse? sendOtpResponse;
@override final  VerifyOtpResponse? verifyOtpResponse;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFlowStateCopyWith<_AuthFlowState> get copyWith => __$AuthFlowStateCopyWithImpl<_AuthFlowState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFlowState&&(identical(other.type, type) || other.type == type)&&(identical(other.step, step) || other.step == step)&&(identical(other.previousStep, previousStep) || other.previousStep == previousStep)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.formattedPhone, formattedPhone) || other.formattedPhone == formattedPhone)&&(identical(other.sendOtpResponse, sendOtpResponse) || other.sendOtpResponse == sendOtpResponse)&&(identical(other.verifyOtpResponse, verifyOtpResponse) || other.verifyOtpResponse == verifyOtpResponse));
}


@override
int get hashCode => Object.hash(runtimeType,type,step,previousStep,phone,email,countryCode,formattedPhone,sendOtpResponse,verifyOtpResponse);

@override
String toString() {
  return 'AuthFlowState(type: $type, step: $step, previousStep: $previousStep, phone: $phone, email: $email, countryCode: $countryCode, formattedPhone: $formattedPhone, sendOtpResponse: $sendOtpResponse, verifyOtpResponse: $verifyOtpResponse)';
}


}

/// @nodoc
abstract mixin class _$AuthFlowStateCopyWith<$Res> implements $AuthFlowStateCopyWith<$Res> {
  factory _$AuthFlowStateCopyWith(_AuthFlowState value, $Res Function(_AuthFlowState) _then) = __$AuthFlowStateCopyWithImpl;
@override @useResult
$Res call({
 AuthFlowType type, AuthStep step, AuthStep? previousStep, String? phone, String? email, String? countryCode, String? formattedPhone, SendOtpResponse? sendOtpResponse, VerifyOtpResponse? verifyOtpResponse
});


@override $SendOtpResponseCopyWith<$Res>? get sendOtpResponse;@override $VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse;

}
/// @nodoc
class __$AuthFlowStateCopyWithImpl<$Res>
    implements _$AuthFlowStateCopyWith<$Res> {
  __$AuthFlowStateCopyWithImpl(this._self, this._then);

  final _AuthFlowState _self;
  final $Res Function(_AuthFlowState) _then;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? step = null,Object? previousStep = freezed,Object? phone = freezed,Object? email = freezed,Object? countryCode = freezed,Object? formattedPhone = freezed,Object? sendOtpResponse = freezed,Object? verifyOtpResponse = freezed,}) {
  return _then(_AuthFlowState(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AuthFlowType,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as AuthStep,previousStep: freezed == previousStep ? _self.previousStep : previousStep // ignore: cast_nullable_to_non_nullable
as AuthStep?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,formattedPhone: freezed == formattedPhone ? _self.formattedPhone : formattedPhone // ignore: cast_nullable_to_non_nullable
as String?,sendOtpResponse: freezed == sendOtpResponse ? _self.sendOtpResponse : sendOtpResponse // ignore: cast_nullable_to_non_nullable
as SendOtpResponse?,verifyOtpResponse: freezed == verifyOtpResponse ? _self.verifyOtpResponse : verifyOtpResponse // ignore: cast_nullable_to_non_nullable
as VerifyOtpResponse?,
  ));
}

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SendOtpResponseCopyWith<$Res>? get sendOtpResponse {
    if (_self.sendOtpResponse == null) {
    return null;
  }

  return $SendOtpResponseCopyWith<$Res>(_self.sendOtpResponse!, (value) {
    return _then(_self.copyWith(sendOtpResponse: value));
  });
}/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse {
    if (_self.verifyOtpResponse == null) {
    return null;
  }

  return $VerifyOtpResponseCopyWith<$Res>(_self.verifyOtpResponse!, (value) {
    return _then(_self.copyWith(verifyOtpResponse: value));
  });
}
}

// dart format on
