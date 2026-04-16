// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_in_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClockInResponse {

@JsonKey(name: 'success') bool? get success;@JsonKey(name: 'statusCode') int? get statusCode;@JsonKey(name: 'message') String? get message;@JsonKey(name: 'data') ClockInData? get data;
/// Create a copy of ClockInResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockInResponseCopyWith<ClockInResponse> get copyWith => _$ClockInResponseCopyWithImpl<ClockInResponse>(this as ClockInResponse, _$identity);

  /// Serializes this ClockInResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockInResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,statusCode,message,data);

@override
String toString() {
  return 'ClockInResponse(success: $success, statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ClockInResponseCopyWith<$Res>  {
  factory $ClockInResponseCopyWith(ClockInResponse value, $Res Function(ClockInResponse) _then) = _$ClockInResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool? success,@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'message') String? message,@JsonKey(name: 'data') ClockInData? data
});


$ClockInDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ClockInResponseCopyWithImpl<$Res>
    implements $ClockInResponseCopyWith<$Res> {
  _$ClockInResponseCopyWithImpl(this._self, this._then);

  final ClockInResponse _self;
  final $Res Function(ClockInResponse) _then;

/// Create a copy of ClockInResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ClockInData?,
  ));
}
/// Create a copy of ClockInResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClockInDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ClockInDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClockInResponse].
extension ClockInResponsePatterns on ClockInResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockInResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockInResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockInResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClockInResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockInResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClockInResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  ClockInData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClockInResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  ClockInData? data)  $default,) {final _that = this;
switch (_that) {
case _ClockInResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  ClockInData? data)?  $default,) {final _that = this;
switch (_that) {
case _ClockInResponse() when $default != null:
return $default(_that.success,_that.statusCode,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClockInResponse implements ClockInResponse {
  const _ClockInResponse({@JsonKey(name: 'success') this.success, @JsonKey(name: 'statusCode') this.statusCode, @JsonKey(name: 'message') this.message, @JsonKey(name: 'data') this.data});
  factory _ClockInResponse.fromJson(Map<String, dynamic> json) => _$ClockInResponseFromJson(json);

@override@JsonKey(name: 'success') final  bool? success;
@override@JsonKey(name: 'statusCode') final  int? statusCode;
@override@JsonKey(name: 'message') final  String? message;
@override@JsonKey(name: 'data') final  ClockInData? data;

/// Create a copy of ClockInResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockInResponseCopyWith<_ClockInResponse> get copyWith => __$ClockInResponseCopyWithImpl<_ClockInResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClockInResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockInResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,statusCode,message,data);

@override
String toString() {
  return 'ClockInResponse(success: $success, statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ClockInResponseCopyWith<$Res> implements $ClockInResponseCopyWith<$Res> {
  factory _$ClockInResponseCopyWith(_ClockInResponse value, $Res Function(_ClockInResponse) _then) = __$ClockInResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool? success,@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'message') String? message,@JsonKey(name: 'data') ClockInData? data
});


@override $ClockInDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ClockInResponseCopyWithImpl<$Res>
    implements _$ClockInResponseCopyWith<$Res> {
  __$ClockInResponseCopyWithImpl(this._self, this._then);

  final _ClockInResponse _self;
  final $Res Function(_ClockInResponse) _then;

/// Create a copy of ClockInResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ClockInResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ClockInData?,
  ));
}

/// Create a copy of ClockInResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClockInDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ClockInDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ClockInData {

@JsonKey(name: 'attendanceId') String? get attendanceId;@JsonKey(name: 'employeeId') String? get employeeId;@JsonKey(name: 'clockInTime') String? get clockInTime;@JsonKey(name: 'status') String? get status;@JsonKey(name: 'distance') double? get distance;@JsonKey(name: 'scheduleName') String? get scheduleName;
/// Create a copy of ClockInData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockInDataCopyWith<ClockInData> get copyWith => _$ClockInDataCopyWithImpl<ClockInData>(this as ClockInData, _$identity);

  /// Serializes this ClockInData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockInData&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.scheduleName, scheduleName) || other.scheduleName == scheduleName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attendanceId,employeeId,clockInTime,status,distance,scheduleName);

@override
String toString() {
  return 'ClockInData(attendanceId: $attendanceId, employeeId: $employeeId, clockInTime: $clockInTime, status: $status, distance: $distance, scheduleName: $scheduleName)';
}


}

/// @nodoc
abstract mixin class $ClockInDataCopyWith<$Res>  {
  factory $ClockInDataCopyWith(ClockInData value, $Res Function(ClockInData) _then) = _$ClockInDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'attendanceId') String? attendanceId,@JsonKey(name: 'employeeId') String? employeeId,@JsonKey(name: 'clockInTime') String? clockInTime,@JsonKey(name: 'status') String? status,@JsonKey(name: 'distance') double? distance,@JsonKey(name: 'scheduleName') String? scheduleName
});




}
/// @nodoc
class _$ClockInDataCopyWithImpl<$Res>
    implements $ClockInDataCopyWith<$Res> {
  _$ClockInDataCopyWithImpl(this._self, this._then);

  final ClockInData _self;
  final $Res Function(ClockInData) _then;

/// Create a copy of ClockInData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attendanceId = freezed,Object? employeeId = freezed,Object? clockInTime = freezed,Object? status = freezed,Object? distance = freezed,Object? scheduleName = freezed,}) {
  return _then(_self.copyWith(
attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String?,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,scheduleName: freezed == scheduleName ? _self.scheduleName : scheduleName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClockInData].
extension ClockInDataPatterns on ClockInData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockInData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockInData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockInData value)  $default,){
final _that = this;
switch (_that) {
case _ClockInData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockInData value)?  $default,){
final _that = this;
switch (_that) {
case _ClockInData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'attendanceId')  String? attendanceId, @JsonKey(name: 'employeeId')  String? employeeId, @JsonKey(name: 'clockInTime')  String? clockInTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'distance')  double? distance, @JsonKey(name: 'scheduleName')  String? scheduleName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClockInData() when $default != null:
return $default(_that.attendanceId,_that.employeeId,_that.clockInTime,_that.status,_that.distance,_that.scheduleName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'attendanceId')  String? attendanceId, @JsonKey(name: 'employeeId')  String? employeeId, @JsonKey(name: 'clockInTime')  String? clockInTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'distance')  double? distance, @JsonKey(name: 'scheduleName')  String? scheduleName)  $default,) {final _that = this;
switch (_that) {
case _ClockInData():
return $default(_that.attendanceId,_that.employeeId,_that.clockInTime,_that.status,_that.distance,_that.scheduleName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'attendanceId')  String? attendanceId, @JsonKey(name: 'employeeId')  String? employeeId, @JsonKey(name: 'clockInTime')  String? clockInTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'distance')  double? distance, @JsonKey(name: 'scheduleName')  String? scheduleName)?  $default,) {final _that = this;
switch (_that) {
case _ClockInData() when $default != null:
return $default(_that.attendanceId,_that.employeeId,_that.clockInTime,_that.status,_that.distance,_that.scheduleName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClockInData implements ClockInData {
  const _ClockInData({@JsonKey(name: 'attendanceId') this.attendanceId, @JsonKey(name: 'employeeId') this.employeeId, @JsonKey(name: 'clockInTime') this.clockInTime, @JsonKey(name: 'status') this.status, @JsonKey(name: 'distance') this.distance, @JsonKey(name: 'scheduleName') this.scheduleName});
  factory _ClockInData.fromJson(Map<String, dynamic> json) => _$ClockInDataFromJson(json);

@override@JsonKey(name: 'attendanceId') final  String? attendanceId;
@override@JsonKey(name: 'employeeId') final  String? employeeId;
@override@JsonKey(name: 'clockInTime') final  String? clockInTime;
@override@JsonKey(name: 'status') final  String? status;
@override@JsonKey(name: 'distance') final  double? distance;
@override@JsonKey(name: 'scheduleName') final  String? scheduleName;

/// Create a copy of ClockInData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockInDataCopyWith<_ClockInData> get copyWith => __$ClockInDataCopyWithImpl<_ClockInData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClockInDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockInData&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.scheduleName, scheduleName) || other.scheduleName == scheduleName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attendanceId,employeeId,clockInTime,status,distance,scheduleName);

@override
String toString() {
  return 'ClockInData(attendanceId: $attendanceId, employeeId: $employeeId, clockInTime: $clockInTime, status: $status, distance: $distance, scheduleName: $scheduleName)';
}


}

/// @nodoc
abstract mixin class _$ClockInDataCopyWith<$Res> implements $ClockInDataCopyWith<$Res> {
  factory _$ClockInDataCopyWith(_ClockInData value, $Res Function(_ClockInData) _then) = __$ClockInDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'attendanceId') String? attendanceId,@JsonKey(name: 'employeeId') String? employeeId,@JsonKey(name: 'clockInTime') String? clockInTime,@JsonKey(name: 'status') String? status,@JsonKey(name: 'distance') double? distance,@JsonKey(name: 'scheduleName') String? scheduleName
});




}
/// @nodoc
class __$ClockInDataCopyWithImpl<$Res>
    implements _$ClockInDataCopyWith<$Res> {
  __$ClockInDataCopyWithImpl(this._self, this._then);

  final _ClockInData _self;
  final $Res Function(_ClockInData) _then;

/// Create a copy of ClockInData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attendanceId = freezed,Object? employeeId = freezed,Object? clockInTime = freezed,Object? status = freezed,Object? distance = freezed,Object? scheduleName = freezed,}) {
  return _then(_ClockInData(
attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String?,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,scheduleName: freezed == scheduleName ? _self.scheduleName : scheduleName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
