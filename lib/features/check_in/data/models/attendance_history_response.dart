import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payroll_app/features/check_in/data/models/pagination.dart';

part 'attendance_history_response.freezed.dart';
part 'attendance_history_response.g.dart';

@freezed
abstract class AttendanceHistoryResponse with _$AttendanceHistoryResponse {
  const factory AttendanceHistoryResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'statusCode') int? statusCode,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') List<AttendanceHistoryItem>? data,
    @JsonKey(name: 'pagination') Pagination? pagination,
  }) = _AttendanceHistoryResponse;

  factory AttendanceHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceHistoryResponseFromJson(json);
}

@freezed
abstract class AttendanceHistoryItem with _$AttendanceHistoryItem {
  const factory AttendanceHistoryItem({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'clockInTime') String? clockInTime,
    @JsonKey(name: 'clockOutTime') String? clockOutTime,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(name: 'scheduleName') String? scheduleName,
  }) = _AttendanceHistoryItem;

  factory AttendanceHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$AttendanceHistoryItemFromJson(json);
}
