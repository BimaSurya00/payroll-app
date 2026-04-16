// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_in_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClockInRequest {

@JsonKey(name: 'lat') double get lat;@JsonKey(name: 'long') double get long;
/// Create a copy of ClockInRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockInRequestCopyWith<ClockInRequest> get copyWith => _$ClockInRequestCopyWithImpl<ClockInRequest>(this as ClockInRequest, _$identity);

  /// Serializes this ClockInRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockInRequest&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,long);

@override
String toString() {
  return 'ClockInRequest(lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class $ClockInRequestCopyWith<$Res>  {
  factory $ClockInRequestCopyWith(ClockInRequest value, $Res Function(ClockInRequest) _then) = _$ClockInRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lat') double lat,@JsonKey(name: 'long') double long
});




}
/// @nodoc
class _$ClockInRequestCopyWithImpl<$Res>
    implements $ClockInRequestCopyWith<$Res> {
  _$ClockInRequestCopyWithImpl(this._self, this._then);

  final ClockInRequest _self;
  final $Res Function(ClockInRequest) _then;

/// Create a copy of ClockInRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? long = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ClockInRequest].
extension ClockInRequestPatterns on ClockInRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockInRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockInRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockInRequest value)  $default,){
final _that = this;
switch (_that) {
case _ClockInRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockInRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ClockInRequest() when $default != null:
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
case _ClockInRequest() when $default != null:
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
case _ClockInRequest():
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
case _ClockInRequest() when $default != null:
return $default(_that.lat,_that.long);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClockInRequest implements ClockInRequest {
  const _ClockInRequest({@JsonKey(name: 'lat') required this.lat, @JsonKey(name: 'long') required this.long});
  factory _ClockInRequest.fromJson(Map<String, dynamic> json) => _$ClockInRequestFromJson(json);

@override@JsonKey(name: 'lat') final  double lat;
@override@JsonKey(name: 'long') final  double long;

/// Create a copy of ClockInRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockInRequestCopyWith<_ClockInRequest> get copyWith => __$ClockInRequestCopyWithImpl<_ClockInRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClockInRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockInRequest&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,long);

@override
String toString() {
  return 'ClockInRequest(lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class _$ClockInRequestCopyWith<$Res> implements $ClockInRequestCopyWith<$Res> {
  factory _$ClockInRequestCopyWith(_ClockInRequest value, $Res Function(_ClockInRequest) _then) = __$ClockInRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lat') double lat,@JsonKey(name: 'long') double long
});




}
/// @nodoc
class __$ClockInRequestCopyWithImpl<$Res>
    implements _$ClockInRequestCopyWith<$Res> {
  __$ClockInRequestCopyWithImpl(this._self, this._then);

  final _ClockInRequest _self;
  final $Res Function(_ClockInRequest) _then;

/// Create a copy of ClockInRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? long = null,}) {
  return _then(_ClockInRequest(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
