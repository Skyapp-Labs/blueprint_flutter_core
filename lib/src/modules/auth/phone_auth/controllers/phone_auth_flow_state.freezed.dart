// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_auth_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhoneAuthFlowState {

 String? get phone; FxPhoneAuthStep get step; OtpData? get otpData; PhoneLookupResult? get lookupResult;
/// Create a copy of PhoneAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneAuthFlowStateCopyWith<PhoneAuthFlowState> get copyWith => _$PhoneAuthFlowStateCopyWithImpl<PhoneAuthFlowState>(this as PhoneAuthFlowState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneAuthFlowState&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.step, step) || other.step == step)&&(identical(other.otpData, otpData) || other.otpData == otpData)&&(identical(other.lookupResult, lookupResult) || other.lookupResult == lookupResult));
}


@override
int get hashCode => Object.hash(runtimeType,phone,step,otpData,lookupResult);

@override
String toString() {
  return 'PhoneAuthFlowState(phone: $phone, step: $step, otpData: $otpData, lookupResult: $lookupResult)';
}


}

/// @nodoc
abstract mixin class $PhoneAuthFlowStateCopyWith<$Res>  {
  factory $PhoneAuthFlowStateCopyWith(PhoneAuthFlowState value, $Res Function(PhoneAuthFlowState) _then) = _$PhoneAuthFlowStateCopyWithImpl;
@useResult
$Res call({
 String? phone, FxPhoneAuthStep step, OtpData? otpData, PhoneLookupResult? lookupResult
});


$OtpDataCopyWith<$Res>? get otpData;$PhoneLookupResultCopyWith<$Res>? get lookupResult;

}
/// @nodoc
class _$PhoneAuthFlowStateCopyWithImpl<$Res>
    implements $PhoneAuthFlowStateCopyWith<$Res> {
  _$PhoneAuthFlowStateCopyWithImpl(this._self, this._then);

  final PhoneAuthFlowState _self;
  final $Res Function(PhoneAuthFlowState) _then;

/// Create a copy of PhoneAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = freezed,Object? step = null,Object? otpData = freezed,Object? lookupResult = freezed,}) {
  return _then(_self.copyWith(
phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as FxPhoneAuthStep,otpData: freezed == otpData ? _self.otpData : otpData // ignore: cast_nullable_to_non_nullable
as OtpData?,lookupResult: freezed == lookupResult ? _self.lookupResult : lookupResult // ignore: cast_nullable_to_non_nullable
as PhoneLookupResult?,
  ));
}
/// Create a copy of PhoneAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtpDataCopyWith<$Res>? get otpData {
    if (_self.otpData == null) {
    return null;
  }

  return $OtpDataCopyWith<$Res>(_self.otpData!, (value) {
    return _then(_self.copyWith(otpData: value));
  });
}/// Create a copy of PhoneAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhoneLookupResultCopyWith<$Res>? get lookupResult {
    if (_self.lookupResult == null) {
    return null;
  }

  return $PhoneLookupResultCopyWith<$Res>(_self.lookupResult!, (value) {
    return _then(_self.copyWith(lookupResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [PhoneAuthFlowState].
extension PhoneAuthFlowStatePatterns on PhoneAuthFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneAuthFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneAuthFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneAuthFlowState value)  $default,){
final _that = this;
switch (_that) {
case _PhoneAuthFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneAuthFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneAuthFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? phone,  FxPhoneAuthStep step,  OtpData? otpData,  PhoneLookupResult? lookupResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneAuthFlowState() when $default != null:
return $default(_that.phone,_that.step,_that.otpData,_that.lookupResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? phone,  FxPhoneAuthStep step,  OtpData? otpData,  PhoneLookupResult? lookupResult)  $default,) {final _that = this;
switch (_that) {
case _PhoneAuthFlowState():
return $default(_that.phone,_that.step,_that.otpData,_that.lookupResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? phone,  FxPhoneAuthStep step,  OtpData? otpData,  PhoneLookupResult? lookupResult)?  $default,) {final _that = this;
switch (_that) {
case _PhoneAuthFlowState() when $default != null:
return $default(_that.phone,_that.step,_that.otpData,_that.lookupResult);case _:
  return null;

}
}

}

/// @nodoc


class _PhoneAuthFlowState implements PhoneAuthFlowState {
  const _PhoneAuthFlowState({this.phone, this.step = FxPhoneAuthStep.enterPhone, this.otpData, this.lookupResult});
  

@override final  String? phone;
@override@JsonKey() final  FxPhoneAuthStep step;
@override final  OtpData? otpData;
@override final  PhoneLookupResult? lookupResult;

/// Create a copy of PhoneAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneAuthFlowStateCopyWith<_PhoneAuthFlowState> get copyWith => __$PhoneAuthFlowStateCopyWithImpl<_PhoneAuthFlowState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneAuthFlowState&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.step, step) || other.step == step)&&(identical(other.otpData, otpData) || other.otpData == otpData)&&(identical(other.lookupResult, lookupResult) || other.lookupResult == lookupResult));
}


@override
int get hashCode => Object.hash(runtimeType,phone,step,otpData,lookupResult);

@override
String toString() {
  return 'PhoneAuthFlowState(phone: $phone, step: $step, otpData: $otpData, lookupResult: $lookupResult)';
}


}

/// @nodoc
abstract mixin class _$PhoneAuthFlowStateCopyWith<$Res> implements $PhoneAuthFlowStateCopyWith<$Res> {
  factory _$PhoneAuthFlowStateCopyWith(_PhoneAuthFlowState value, $Res Function(_PhoneAuthFlowState) _then) = __$PhoneAuthFlowStateCopyWithImpl;
@override @useResult
$Res call({
 String? phone, FxPhoneAuthStep step, OtpData? otpData, PhoneLookupResult? lookupResult
});


@override $OtpDataCopyWith<$Res>? get otpData;@override $PhoneLookupResultCopyWith<$Res>? get lookupResult;

}
/// @nodoc
class __$PhoneAuthFlowStateCopyWithImpl<$Res>
    implements _$PhoneAuthFlowStateCopyWith<$Res> {
  __$PhoneAuthFlowStateCopyWithImpl(this._self, this._then);

  final _PhoneAuthFlowState _self;
  final $Res Function(_PhoneAuthFlowState) _then;

/// Create a copy of PhoneAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = freezed,Object? step = null,Object? otpData = freezed,Object? lookupResult = freezed,}) {
  return _then(_PhoneAuthFlowState(
phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as FxPhoneAuthStep,otpData: freezed == otpData ? _self.otpData : otpData // ignore: cast_nullable_to_non_nullable
as OtpData?,lookupResult: freezed == lookupResult ? _self.lookupResult : lookupResult // ignore: cast_nullable_to_non_nullable
as PhoneLookupResult?,
  ));
}

/// Create a copy of PhoneAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtpDataCopyWith<$Res>? get otpData {
    if (_self.otpData == null) {
    return null;
  }

  return $OtpDataCopyWith<$Res>(_self.otpData!, (value) {
    return _then(_self.copyWith(otpData: value));
  });
}/// Create a copy of PhoneAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhoneLookupResultCopyWith<$Res>? get lookupResult {
    if (_self.lookupResult == null) {
    return null;
  }

  return $PhoneLookupResultCopyWith<$Res>(_self.lookupResult!, (value) {
    return _then(_self.copyWith(lookupResult: value));
  });
}
}

// dart format on
