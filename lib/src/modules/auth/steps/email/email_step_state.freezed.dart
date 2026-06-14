// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_step_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmailStepState {

 String? get email; String? get password; bool get isLoading; String? get error;
/// Create a copy of EmailStepState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailStepStateCopyWith<EmailStepState> get copyWith => _$EmailStepStateCopyWithImpl<EmailStepState>(this as EmailStepState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailStepState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,isLoading,error);

@override
String toString() {
  return 'EmailStepState(email: $email, password: $password, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $EmailStepStateCopyWith<$Res>  {
  factory $EmailStepStateCopyWith(EmailStepState value, $Res Function(EmailStepState) _then) = _$EmailStepStateCopyWithImpl;
@useResult
$Res call({
 String? email, String? password, bool isLoading, String? error
});




}
/// @nodoc
class _$EmailStepStateCopyWithImpl<$Res>
    implements $EmailStepStateCopyWith<$Res> {
  _$EmailStepStateCopyWithImpl(this._self, this._then);

  final EmailStepState _self;
  final $Res Function(EmailStepState) _then;

/// Create a copy of EmailStepState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? password = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailStepState].
extension EmailStepStatePatterns on EmailStepState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailStepState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailStepState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailStepState value)  $default,){
final _that = this;
switch (_that) {
case _EmailStepState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailStepState value)?  $default,){
final _that = this;
switch (_that) {
case _EmailStepState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  String? password,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailStepState() when $default != null:
return $default(_that.email,_that.password,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  String? password,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _EmailStepState():
return $default(_that.email,_that.password,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  String? password,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _EmailStepState() when $default != null:
return $default(_that.email,_that.password,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _EmailStepState implements EmailStepState {
  const _EmailStepState({this.email, this.password, this.isLoading = false, this.error});
  

@override final  String? email;
@override final  String? password;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of EmailStepState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailStepStateCopyWith<_EmailStepState> get copyWith => __$EmailStepStateCopyWithImpl<_EmailStepState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailStepState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,isLoading,error);

@override
String toString() {
  return 'EmailStepState(email: $email, password: $password, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$EmailStepStateCopyWith<$Res> implements $EmailStepStateCopyWith<$Res> {
  factory _$EmailStepStateCopyWith(_EmailStepState value, $Res Function(_EmailStepState) _then) = __$EmailStepStateCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? password, bool isLoading, String? error
});




}
/// @nodoc
class __$EmailStepStateCopyWithImpl<$Res>
    implements _$EmailStepStateCopyWith<$Res> {
  __$EmailStepStateCopyWithImpl(this._self, this._then);

  final _EmailStepState _self;
  final $Res Function(_EmailStepState) _then;

/// Create a copy of EmailStepState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? password = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_EmailStepState(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
