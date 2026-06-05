// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fx_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FxResult<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FxResult<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FxResult<$T>()';
}


}

/// @nodoc
class $FxResultCopyWith<T,$Res>  {
$FxResultCopyWith(FxResult<T> _, $Res Function(FxResult<T>) __);
}


/// Adds pattern-matching-related methods to [FxResult].
extension FxResultPatterns<T> on FxResult<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FxSuccess<T> value)?  success,TResult Function( FxFailure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FxSuccess() when success != null:
return success(_that);case FxFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FxSuccess<T> value)  success,required TResult Function( FxFailure<T> value)  failure,}){
final _that = this;
switch (_that) {
case FxSuccess():
return success(_that);case FxFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FxSuccess<T> value)?  success,TResult? Function( FxFailure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case FxSuccess() when success != null:
return success(_that);case FxFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  success,TResult Function( FxError error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FxSuccess() when success != null:
return success(_that.data);case FxFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  success,required TResult Function( FxError error)  failure,}) {final _that = this;
switch (_that) {
case FxSuccess():
return success(_that.data);case FxFailure():
return failure(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  success,TResult? Function( FxError error)?  failure,}) {final _that = this;
switch (_that) {
case FxSuccess() when success != null:
return success(_that.data);case FxFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class FxSuccess<T> implements FxResult<T> {
  const FxSuccess(this.data);
  

 final  T data;

/// Create a copy of FxResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FxSuccessCopyWith<T, FxSuccess<T>> get copyWith => _$FxSuccessCopyWithImpl<T, FxSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FxSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'FxResult<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $FxSuccessCopyWith<T,$Res> implements $FxResultCopyWith<T, $Res> {
  factory $FxSuccessCopyWith(FxSuccess<T> value, $Res Function(FxSuccess<T>) _then) = _$FxSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$FxSuccessCopyWithImpl<T,$Res>
    implements $FxSuccessCopyWith<T, $Res> {
  _$FxSuccessCopyWithImpl(this._self, this._then);

  final FxSuccess<T> _self;
  final $Res Function(FxSuccess<T>) _then;

/// Create a copy of FxResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(FxSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class FxFailure<T> implements FxResult<T> {
  const FxFailure(this.error);
  

 final  FxError error;

/// Create a copy of FxResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FxFailureCopyWith<T, FxFailure<T>> get copyWith => _$FxFailureCopyWithImpl<T, FxFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FxFailure<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'FxResult<$T>.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $FxFailureCopyWith<T,$Res> implements $FxResultCopyWith<T, $Res> {
  factory $FxFailureCopyWith(FxFailure<T> value, $Res Function(FxFailure<T>) _then) = _$FxFailureCopyWithImpl;
@useResult
$Res call({
 FxError error
});


$FxErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$FxFailureCopyWithImpl<T,$Res>
    implements $FxFailureCopyWith<T, $Res> {
  _$FxFailureCopyWithImpl(this._self, this._then);

  final FxFailure<T> _self;
  final $Res Function(FxFailure<T>) _then;

/// Create a copy of FxResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(FxFailure<T>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as FxError,
  ));
}

/// Create a copy of FxResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FxErrorCopyWith<$Res> get error {
  
  return $FxErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
