// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SecurityState {

 String? get pin; String? get confirmPin; PinStepView? get stepView; int get pinLength; bool get isLoading; bool get isSessionUnlocked; String get pinType; String? get error;
/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecurityStateCopyWith<SecurityState> get copyWith => _$SecurityStateCopyWithImpl<SecurityState>(this as SecurityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecurityState&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.confirmPin, confirmPin) || other.confirmPin == confirmPin)&&(identical(other.stepView, stepView) || other.stepView == stepView)&&(identical(other.pinLength, pinLength) || other.pinLength == pinLength)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSessionUnlocked, isSessionUnlocked) || other.isSessionUnlocked == isSessionUnlocked)&&(identical(other.pinType, pinType) || other.pinType == pinType)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,pin,confirmPin,stepView,pinLength,isLoading,isSessionUnlocked,pinType,error);

@override
String toString() {
  return 'SecurityState(pin: $pin, confirmPin: $confirmPin, stepView: $stepView, pinLength: $pinLength, isLoading: $isLoading, isSessionUnlocked: $isSessionUnlocked, pinType: $pinType, error: $error)';
}


}

/// @nodoc
abstract mixin class $SecurityStateCopyWith<$Res>  {
  factory $SecurityStateCopyWith(SecurityState value, $Res Function(SecurityState) _then) = _$SecurityStateCopyWithImpl;
@useResult
$Res call({
 String? pin, String? confirmPin, PinStepView? stepView, int pinLength, bool isLoading, bool isSessionUnlocked, String pinType, String? error
});




}
/// @nodoc
class _$SecurityStateCopyWithImpl<$Res>
    implements $SecurityStateCopyWith<$Res> {
  _$SecurityStateCopyWithImpl(this._self, this._then);

  final SecurityState _self;
  final $Res Function(SecurityState) _then;

/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pin = freezed,Object? confirmPin = freezed,Object? stepView = freezed,Object? pinLength = null,Object? isLoading = null,Object? isSessionUnlocked = null,Object? pinType = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
pin: freezed == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String?,confirmPin: freezed == confirmPin ? _self.confirmPin : confirmPin // ignore: cast_nullable_to_non_nullable
as String?,stepView: freezed == stepView ? _self.stepView : stepView // ignore: cast_nullable_to_non_nullable
as PinStepView?,pinLength: null == pinLength ? _self.pinLength : pinLength // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSessionUnlocked: null == isSessionUnlocked ? _self.isSessionUnlocked : isSessionUnlocked // ignore: cast_nullable_to_non_nullable
as bool,pinType: null == pinType ? _self.pinType : pinType // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SecurityState].
extension SecurityStatePatterns on SecurityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecurityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecurityState value)  $default,){
final _that = this;
switch (_that) {
case _SecurityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecurityState value)?  $default,){
final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? pin,  String? confirmPin,  PinStepView? stepView,  int pinLength,  bool isLoading,  bool isSessionUnlocked,  String pinType,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
return $default(_that.pin,_that.confirmPin,_that.stepView,_that.pinLength,_that.isLoading,_that.isSessionUnlocked,_that.pinType,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? pin,  String? confirmPin,  PinStepView? stepView,  int pinLength,  bool isLoading,  bool isSessionUnlocked,  String pinType,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SecurityState():
return $default(_that.pin,_that.confirmPin,_that.stepView,_that.pinLength,_that.isLoading,_that.isSessionUnlocked,_that.pinType,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? pin,  String? confirmPin,  PinStepView? stepView,  int pinLength,  bool isLoading,  bool isSessionUnlocked,  String pinType,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
return $default(_that.pin,_that.confirmPin,_that.stepView,_that.pinLength,_that.isLoading,_that.isSessionUnlocked,_that.pinType,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SecurityState implements SecurityState {
  const _SecurityState({this.pin, this.confirmPin, this.stepView, this.pinLength = 4, this.isLoading = false, this.isSessionUnlocked = false, this.pinType = 'authentication', this.error});
  

@override final  String? pin;
@override final  String? confirmPin;
@override final  PinStepView? stepView;
@override@JsonKey() final  int pinLength;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSessionUnlocked;
@override@JsonKey() final  String pinType;
@override final  String? error;

/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecurityStateCopyWith<_SecurityState> get copyWith => __$SecurityStateCopyWithImpl<_SecurityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecurityState&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.confirmPin, confirmPin) || other.confirmPin == confirmPin)&&(identical(other.stepView, stepView) || other.stepView == stepView)&&(identical(other.pinLength, pinLength) || other.pinLength == pinLength)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSessionUnlocked, isSessionUnlocked) || other.isSessionUnlocked == isSessionUnlocked)&&(identical(other.pinType, pinType) || other.pinType == pinType)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,pin,confirmPin,stepView,pinLength,isLoading,isSessionUnlocked,pinType,error);

@override
String toString() {
  return 'SecurityState(pin: $pin, confirmPin: $confirmPin, stepView: $stepView, pinLength: $pinLength, isLoading: $isLoading, isSessionUnlocked: $isSessionUnlocked, pinType: $pinType, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SecurityStateCopyWith<$Res> implements $SecurityStateCopyWith<$Res> {
  factory _$SecurityStateCopyWith(_SecurityState value, $Res Function(_SecurityState) _then) = __$SecurityStateCopyWithImpl;
@override @useResult
$Res call({
 String? pin, String? confirmPin, PinStepView? stepView, int pinLength, bool isLoading, bool isSessionUnlocked, String pinType, String? error
});




}
/// @nodoc
class __$SecurityStateCopyWithImpl<$Res>
    implements _$SecurityStateCopyWith<$Res> {
  __$SecurityStateCopyWithImpl(this._self, this._then);

  final _SecurityState _self;
  final $Res Function(_SecurityState) _then;

/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pin = freezed,Object? confirmPin = freezed,Object? stepView = freezed,Object? pinLength = null,Object? isLoading = null,Object? isSessionUnlocked = null,Object? pinType = null,Object? error = freezed,}) {
  return _then(_SecurityState(
pin: freezed == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String?,confirmPin: freezed == confirmPin ? _self.confirmPin : confirmPin // ignore: cast_nullable_to_non_nullable
as String?,stepView: freezed == stepView ? _self.stepView : stepView // ignore: cast_nullable_to_non_nullable
as PinStepView?,pinLength: null == pinLength ? _self.pinLength : pinLength // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSessionUnlocked: null == isSessionUnlocked ? _self.isSessionUnlocked : isSessionUnlocked // ignore: cast_nullable_to_non_nullable
as bool,pinType: null == pinType ? _self.pinType : pinType // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
