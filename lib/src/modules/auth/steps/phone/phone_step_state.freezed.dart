// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_step_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhoneStepState {

 String? get phone; String? get countryCode; String? get formattedPhone; bool get isLoading; String? get error;
/// Create a copy of PhoneStepState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneStepStateCopyWith<PhoneStepState> get copyWith => _$PhoneStepStateCopyWithImpl<PhoneStepState>(this as PhoneStepState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneStepState&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.formattedPhone, formattedPhone) || other.formattedPhone == formattedPhone)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,phone,countryCode,formattedPhone,isLoading,error);

@override
String toString() {
  return 'PhoneStepState(phone: $phone, countryCode: $countryCode, formattedPhone: $formattedPhone, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $PhoneStepStateCopyWith<$Res>  {
  factory $PhoneStepStateCopyWith(PhoneStepState value, $Res Function(PhoneStepState) _then) = _$PhoneStepStateCopyWithImpl;
@useResult
$Res call({
 String? phone, String? countryCode, String? formattedPhone, bool isLoading, String? error
});




}
/// @nodoc
class _$PhoneStepStateCopyWithImpl<$Res>
    implements $PhoneStepStateCopyWith<$Res> {
  _$PhoneStepStateCopyWithImpl(this._self, this._then);

  final PhoneStepState _self;
  final $Res Function(PhoneStepState) _then;

/// Create a copy of PhoneStepState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = freezed,Object? countryCode = freezed,Object? formattedPhone = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,formattedPhone: freezed == formattedPhone ? _self.formattedPhone : formattedPhone // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneStepState].
extension PhoneStepStatePatterns on PhoneStepState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneStepState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneStepState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneStepState value)  $default,){
final _that = this;
switch (_that) {
case _PhoneStepState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneStepState value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneStepState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? phone,  String? countryCode,  String? formattedPhone,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneStepState() when $default != null:
return $default(_that.phone,_that.countryCode,_that.formattedPhone,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? phone,  String? countryCode,  String? formattedPhone,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PhoneStepState():
return $default(_that.phone,_that.countryCode,_that.formattedPhone,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? phone,  String? countryCode,  String? formattedPhone,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PhoneStepState() when $default != null:
return $default(_that.phone,_that.countryCode,_that.formattedPhone,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PhoneStepState implements PhoneStepState {
  const _PhoneStepState({this.phone, this.countryCode, this.formattedPhone, this.isLoading = false, this.error});
  

@override final  String? phone;
@override final  String? countryCode;
@override final  String? formattedPhone;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of PhoneStepState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneStepStateCopyWith<_PhoneStepState> get copyWith => __$PhoneStepStateCopyWithImpl<_PhoneStepState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneStepState&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.formattedPhone, formattedPhone) || other.formattedPhone == formattedPhone)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,phone,countryCode,formattedPhone,isLoading,error);

@override
String toString() {
  return 'PhoneStepState(phone: $phone, countryCode: $countryCode, formattedPhone: $formattedPhone, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PhoneStepStateCopyWith<$Res> implements $PhoneStepStateCopyWith<$Res> {
  factory _$PhoneStepStateCopyWith(_PhoneStepState value, $Res Function(_PhoneStepState) _then) = __$PhoneStepStateCopyWithImpl;
@override @useResult
$Res call({
 String? phone, String? countryCode, String? formattedPhone, bool isLoading, String? error
});




}
/// @nodoc
class __$PhoneStepStateCopyWithImpl<$Res>
    implements _$PhoneStepStateCopyWith<$Res> {
  __$PhoneStepStateCopyWithImpl(this._self, this._then);

  final _PhoneStepState _self;
  final $Res Function(_PhoneStepState) _then;

/// Create a copy of PhoneStepState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = freezed,Object? countryCode = freezed,Object? formattedPhone = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_PhoneStepState(
phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,formattedPhone: freezed == formattedPhone ? _self.formattedPhone : formattedPhone // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
