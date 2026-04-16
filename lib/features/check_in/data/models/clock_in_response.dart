import 'package:freezed_annotation/freezed_annotation.dart';

part 'clock_in_response.freezed.dart';
part 'clock_in_response.g.dart';

@freezed
abstract class ClockInResponse with _$ClockInResponse {
  const factory ClockInResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'statusCode') int? statusCode,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') ClockInData? data,
  }) = _ClockInResponse;

  factory ClockInResponse.fromJson(Map<String, dynamic> json) =>
      _$ClockInResponseFromJson(json);
}

@freezed
abstract class ClockInData with _$ClockInData {
  const factory ClockInData({
    @JsonKey(name: 'attendanceId') String? attendanceId,
    @JsonKey(name: 'employeeId') String? employeeId,
    @JsonKey(name: 'clockInTime') String? clockInTime,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'distance') double? distance,
    @JsonKey(name: 'scheduleName') String? scheduleName,
  }) = _ClockInData;

  factory ClockInData.fromJson(Map<String, dynamic> json) =>
      _$ClockInDataFromJson(json);
}
