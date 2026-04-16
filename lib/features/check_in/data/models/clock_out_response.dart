import 'package:freezed_annotation/freezed_annotation.dart';

part 'clock_out_response.freezed.dart';
part 'clock_out_response.g.dart';

@freezed
abstract class ClockOutResponse with _$ClockOutResponse {
  const factory ClockOutResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'statusCode') int? statusCode,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') ClockOutData? data,
  }) = _ClockOutResponse;

  factory ClockOutResponse.fromJson(Map<String, dynamic> json) =>
      _$ClockOutResponseFromJson(json);
}

@freezed
abstract class ClockOutData with _$ClockOutData {
  const factory ClockOutData({
    @JsonKey(name: 'attendanceId') String? attendanceId,
    @JsonKey(name: 'clockOutTime') String? clockOutTime,
    @JsonKey(name: 'distance') double? distance,
  }) = _ClockOutData;

  factory ClockOutData.fromJson(Map<String, dynamic> json) =>
      _$ClockOutDataFromJson(json);
}
