// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PinStatusDto {

 bool get isSet; bool get isLocked; String get type; int get length;
/// Create a copy of PinStatusDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinStatusDtoCopyWith<PinStatusDto> get copyWith => _$PinStatusDtoCopyWithImpl<PinStatusDto>(this as PinStatusDto, _$identity);

  /// Serializes this PinStatusDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinStatusDto&&(identical(other.isSet, isSet) || other.isSet == isSet)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.type, type) || other.type == type)&&(identical(other.length, length) || other.length == length));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSet,isLocked,type,length);

@override
String toString() {
  return 'PinStatusDto(isSet: $isSet, isLocked: $isLocked, type: $type, length: $length)';
}


}

/// @nodoc
abstract mixin class $PinStatusDtoCopyWith<$Res>  {
  factory $PinStatusDtoCopyWith(PinStatusDto value, $Res Function(PinStatusDto) _then) = _$PinStatusDtoCopyWithImpl;
@useResult
$Res call({
 bool isSet, bool isLocked, String type, int length
});




}
/// @nodoc
class _$PinStatusDtoCopyWithImpl<$Res>
    implements $PinStatusDtoCopyWith<$Res> {
  _$PinStatusDtoCopyWithImpl(this._self, this._then);

  final PinStatusDto _self;
  final $Res Function(PinStatusDto) _then;

/// Create a copy of PinStatusDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSet = null,Object? isLocked = null,Object? type = null,Object? length = null,}) {
  return _then(_self.copyWith(
isSet: null == isSet ? _self.isSet : isSet // ignore: cast_nullable_to_non_nullable
as bool,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PinStatusDto].
extension PinStatusDtoPatterns on PinStatusDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PinStatusDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PinStatusDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PinStatusDto value)  $default,){
final _that = this;
switch (_that) {
case _PinStatusDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PinStatusDto value)?  $default,){
final _that = this;
switch (_that) {
case _PinStatusDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSet,  bool isLocked,  String type,  int length)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PinStatusDto() when $default != null:
return $default(_that.isSet,_that.isLocked,_that.type,_that.length);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSet,  bool isLocked,  String type,  int length)  $default,) {final _that = this;
switch (_that) {
case _PinStatusDto():
return $default(_that.isSet,_that.isLocked,_that.type,_that.length);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSet,  bool isLocked,  String type,  int length)?  $default,) {final _that = this;
switch (_that) {
case _PinStatusDto() when $default != null:
return $default(_that.isSet,_that.isLocked,_that.type,_that.length);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PinStatusDto implements PinStatusDto {
  const _PinStatusDto({required this.isSet, required this.isLocked, required this.type, required this.length});
  factory _PinStatusDto.fromJson(Map<String, dynamic> json) => _$PinStatusDtoFromJson(json);

@override final  bool isSet;
@override final  bool isLocked;
@override final  String type;
@override final  int length;

/// Create a copy of PinStatusDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PinStatusDtoCopyWith<_PinStatusDto> get copyWith => __$PinStatusDtoCopyWithImpl<_PinStatusDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PinStatusDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PinStatusDto&&(identical(other.isSet, isSet) || other.isSet == isSet)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.type, type) || other.type == type)&&(identical(other.length, length) || other.length == length));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSet,isLocked,type,length);

@override
String toString() {
  return 'PinStatusDto(isSet: $isSet, isLocked: $isLocked, type: $type, length: $length)';
}


}

/// @nodoc
abstract mixin class _$PinStatusDtoCopyWith<$Res> implements $PinStatusDtoCopyWith<$Res> {
  factory _$PinStatusDtoCopyWith(_PinStatusDto value, $Res Function(_PinStatusDto) _then) = __$PinStatusDtoCopyWithImpl;
@override @useResult
$Res call({
 bool isSet, bool isLocked, String type, int length
});




}
/// @nodoc
class __$PinStatusDtoCopyWithImpl<$Res>
    implements _$PinStatusDtoCopyWith<$Res> {
  __$PinStatusDtoCopyWithImpl(this._self, this._then);

  final _PinStatusDto _self;
  final $Res Function(_PinStatusDto) _then;

/// Create a copy of PinStatusDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSet = null,Object? isLocked = null,Object? type = null,Object? length = null,}) {
  return _then(_PinStatusDto(
isSet: null == isSet ? _self.isSet : isSet // ignore: cast_nullable_to_non_nullable
as bool,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
