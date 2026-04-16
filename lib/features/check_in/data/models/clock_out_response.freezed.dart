// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_out_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClockOutResponse {

@JsonKey(name: 'success') bool? get success;@JsonKey(name: 'statusCode') int? get statusCode;@JsonKey(name: 'message') String? get message;@JsonKey(name: 'data') ClockOutData? get data;
/// Create a copy of ClockOutResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockOutResponseCopyWith<ClockOutResponse> get copyWith => _$ClockOutResponseCopyWithImpl<ClockOutResponse>(this as ClockOutResponse, _$identity);

  /// Serializes this ClockOutResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockOutResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,statusCode,message,data);

@override
String toString() {
  return 'ClockOutResponse(success: $success, statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ClockOutResponseCopyWith<$Res>  {
  factory $ClockOutResponseCopyWith(ClockOutResponse value, $Res Function(ClockOutResponse) _then) = _$ClockOutResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool? success,@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'message') String? message,@JsonKey(name: 'data') ClockOutData? data
});


$ClockOutDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ClockOutResponseCopyWithImpl<$Res>
    implements $ClockOutResponseCopyWith<$Res> {
  _$ClockOutResponseCopyWithImpl(this._self, this._then);

  final ClockOutResponse _self;
  final $Res Function(ClockOutResponse) _then;

/// Create a copy of ClockOutResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ClockOutData?,
  ));
}
/// Create a copy of ClockOutResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClockOutDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ClockOutDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClockOutResponse].
extension ClockOutResponsePatterns on ClockOutResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockOutResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockOutResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockOutResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClockOutResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockOutResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClockOutResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  ClockOutData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClockOutResponse() when $default != null:
return $default(_that.success,_that.statusCode,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  ClockOutData? data)  $default,) {final _that = this;
switch (_that) {
case _ClockOutResponse():
return $default(_that.success,_that.statusCode,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  ClockOutData? data)?  $default,) {final _that = this;
switch (_that) {
case _ClockOutResponse() when $default != null:
return $default(_that.success,_that.statusCode,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClockOutResponse implements ClockOutResponse {
  const _ClockOutResponse({@JsonKey(name: 'success') this.success, @JsonKey(name: 'statusCode') this.statusCode, @JsonKey(name: 'message') this.message, @JsonKey(name: 'data') this.data});
  factory _ClockOutResponse.fromJson(Map<String, dynamic> json) => _$ClockOutResponseFromJson(json);

@override@JsonKey(name: 'success') final  bool? success;
@override@JsonKey(name: 'statusCode') final  int? statusCode;
@override@JsonKey(name: 'message') final  String? message;
@override@JsonKey(name: 'data') final  ClockOutData? data;

/// Create a copy of ClockOutResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockOutResponseCopyWith<_ClockOutResponse> get copyWith => __$ClockOutResponseCopyWithImpl<_ClockOutResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClockOutResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockOutResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,statusCode,message,data);

@override
String toString() {
  return 'ClockOutResponse(success: $success, statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ClockOutResponseCopyWith<$Res> implements $ClockOutResponseCopyWith<$Res> {
  factory _$ClockOutResponseCopyWith(_ClockOutResponse value, $Res Function(_ClockOutResponse) _then) = __$ClockOutResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool? success,@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'message') String? message,@JsonKey(name: 'data') ClockOutData? data
});


@override $ClockOutDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ClockOutResponseCopyWithImpl<$Res>
    implements _$ClockOutResponseCopyWith<$Res> {
  __$ClockOutResponseCopyWithImpl(this._self, this._then);

  final _ClockOutResponse _self;
  final $Res Function(_ClockOutResponse) _then;

/// Create a copy of ClockOutResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ClockOutResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ClockOutData?,
  ));
}

/// Create a copy of ClockOutResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClockOutDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ClockOutDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ClockOutData {

@JsonKey(name: 'attendanceId') String? get attendanceId;@JsonKey(name: 'clockOutTime') String? get clockOutTime;@JsonKey(name: 'distance') double? get distance;
/// Create a copy of ClockOutData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockOutDataCopyWith<ClockOutData> get copyWith => _$ClockOutDataCopyWithImpl<ClockOutData>(this as ClockOutData, _$identity);

  /// Serializes this ClockOutData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockOutData&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attendanceId,clockOutTime,distance);

@override
String toString() {
  return 'ClockOutData(attendanceId: $attendanceId, clockOutTime: $clockOutTime, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $ClockOutDataCopyWith<$Res>  {
  factory $ClockOutDataCopyWith(ClockOutData value, $Res Function(ClockOutData) _then) = _$ClockOutDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'attendanceId') String? attendanceId,@JsonKey(name: 'clockOutTime') String? clockOutTime,@JsonKey(name: 'distance') double? distance
});




}
/// @nodoc
class _$ClockOutDataCopyWithImpl<$Res>
    implements $ClockOutDataCopyWith<$Res> {
  _$ClockOutDataCopyWithImpl(this._self, this._then);

  final ClockOutData _self;
  final $Res Function(ClockOutData) _then;

/// Create a copy of ClockOutData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attendanceId = freezed,Object? clockOutTime = freezed,Object? distance = freezed,}) {
  return _then(_self.copyWith(
attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClockOutData].
extension ClockOutDataPatterns on ClockOutData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockOutData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockOutData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockOutData value)  $default,){
final _that = this;
switch (_that) {
case _ClockOutData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockOutData value)?  $default,){
final _that = this;
switch (_that) {
case _ClockOutData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'attendanceId')  String? attendanceId, @JsonKey(name: 'clockOutTime')  String? clockOutTime, @JsonKey(name: 'distance')  double? distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClockOutData() when $default != null:
return $default(_that.attendanceId,_that.clockOutTime,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'attendanceId')  String? attendanceId, @JsonKey(name: 'clockOutTime')  String? clockOutTime, @JsonKey(name: 'distance')  double? distance)  $default,) {final _that = this;
switch (_that) {
case _ClockOutData():
return $default(_that.attendanceId,_that.clockOutTime,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'attendanceId')  String? attendanceId, @JsonKey(name: 'clockOutTime')  String? clockOutTime, @JsonKey(name: 'distance')  double? distance)?  $default,) {final _that = this;
switch (_that) {
case _ClockOutData() when $default != null:
return $default(_that.attendanceId,_that.clockOutTime,_that.distance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClockOutData implements ClockOutData {
  const _ClockOutData({@JsonKey(name: 'attendanceId') this.attendanceId, @JsonKey(name: 'clockOutTime') this.clockOutTime, @JsonKey(name: 'distance') this.distance});
  factory _ClockOutData.fromJson(Map<String, dynamic> json) => _$ClockOutDataFromJson(json);

@override@JsonKey(name: 'attendanceId') final  String? attendanceId;
@override@JsonKey(name: 'clockOutTime') final  String? clockOutTime;
@override@JsonKey(name: 'distance') final  double? distance;

/// Create a copy of ClockOutData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockOutDataCopyWith<_ClockOutData> get copyWith => __$ClockOutDataCopyWithImpl<_ClockOutData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClockOutDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockOutData&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attendanceId,clockOutTime,distance);

@override
String toString() {
  return 'ClockOutData(attendanceId: $attendanceId, clockOutTime: $clockOutTime, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$ClockOutDataCopyWith<$Res> implements $ClockOutDataCopyWith<$Res> {
  factory _$ClockOutDataCopyWith(_ClockOutData value, $Res Function(_ClockOutData) _then) = __$ClockOutDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'attendanceId') String? attendanceId,@JsonKey(name: 'clockOutTime') String? clockOutTime,@JsonKey(name: 'distance') double? distance
});




}
/// @nodoc
class __$ClockOutDataCopyWithImpl<$Res>
    implements _$ClockOutDataCopyWith<$Res> {
  __$ClockOutDataCopyWithImpl(this._self, this._then);

  final _ClockOutData _self;
  final $Res Function(_ClockOutData) _then;

/// Create a copy of ClockOutData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attendanceId = freezed,Object? clockOutTime = freezed,Object? distance = freezed,}) {
  return _then(_ClockOutData(
attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
