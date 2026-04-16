// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_out_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClockOutRequest {

@JsonKey(name: 'lat') double get lat;@JsonKey(name: 'long') double get long;
/// Create a copy of ClockOutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockOutRequestCopyWith<ClockOutRequest> get copyWith => _$ClockOutRequestCopyWithImpl<ClockOutRequest>(this as ClockOutRequest, _$identity);

  /// Serializes this ClockOutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockOutRequest&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,long);

@override
String toString() {
  return 'ClockOutRequest(lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class $ClockOutRequestCopyWith<$Res>  {
  factory $ClockOutRequestCopyWith(ClockOutRequest value, $Res Function(ClockOutRequest) _then) = _$ClockOutRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lat') double lat,@JsonKey(name: 'long') double long
});




}
/// @nodoc
class _$ClockOutRequestCopyWithImpl<$Res>
    implements $ClockOutRequestCopyWith<$Res> {
  _$ClockOutRequestCopyWithImpl(this._self, this._then);

  final ClockOutRequest _self;
  final $Res Function(ClockOutRequest) _then;

/// Create a copy of ClockOutRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? long = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ClockOutRequest].
extension ClockOutRequestPatterns on ClockOutRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockOutRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockOutRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockOutRequest value)  $default,){
final _that = this;
switch (_that) {
case _ClockOutRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockOutRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ClockOutRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClockOutRequest() when $default != null:
return $default(_that.lat,_that.long);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long)  $default,) {final _that = this;
switch (_that) {
case _ClockOutRequest():
return $default(_that.lat,_that.long);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long)?  $default,) {final _that = this;
switch (_that) {
case _ClockOutRequest() when $default != null:
return $default(_that.lat,_that.long);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClockOutRequest implements ClockOutRequest {
  const _ClockOutRequest({@JsonKey(name: 'lat') required this.lat, @JsonKey(name: 'long') required this.long});
  factory _ClockOutRequest.fromJson(Map<String, dynamic> json) => _$ClockOutRequestFromJson(json);

@override@JsonKey(name: 'lat') final  double lat;
@override@JsonKey(name: 'long') final  double long;

/// Create a copy of ClockOutRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockOutRequestCopyWith<_ClockOutRequest> get copyWith => __$ClockOutRequestCopyWithImpl<_ClockOutRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClockOutRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockOutRequest&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,long);

@override
String toString() {
  return 'ClockOutRequest(lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class _$ClockOutRequestCopyWith<$Res> implements $ClockOutRequestCopyWith<$Res> {
  factory _$ClockOutRequestCopyWith(_ClockOutRequest value, $Res Function(_ClockOutRequest) _then) = __$ClockOutRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lat') double lat,@JsonKey(name: 'long') double long
});




}
/// @nodoc
class __$ClockOutRequestCopyWithImpl<$Res>
    implements _$ClockOutRequestCopyWith<$Res> {
  __$ClockOutRequestCopyWithImpl(this._self, this._then);

  final _ClockOutRequest _self;
  final $Res Function(_ClockOutRequest) _then;

/// Create a copy of ClockOutRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? long = null,}) {
  return _then(_ClockOutRequest(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
