// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordFlowState {

 ForgotPasswordStep get step;/// The email entered in step 1, carried into step 2 for display.
 String? get email;/// The reset token received after pin verification, used in step 3.
 String? get resetToken; bool get isLoading; String? get error;
/// Create a copy of ForgotPasswordFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordFlowStateCopyWith<ForgotPasswordFlowState> get copyWith => _$ForgotPasswordFlowStateCopyWithImpl<ForgotPasswordFlowState>(this as ForgotPasswordFlowState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordFlowState&&(identical(other.step, step) || other.step == step)&&(identical(other.email, email) || other.email == email)&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,step,email,resetToken,isLoading,error);

@override
String toString() {
  return 'ForgotPasswordFlowState(step: $step, email: $email, resetToken: $resetToken, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordFlowStateCopyWith<$Res>  {
  factory $ForgotPasswordFlowStateCopyWith(ForgotPasswordFlowState value, $Res Function(ForgotPasswordFlowState) _then) = _$ForgotPasswordFlowStateCopyWithImpl;
@useResult
$Res call({
 ForgotPasswordStep step, String? email, String? resetToken, bool isLoading, String? error
});




}
/// @nodoc
class _$ForgotPasswordFlowStateCopyWithImpl<$Res>
    implements $ForgotPasswordFlowStateCopyWith<$Res> {
  _$ForgotPasswordFlowStateCopyWithImpl(this._self, this._then);

  final ForgotPasswordFlowState _self;
  final $Res Function(ForgotPasswordFlowState) _then;

/// Create a copy of ForgotPasswordFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? email = freezed,Object? resetToken = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as ForgotPasswordStep,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,resetToken: freezed == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordFlowState].
extension ForgotPasswordFlowStatePatterns on ForgotPasswordFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPasswordFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPasswordFlowState value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPasswordFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ForgotPasswordStep step,  String? email,  String? resetToken,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPasswordFlowState() when $default != null:
return $default(_that.step,_that.email,_that.resetToken,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ForgotPasswordStep step,  String? email,  String? resetToken,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordFlowState():
return $default(_that.step,_that.email,_that.resetToken,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ForgotPasswordStep step,  String? email,  String? resetToken,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordFlowState() when $default != null:
return $default(_that.step,_that.email,_that.resetToken,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ForgotPasswordFlowState implements ForgotPasswordFlowState {
  const _ForgotPasswordFlowState({this.step = ForgotPasswordStep.enterEmail, this.email, this.resetToken, this.isLoading = false, this.error});
  

@override@JsonKey() final  ForgotPasswordStep step;
/// The email entered in step 1, carried into step 2 for display.
@override final  String? email;
/// The reset token received after pin verification, used in step 3.
@override final  String? resetToken;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ForgotPasswordFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordFlowStateCopyWith<_ForgotPasswordFlowState> get copyWith => __$ForgotPasswordFlowStateCopyWithImpl<_ForgotPasswordFlowState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordFlowState&&(identical(other.step, step) || other.step == step)&&(identical(other.email, email) || other.email == email)&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,step,email,resetToken,isLoading,error);

@override
String toString() {
  return 'ForgotPasswordFlowState(step: $step, email: $email, resetToken: $resetToken, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordFlowStateCopyWith<$Res> implements $ForgotPasswordFlowStateCopyWith<$Res> {
  factory _$ForgotPasswordFlowStateCopyWith(_ForgotPasswordFlowState value, $Res Function(_ForgotPasswordFlowState) _then) = __$ForgotPasswordFlowStateCopyWithImpl;
@override @useResult
$Res call({
 ForgotPasswordStep step, String? email, String? resetToken, bool isLoading, String? error
});




}
/// @nodoc
class __$ForgotPasswordFlowStateCopyWithImpl<$Res>
    implements _$ForgotPasswordFlowStateCopyWith<$Res> {
  __$ForgotPasswordFlowStateCopyWithImpl(this._self, this._then);

  final _ForgotPasswordFlowState _self;
  final $Res Function(_ForgotPasswordFlowState) _then;

/// Create a copy of ForgotPasswordFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? email = freezed,Object? resetToken = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ForgotPasswordFlowState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as ForgotPasswordStep,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,resetToken: freezed == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
