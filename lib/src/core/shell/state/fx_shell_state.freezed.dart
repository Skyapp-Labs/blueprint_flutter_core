// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fx_shell_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FxShellState {

 FxPane? get currentPane; List<FxPane> get dockPanes; List<FxPane> get drawerPanes; List<FxPane> get endDrawerPanes; List<FxPane> get registry; List<String> get history;
/// Create a copy of FxShellState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FxShellStateCopyWith<FxShellState> get copyWith => _$FxShellStateCopyWithImpl<FxShellState>(this as FxShellState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FxShellState&&(identical(other.currentPane, currentPane) || other.currentPane == currentPane)&&const DeepCollectionEquality().equals(other.dockPanes, dockPanes)&&const DeepCollectionEquality().equals(other.drawerPanes, drawerPanes)&&const DeepCollectionEquality().equals(other.endDrawerPanes, endDrawerPanes)&&const DeepCollectionEquality().equals(other.registry, registry)&&const DeepCollectionEquality().equals(other.history, history));
}


@override
int get hashCode => Object.hash(runtimeType,currentPane,const DeepCollectionEquality().hash(dockPanes),const DeepCollectionEquality().hash(drawerPanes),const DeepCollectionEquality().hash(endDrawerPanes),const DeepCollectionEquality().hash(registry),const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'FxShellState(currentPane: $currentPane, dockPanes: $dockPanes, drawerPanes: $drawerPanes, endDrawerPanes: $endDrawerPanes, registry: $registry, history: $history)';
}


}

/// @nodoc
abstract mixin class $FxShellStateCopyWith<$Res>  {
  factory $FxShellStateCopyWith(FxShellState value, $Res Function(FxShellState) _then) = _$FxShellStateCopyWithImpl;
@useResult
$Res call({
 FxPane? currentPane, List<FxPane> dockPanes, List<FxPane> drawerPanes, List<FxPane> endDrawerPanes, List<FxPane> registry, List<String> history
});




}
/// @nodoc
class _$FxShellStateCopyWithImpl<$Res>
    implements $FxShellStateCopyWith<$Res> {
  _$FxShellStateCopyWithImpl(this._self, this._then);

  final FxShellState _self;
  final $Res Function(FxShellState) _then;

/// Create a copy of FxShellState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPane = freezed,Object? dockPanes = null,Object? drawerPanes = null,Object? endDrawerPanes = null,Object? registry = null,Object? history = null,}) {
  return _then(_self.copyWith(
currentPane: freezed == currentPane ? _self.currentPane : currentPane // ignore: cast_nullable_to_non_nullable
as FxPane?,dockPanes: null == dockPanes ? _self.dockPanes : dockPanes // ignore: cast_nullable_to_non_nullable
as List<FxPane>,drawerPanes: null == drawerPanes ? _self.drawerPanes : drawerPanes // ignore: cast_nullable_to_non_nullable
as List<FxPane>,endDrawerPanes: null == endDrawerPanes ? _self.endDrawerPanes : endDrawerPanes // ignore: cast_nullable_to_non_nullable
as List<FxPane>,registry: null == registry ? _self.registry : registry // ignore: cast_nullable_to_non_nullable
as List<FxPane>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [FxShellState].
extension FxShellStatePatterns on FxShellState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FxShellState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FxShellState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FxShellState value)  $default,){
final _that = this;
switch (_that) {
case _FxShellState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FxShellState value)?  $default,){
final _that = this;
switch (_that) {
case _FxShellState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FxPane? currentPane,  List<FxPane> dockPanes,  List<FxPane> drawerPanes,  List<FxPane> endDrawerPanes,  List<FxPane> registry,  List<String> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FxShellState() when $default != null:
return $default(_that.currentPane,_that.dockPanes,_that.drawerPanes,_that.endDrawerPanes,_that.registry,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FxPane? currentPane,  List<FxPane> dockPanes,  List<FxPane> drawerPanes,  List<FxPane> endDrawerPanes,  List<FxPane> registry,  List<String> history)  $default,) {final _that = this;
switch (_that) {
case _FxShellState():
return $default(_that.currentPane,_that.dockPanes,_that.drawerPanes,_that.endDrawerPanes,_that.registry,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FxPane? currentPane,  List<FxPane> dockPanes,  List<FxPane> drawerPanes,  List<FxPane> endDrawerPanes,  List<FxPane> registry,  List<String> history)?  $default,) {final _that = this;
switch (_that) {
case _FxShellState() when $default != null:
return $default(_that.currentPane,_that.dockPanes,_that.drawerPanes,_that.endDrawerPanes,_that.registry,_that.history);case _:
  return null;

}
}

}

/// @nodoc


class _FxShellState extends FxShellState {
  const _FxShellState({this.currentPane, final  List<FxPane> dockPanes = const [], final  List<FxPane> drawerPanes = const [], final  List<FxPane> endDrawerPanes = const [], final  List<FxPane> registry = const [], final  List<String> history = const []}): _dockPanes = dockPanes,_drawerPanes = drawerPanes,_endDrawerPanes = endDrawerPanes,_registry = registry,_history = history,super._();
  

@override final  FxPane? currentPane;
 final  List<FxPane> _dockPanes;
@override@JsonKey() List<FxPane> get dockPanes {
  if (_dockPanes is EqualUnmodifiableListView) return _dockPanes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dockPanes);
}

 final  List<FxPane> _drawerPanes;
@override@JsonKey() List<FxPane> get drawerPanes {
  if (_drawerPanes is EqualUnmodifiableListView) return _drawerPanes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drawerPanes);
}

 final  List<FxPane> _endDrawerPanes;
@override@JsonKey() List<FxPane> get endDrawerPanes {
  if (_endDrawerPanes is EqualUnmodifiableListView) return _endDrawerPanes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_endDrawerPanes);
}

 final  List<FxPane> _registry;
@override@JsonKey() List<FxPane> get registry {
  if (_registry is EqualUnmodifiableListView) return _registry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_registry);
}

 final  List<String> _history;
@override@JsonKey() List<String> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of FxShellState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FxShellStateCopyWith<_FxShellState> get copyWith => __$FxShellStateCopyWithImpl<_FxShellState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FxShellState&&(identical(other.currentPane, currentPane) || other.currentPane == currentPane)&&const DeepCollectionEquality().equals(other._dockPanes, _dockPanes)&&const DeepCollectionEquality().equals(other._drawerPanes, _drawerPanes)&&const DeepCollectionEquality().equals(other._endDrawerPanes, _endDrawerPanes)&&const DeepCollectionEquality().equals(other._registry, _registry)&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,currentPane,const DeepCollectionEquality().hash(_dockPanes),const DeepCollectionEquality().hash(_drawerPanes),const DeepCollectionEquality().hash(_endDrawerPanes),const DeepCollectionEquality().hash(_registry),const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'FxShellState(currentPane: $currentPane, dockPanes: $dockPanes, drawerPanes: $drawerPanes, endDrawerPanes: $endDrawerPanes, registry: $registry, history: $history)';
}


}

/// @nodoc
abstract mixin class _$FxShellStateCopyWith<$Res> implements $FxShellStateCopyWith<$Res> {
  factory _$FxShellStateCopyWith(_FxShellState value, $Res Function(_FxShellState) _then) = __$FxShellStateCopyWithImpl;
@override @useResult
$Res call({
 FxPane? currentPane, List<FxPane> dockPanes, List<FxPane> drawerPanes, List<FxPane> endDrawerPanes, List<FxPane> registry, List<String> history
});




}
/// @nodoc
class __$FxShellStateCopyWithImpl<$Res>
    implements _$FxShellStateCopyWith<$Res> {
  __$FxShellStateCopyWithImpl(this._self, this._then);

  final _FxShellState _self;
  final $Res Function(_FxShellState) _then;

/// Create a copy of FxShellState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPane = freezed,Object? dockPanes = null,Object? drawerPanes = null,Object? endDrawerPanes = null,Object? registry = null,Object? history = null,}) {
  return _then(_FxShellState(
currentPane: freezed == currentPane ? _self.currentPane : currentPane // ignore: cast_nullable_to_non_nullable
as FxPane?,dockPanes: null == dockPanes ? _self._dockPanes : dockPanes // ignore: cast_nullable_to_non_nullable
as List<FxPane>,drawerPanes: null == drawerPanes ? _self._drawerPanes : drawerPanes // ignore: cast_nullable_to_non_nullable
as List<FxPane>,endDrawerPanes: null == endDrawerPanes ? _self._endDrawerPanes : endDrawerPanes // ignore: cast_nullable_to_non_nullable
as List<FxPane>,registry: null == registry ? _self._registry : registry // ignore: cast_nullable_to_non_nullable
as List<FxPane>,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
