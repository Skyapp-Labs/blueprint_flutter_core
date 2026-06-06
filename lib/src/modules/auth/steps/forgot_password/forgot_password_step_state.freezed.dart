// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_step_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordStepState {

 String? get email; bool get isLoading; String? get error;
/// Create a copy of ForgotPasswordStepState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordStepStateCopyWith<ForgotPasswordStepState> get copyWith => _$ForgotPasswordStepStateCopyWithImpl<ForgotPasswordStepState>(this as ForgotPasswordStepState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordStepState&&(identical(other.email, email) || other.email == email)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,isLoading,error);

@override
String toString() {
  return 'ForgotPasswordStepState(email: $email, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordStepStateCopyWith<$Res>  {
  factory $ForgotPasswordStepStateCopyWith(ForgotPasswordStepState value, $Res Function(ForgotPasswordStepState) _then) = _$ForgotPasswordStepStateCopyWithImpl;
@useResult
$Res call({
 String? email, bool isLoading, String? error
});




}
/// @nodoc
class _$ForgotPasswordStepStateCopyWithImpl<$Res>
    implements $ForgotPasswordStepStateCopyWith<$Res> {
  _$ForgotPasswordStepStateCopyWithImpl(this._self, this._then);

  final ForgotPasswordStepState _self;
  final $Res Function(ForgotPasswordStepState) _then;

/// Create a copy of ForgotPasswordStepState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordStepState].
extension ForgotPasswordStepStatePatterns on ForgotPasswordStepState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPasswordStepState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordStepState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPasswordStepState value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordStepState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPasswordStepState value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordStepState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPasswordStepState() when $default != null:
return $default(_that.email,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordStepState():
return $default(_that.email,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordStepState() when $default != null:
return $default(_that.email,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ForgotPasswordStepState implements ForgotPasswordStepState {
  const _ForgotPasswordStepState({this.email, this.isLoading = false, this.error});
  

@override final  String? email;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ForgotPasswordStepState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordStepStateCopyWith<_ForgotPasswordStepState> get copyWith => __$ForgotPasswordStepStateCopyWithImpl<_ForgotPasswordStepState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordStepState&&(identical(other.email, email) || other.email == email)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,isLoading,error);

@override
String toString() {
  return 'ForgotPasswordStepState(email: $email, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordStepStateCopyWith<$Res> implements $ForgotPasswordStepStateCopyWith<$Res> {
  factory _$ForgotPasswordStepStateCopyWith(_ForgotPasswordStepState value, $Res Function(_ForgotPasswordStepState) _then) = __$ForgotPasswordStepStateCopyWithImpl;
@override @useResult
$Res call({
 String? email, bool isLoading, String? error
});




}
/// @nodoc
class __$ForgotPasswordStepStateCopyWithImpl<$Res>
    implements _$ForgotPasswordStepStateCopyWith<$Res> {
  __$ForgotPasswordStepStateCopyWithImpl(this._self, this._then);

  final _ForgotPasswordStepState _self;
  final $Res Function(_ForgotPasswordStepState) _then;

/// Create a copy of ForgotPasswordStepState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ForgotPasswordStepState(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
