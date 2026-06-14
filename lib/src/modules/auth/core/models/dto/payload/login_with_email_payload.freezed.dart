// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_with_email_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginWithEmailPayload {

 String get email; String get password;
/// Create a copy of LoginWithEmailPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginWithEmailPayloadCopyWith<LoginWithEmailPayload> get copyWith => _$LoginWithEmailPayloadCopyWithImpl<LoginWithEmailPayload>(this as LoginWithEmailPayload, _$identity);

  /// Serializes this LoginWithEmailPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginWithEmailPayload&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginWithEmailPayload(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginWithEmailPayloadCopyWith<$Res>  {
  factory $LoginWithEmailPayloadCopyWith(LoginWithEmailPayload value, $Res Function(LoginWithEmailPayload) _then) = _$LoginWithEmailPayloadCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginWithEmailPayloadCopyWithImpl<$Res>
    implements $LoginWithEmailPayloadCopyWith<$Res> {
  _$LoginWithEmailPayloadCopyWithImpl(this._self, this._then);

  final LoginWithEmailPayload _self;
  final $Res Function(LoginWithEmailPayload) _then;

/// Create a copy of LoginWithEmailPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginWithEmailPayload].
extension LoginWithEmailPayloadPatterns on LoginWithEmailPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginWithEmailPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginWithEmailPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginWithEmailPayload value)  $default,){
final _that = this;
switch (_that) {
case _LoginWithEmailPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginWithEmailPayload value)?  $default,){
final _that = this;
switch (_that) {
case _LoginWithEmailPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginWithEmailPayload() when $default != null:
return $default(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password)  $default,) {final _that = this;
switch (_that) {
case _LoginWithEmailPayload():
return $default(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password)?  $default,) {final _that = this;
switch (_that) {
case _LoginWithEmailPayload() when $default != null:
return $default(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginWithEmailPayload implements LoginWithEmailPayload {
  const _LoginWithEmailPayload({required this.email, required this.password});
  factory _LoginWithEmailPayload.fromJson(Map<String, dynamic> json) => _$LoginWithEmailPayloadFromJson(json);

@override final  String email;
@override final  String password;

/// Create a copy of LoginWithEmailPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginWithEmailPayloadCopyWith<_LoginWithEmailPayload> get copyWith => __$LoginWithEmailPayloadCopyWithImpl<_LoginWithEmailPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginWithEmailPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginWithEmailPayload&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginWithEmailPayload(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginWithEmailPayloadCopyWith<$Res> implements $LoginWithEmailPayloadCopyWith<$Res> {
  factory _$LoginWithEmailPayloadCopyWith(_LoginWithEmailPayload value, $Res Function(_LoginWithEmailPayload) _then) = __$LoginWithEmailPayloadCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginWithEmailPayloadCopyWithImpl<$Res>
    implements _$LoginWithEmailPayloadCopyWith<$Res> {
  __$LoginWithEmailPayloadCopyWithImpl(this._self, this._then);

  final _LoginWithEmailPayload _self;
  final $Res Function(_LoginWithEmailPayload) _then;

/// Create a copy of LoginWithEmailPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_LoginWithEmailPayload(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
