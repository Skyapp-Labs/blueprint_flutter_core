// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fx_countries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FxCountry {

 String get name; String get code; String get dialCode; String get flag; String get continent;
/// Create a copy of FxCountry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FxCountryCopyWith<FxCountry> get copyWith => _$FxCountryCopyWithImpl<FxCountry>(this as FxCountry, _$identity);

  /// Serializes this FxCountry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FxCountry&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.continent, continent) || other.continent == continent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,dialCode,flag,continent);

@override
String toString() {
  return 'FxCountry(name: $name, code: $code, dialCode: $dialCode, flag: $flag, continent: $continent)';
}


}

/// @nodoc
abstract mixin class $FxCountryCopyWith<$Res>  {
  factory $FxCountryCopyWith(FxCountry value, $Res Function(FxCountry) _then) = _$FxCountryCopyWithImpl;
@useResult
$Res call({
 String name, String code, String dialCode, String flag, String continent
});




}
/// @nodoc
class _$FxCountryCopyWithImpl<$Res>
    implements $FxCountryCopyWith<$Res> {
  _$FxCountryCopyWithImpl(this._self, this._then);

  final FxCountry _self;
  final $Res Function(FxCountry) _then;

/// Create a copy of FxCountry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,Object? dialCode = null,Object? flag = null,Object? continent = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,dialCode: null == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String,flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String,continent: null == continent ? _self.continent : continent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FxCountry].
extension FxCountryPatterns on FxCountry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FxCountry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FxCountry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FxCountry value)  $default,){
final _that = this;
switch (_that) {
case _FxCountry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FxCountry value)?  $default,){
final _that = this;
switch (_that) {
case _FxCountry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code,  String dialCode,  String flag,  String continent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FxCountry() when $default != null:
return $default(_that.name,_that.code,_that.dialCode,_that.flag,_that.continent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code,  String dialCode,  String flag,  String continent)  $default,) {final _that = this;
switch (_that) {
case _FxCountry():
return $default(_that.name,_that.code,_that.dialCode,_that.flag,_that.continent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code,  String dialCode,  String flag,  String continent)?  $default,) {final _that = this;
switch (_that) {
case _FxCountry() when $default != null:
return $default(_that.name,_that.code,_that.dialCode,_that.flag,_that.continent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FxCountry implements FxCountry {
  const _FxCountry({required this.name, required this.code, required this.dialCode, required this.flag, required this.continent});
  factory _FxCountry.fromJson(Map<String, dynamic> json) => _$FxCountryFromJson(json);

@override final  String name;
@override final  String code;
@override final  String dialCode;
@override final  String flag;
@override final  String continent;

/// Create a copy of FxCountry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FxCountryCopyWith<_FxCountry> get copyWith => __$FxCountryCopyWithImpl<_FxCountry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FxCountryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FxCountry&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.continent, continent) || other.continent == continent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,dialCode,flag,continent);

@override
String toString() {
  return 'FxCountry(name: $name, code: $code, dialCode: $dialCode, flag: $flag, continent: $continent)';
}


}

/// @nodoc
abstract mixin class _$FxCountryCopyWith<$Res> implements $FxCountryCopyWith<$Res> {
  factory _$FxCountryCopyWith(_FxCountry value, $Res Function(_FxCountry) _then) = __$FxCountryCopyWithImpl;
@override @useResult
$Res call({
 String name, String code, String dialCode, String flag, String continent
});




}
/// @nodoc
class __$FxCountryCopyWithImpl<$Res>
    implements _$FxCountryCopyWith<$Res> {
  __$FxCountryCopyWithImpl(this._self, this._then);

  final _FxCountry _self;
  final $Res Function(_FxCountry) _then;

/// Create a copy of FxCountry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,Object? dialCode = null,Object? flag = null,Object? continent = null,}) {
  return _then(_FxCountry(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,dialCode: null == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String,flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String,continent: null == continent ? _self.continent : continent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
