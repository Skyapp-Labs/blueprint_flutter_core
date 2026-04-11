// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_auth_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmailAuthFlowState {

 String? get email; FxEmailAuthStep get step; bool get isLoading; String? get error;
/// Create a copy of EmailAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailAuthFlowStateCopyWith<EmailAuthFlowState> get copyWith => _$EmailAuthFlowStateCopyWithImpl<EmailAuthFlowState>(this as EmailAuthFlowState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailAuthFlowState&&(identical(other.email, email) || other.email == email)&&(identical(other.step, step) || other.step == step)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,step,isLoading,error);

@override
String toString() {
  return 'EmailAuthFlowState(email: $email, step: $step, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $EmailAuthFlowStateCopyWith<$Res>  {
  factory $EmailAuthFlowStateCopyWith(EmailAuthFlowState value, $Res Function(EmailAuthFlowState) _then) = _$EmailAuthFlowStateCopyWithImpl;
@useResult
$Res call({
 String? email, FxEmailAuthStep step, bool isLoading, String? error
});




}
/// @nodoc
class _$EmailAuthFlowStateCopyWithImpl<$Res>
    implements $EmailAuthFlowStateCopyWith<$Res> {
  _$EmailAuthFlowStateCopyWithImpl(this._self, this._then);

  final EmailAuthFlowState _self;
  final $Res Function(EmailAuthFlowState) _then;

/// Create a copy of EmailAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? step = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as FxEmailAuthStep,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailAuthFlowState].
extension EmailAuthFlowStatePatterns on EmailAuthFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailAuthFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailAuthFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailAuthFlowState value)  $default,){
final _that = this;
switch (_that) {
case _EmailAuthFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailAuthFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _EmailAuthFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  FxEmailAuthStep step,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailAuthFlowState() when $default != null:
return $default(_that.email,_that.step,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  FxEmailAuthStep step,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _EmailAuthFlowState():
return $default(_that.email,_that.step,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  FxEmailAuthStep step,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _EmailAuthFlowState() when $default != null:
return $default(_that.email,_that.step,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _EmailAuthFlowState implements EmailAuthFlowState {
  const _EmailAuthFlowState({this.email, this.step = FxEmailAuthStep.login, this.isLoading = false, this.error});
  

@override final  String? email;
@override@JsonKey() final  FxEmailAuthStep step;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of EmailAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailAuthFlowStateCopyWith<_EmailAuthFlowState> get copyWith => __$EmailAuthFlowStateCopyWithImpl<_EmailAuthFlowState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailAuthFlowState&&(identical(other.email, email) || other.email == email)&&(identical(other.step, step) || other.step == step)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,step,isLoading,error);

@override
String toString() {
  return 'EmailAuthFlowState(email: $email, step: $step, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$EmailAuthFlowStateCopyWith<$Res> implements $EmailAuthFlowStateCopyWith<$Res> {
  factory _$EmailAuthFlowStateCopyWith(_EmailAuthFlowState value, $Res Function(_EmailAuthFlowState) _then) = __$EmailAuthFlowStateCopyWithImpl;
@override @useResult
$Res call({
 String? email, FxEmailAuthStep step, bool isLoading, String? error
});




}
/// @nodoc
class __$EmailAuthFlowStateCopyWithImpl<$Res>
    implements _$EmailAuthFlowStateCopyWith<$Res> {
  __$EmailAuthFlowStateCopyWithImpl(this._self, this._then);

  final _EmailAuthFlowState _self;
  final $Res Function(_EmailAuthFlowState) _then;

/// Create a copy of EmailAuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? step = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_EmailAuthFlowState(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as FxEmailAuthStep,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
