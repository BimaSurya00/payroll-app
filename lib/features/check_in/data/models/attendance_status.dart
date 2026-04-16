import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_status.freezed.dart';
part 'attendance_status.g.dart';

@freezed
abstract class AttendanceStatus with _$AttendanceStatus {
  const factory AttendanceStatus({
    @JsonKey(name: 'hasClockedIn') bool? hasClockedIn,
    @JsonKey(name: 'hasClockedOut') bool? hasClockedOut,
    @JsonKey(name: 'clockInTime') String? clockInTime,
    @JsonKey(name: 'clockOutTime') String? clockOutTime,
    @JsonKey(name: 'attendanceId') String? attendanceId,
    @JsonKey(name: 'status') String? status,
  }) = _AttendanceStatus;

  factory AttendanceStatus.fromJson(Map<String, dynamic> json) =>
      _$AttendanceStatusFromJson(json);
}
