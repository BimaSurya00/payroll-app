// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceHistoryResponse _$AttendanceHistoryResponseFromJson(
  Map<String, dynamic> json,
) => _AttendanceHistoryResponse(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => AttendanceHistoryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AttendanceHistoryResponseToJson(
  _AttendanceHistoryResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
};

_AttendanceHistoryItem _$AttendanceHistoryItemFromJson(
  Map<String, dynamic> json,
) => _AttendanceHistoryItem(
  id: json['id'] as String?,
  date: json['date'] as String?,
  clockInTime: json['clockInTime'] as String?,
  clockOutTime: json['clockOutTime'] as String?,
  status: json['status'] as String?,
  notes: json['notes'] as String?,
  scheduleName: json['scheduleName'] as String?,
);

Map<String, dynamic> _$AttendanceHistoryItemToJson(
  _AttendanceHistoryItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date,
  'clockInTime': instance.clockInTime,
  'clockOutTime': instance.clockOutTime,
  'status': instance.status,
  'notes': instance.notes,
  'scheduleName': instance.scheduleName,
};
