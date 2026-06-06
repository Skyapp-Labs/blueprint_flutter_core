// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPasswordPayload {

 String get email;
/// Create a copy of ForgotPasswordPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordPayloadCopyWith<ForgotPasswordPayload> get copyWith => _$ForgotPasswordPayloadCopyWithImpl<ForgotPasswordPayload>(this as ForgotPasswordPayload, _$identity);

  /// Serializes this ForgotPasswordPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordPayload&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordPayload(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordPayloadCopyWith<$Res>  {
  factory $ForgotPasswordPayloadCopyWith(ForgotPasswordPayload value, $Res Function(ForgotPasswordPayload) _then) = _$ForgotPasswordPayloadCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordPayloadCopyWithImpl<$Res>
    implements $ForgotPasswordPayloadCopyWith<$Res> {
  _$ForgotPasswordPayloadCopyWithImpl(this._self, this._then);

  final ForgotPasswordPayload _self;
  final $Res Function(ForgotPasswordPayload) _then;

/// Create a copy of ForgotPasswordPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordPayload].
extension ForgotPasswordPayloadPatterns on ForgotPasswordPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPasswordPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPasswordPayload value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPasswordPayload value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPasswordPayload() when $default != null:
return $default(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email)  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordPayload():
return $default(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordPayload() when $default != null:
return $default(_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForgotPasswordPayload implements ForgotPasswordPayload {
  const _ForgotPasswordPayload({required this.email});
  factory _ForgotPasswordPayload.fromJson(Map<String, dynamic> json) => _$ForgotPasswordPayloadFromJson(json);

@override final  String email;

/// Create a copy of ForgotPasswordPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordPayloadCopyWith<_ForgotPasswordPayload> get copyWith => __$ForgotPasswordPayloadCopyWithImpl<_ForgotPasswordPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgotPasswordPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordPayload&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordPayload(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordPayloadCopyWith<$Res> implements $ForgotPasswordPayloadCopyWith<$Res> {
  factory _$ForgotPasswordPayloadCopyWith(_ForgotPasswordPayload value, $Res Function(_ForgotPasswordPayload) _then) = __$ForgotPasswordPayloadCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$ForgotPasswordPayloadCopyWithImpl<$Res>
    implements _$ForgotPasswordPayloadCopyWith<$Res> {
  __$ForgotPasswordPayloadCopyWithImpl(this._self, this._then);

  final _ForgotPasswordPayload _self;
  final $Res Function(_ForgotPasswordPayload) _then;

/// Create a copy of ForgotPasswordPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_ForgotPasswordPayload(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
