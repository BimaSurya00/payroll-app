// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClockInResponse _$ClockInResponseFromJson(Map<String, dynamic> json) =>
    _ClockInResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ClockInData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClockInResponseToJson(_ClockInResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_ClockInData _$ClockInDataFromJson(Map<String, dynamic> json) => _ClockInData(
  attendanceId: json['attendanceId'] as String?,
  employeeId: json['employeeId'] as String?,
  clockInTime: json['clockInTime'] as String?,
  status: json['status'] as String?,
  distance: (json['distance'] as num?)?.toDouble(),
  scheduleName: json['scheduleName'] as String?,
);

Map<String, dynamic> _$ClockInDataToJson(_ClockInData instance) =>
    <String, dynamic>{
      'attendanceId': instance.attendanceId,
      'employeeId': instance.employeeId,
      'clockInTime': instance.clockInTime,
      'status': instance.status,
      'distance': instance.distance,
      'scheduleName': instance.scheduleName,
    };
