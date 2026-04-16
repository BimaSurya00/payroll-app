// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_out_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClockOutResponse _$ClockOutResponseFromJson(Map<String, dynamic> json) =>
    _ClockOutResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ClockOutData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClockOutResponseToJson(_ClockOutResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_ClockOutData _$ClockOutDataFromJson(Map<String, dynamic> json) =>
    _ClockOutData(
      attendanceId: json['attendanceId'] as String?,
      clockOutTime: json['clockOutTime'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ClockOutDataToJson(_ClockOutData instance) =>
    <String, dynamic>{
      'attendanceId': instance.attendanceId,
      'clockOutTime': instance.clockOutTime,
      'distance': instance.distance,
    };
