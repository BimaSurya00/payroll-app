// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceStatus {

@JsonKey(name: 'hasClockedIn') bool? get hasClockedIn;@JsonKey(name: 'hasClockedOut') bool? get hasClockedOut;@JsonKey(name: 'clockInTime') String? get clockInTime;@JsonKey(name: 'clockOutTime') String? get clockOutTime;@JsonKey(name: 'attendanceId') String? get attendanceId;@JsonKey(name: 'status') String? get status;
/// Create a copy of AttendanceStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceStatusCopyWith<AttendanceStatus> get copyWith => _$AttendanceStatusCopyWithImpl<AttendanceStatus>(this as AttendanceStatus, _$identity);

  /// Serializes this AttendanceStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceStatus&&(identical(other.hasClockedIn, hasClockedIn) || other.hasClockedIn == hasClockedIn)&&(identical(other.hasClockedOut, hasClockedOut) || other.hasClockedOut == hasClockedOut)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasClockedIn,hasClockedOut,clockInTime,clockOutTime,attendanceId,status);

@override
String toString() {
  return 'AttendanceStatus(hasClockedIn: $hasClockedIn, hasClockedOut: $hasClockedOut, clockInTime: $clockInTime, clockOutTime: $clockOutTime, attendanceId: $attendanceId, status: $status)';
}


}

/// @nodoc
abstract mixin class $AttendanceStatusCopyWith<$Res>  {
  factory $AttendanceStatusCopyWith(AttendanceStatus value, $Res Function(AttendanceStatus) _then) = _$AttendanceStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hasClockedIn') bool? hasClockedIn,@JsonKey(name: 'hasClockedOut') bool? hasClockedOut,@JsonKey(name: 'clockInTime') String? clockInTime,@JsonKey(name: 'clockOutTime') String? clockOutTime,@JsonKey(name: 'attendanceId') String? attendanceId,@JsonKey(name: 'status') String? status
});




}
/// @nodoc
class _$AttendanceStatusCopyWithImpl<$Res>
    implements $AttendanceStatusCopyWith<$Res> {
  _$AttendanceStatusCopyWithImpl(this._self, this._then);

  final AttendanceStatus _self;
  final $Res Function(AttendanceStatus) _then;

/// Create a copy of AttendanceStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasClockedIn = freezed,Object? hasClockedOut = freezed,Object? clockInTime = freezed,Object? clockOutTime = freezed,Object? attendanceId = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
hasClockedIn: freezed == hasClockedIn ? _self.hasClockedIn : hasClockedIn // ignore: cast_nullable_to_non_nullable
as bool?,hasClockedOut: freezed == hasClockedOut ? _self.hasClockedOut : hasClockedOut // ignore: cast_nullable_to_non_nullable
as bool?,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as String?,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as String?,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceStatus].
extension AttendanceStatusPatterns on AttendanceStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceStatus value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceStatus value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hasClockedIn')  bool? hasClockedIn, @JsonKey(name: 'hasClockedOut')  bool? hasClockedOut, @JsonKey(name: 'clockInTime')  String? clockInTime, @JsonKey(name: 'clockOutTime')  String? clockOutTime, @JsonKey(name: 'attendanceId')  String? attendanceId, @JsonKey(name: 'status')  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceStatus() when $default != null:
return $default(_that.hasClockedIn,_that.hasClockedOut,_that.clockInTime,_that.clockOutTime,_that.attendanceId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hasClockedIn')  bool? hasClockedIn, @JsonKey(name: 'hasClockedOut')  bool? hasClockedOut, @JsonKey(name: 'clockInTime')  String? clockInTime, @JsonKey(name: 'clockOutTime')  String? clockOutTime, @JsonKey(name: 'attendanceId')  String? attendanceId, @JsonKey(name: 'status')  String? status)  $default,) {final _that = this;
switch (_that) {
case _AttendanceStatus():
return $default(_that.hasClockedIn,_that.hasClockedOut,_that.clockInTime,_that.clockOutTime,_that.attendanceId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hasClockedIn')  bool? hasClockedIn, @JsonKey(name: 'hasClockedOut')  bool? hasClockedOut, @JsonKey(name: 'clockInTime')  String? clockInTime, @JsonKey(name: 'clockOutTime')  String? clockOutTime, @JsonKey(name: 'attendanceId')  String? attendanceId, @JsonKey(name: 'status')  String? status)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceStatus() when $default != null:
return $default(_that.hasClockedIn,_that.hasClockedOut,_that.clockInTime,_that.clockOutTime,_that.attendanceId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceStatus implements AttendanceStatus {
  const _AttendanceStatus({@JsonKey(name: 'hasClockedIn') this.hasClockedIn, @JsonKey(name: 'hasClockedOut') this.hasClockedOut, @JsonKey(name: 'clockInTime') this.clockInTime, @JsonKey(name: 'clockOutTime') this.clockOutTime, @JsonKey(name: 'attendanceId') this.attendanceId, @JsonKey(name: 'status') this.status});
  factory _AttendanceStatus.fromJson(Map<String, dynamic> json) => _$AttendanceStatusFromJson(json);

@override@JsonKey(name: 'hasClockedIn') final  bool? hasClockedIn;
@override@JsonKey(name: 'hasClockedOut') final  bool? hasClockedOut;
@override@JsonKey(name: 'clockInTime') final  String? clockInTime;
@override@JsonKey(name: 'clockOutTime') final  String? clockOutTime;
@override@JsonKey(name: 'attendanceId') final  String? attendanceId;
@override@JsonKey(name: 'status') final  String? status;

/// Create a copy of AttendanceStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceStatusCopyWith<_AttendanceStatus> get copyWith => __$AttendanceStatusCopyWithImpl<_AttendanceStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceStatus&&(identical(other.hasClockedIn, hasClockedIn) || other.hasClockedIn == hasClockedIn)&&(identical(other.hasClockedOut, hasClockedOut) || other.hasClockedOut == hasClockedOut)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasClockedIn,hasClockedOut,clockInTime,clockOutTime,attendanceId,status);

@override
String toString() {
  return 'AttendanceStatus(hasClockedIn: $hasClockedIn, hasClockedOut: $hasClockedOut, clockInTime: $clockInTime, clockOutTime: $clockOutTime, attendanceId: $attendanceId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AttendanceStatusCopyWith<$Res> implements $AttendanceStatusCopyWith<$Res> {
  factory _$AttendanceStatusCopyWith(_AttendanceStatus value, $Res Function(_AttendanceStatus) _then) = __$AttendanceStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hasClockedIn') bool? hasClockedIn,@JsonKey(name: 'hasClockedOut') bool? hasClockedOut,@JsonKey(name: 'clockInTime') String? clockInTime,@JsonKey(name: 'clockOutTime') String? clockOutTime,@JsonKey(name: 'attendanceId') String? attendanceId,@JsonKey(name: 'status') String? status
});




}
/// @nodoc
class __$AttendanceStatusCopyWithImpl<$Res>
    implements _$AttendanceStatusCopyWith<$Res> {
  __$AttendanceStatusCopyWithImpl(this._self, this._then);

  final _AttendanceStatus _self;
  final $Res Function(_AttendanceStatus) _then;

/// Create a copy of AttendanceStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasClockedIn = freezed,Object? hasClockedOut = freezed,Object? clockInTime = freezed,Object? clockOutTime = freezed,Object? attendanceId = freezed,Object? status = freezed,}) {
  return _then(_AttendanceStatus(
hasClockedIn: freezed == hasClockedIn ? _self.hasClockedIn : hasClockedIn // ignore: cast_nullable_to_non_nullable
as bool?,hasClockedOut: freezed == hasClockedOut ? _self.hasClockedOut : hasClockedOut // ignore: cast_nullable_to_non_nullable
as bool?,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as String?,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as String?,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
