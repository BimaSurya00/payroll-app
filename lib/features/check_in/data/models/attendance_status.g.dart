// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceStatus _$AttendanceStatusFromJson(Map<String, dynamic> json) =>
    _AttendanceStatus(
      hasClockedIn: json['hasClockedIn'] as bool?,
      hasClockedOut: json['hasClockedOut'] as bool?,
      clockInTime: json['clockInTime'] as String?,
      clockOutTime: json['clockOutTime'] as String?,
      attendanceId: json['attendanceId'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AttendanceStatusToJson(_AttendanceStatus instance) =>
    <String, dynamic>{
      'hasClockedIn': instance.hasClockedIn,
      'hasClockedOut': instance.hasClockedOut,
      'clockInTime': instance.clockInTime,
      'clockOutTime': instance.clockOutTime,
      'attendanceId': instance.attendanceId,
      'status': instance.status,
    };
