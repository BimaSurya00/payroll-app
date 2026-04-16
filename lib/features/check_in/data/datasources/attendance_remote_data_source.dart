import 'package:payroll_app/core/api/api_helper.dart';
import 'package:payroll_app/features/check_in/data/models/clock_in_request.dart';
import 'package:payroll_app/features/check_in/data/models/clock_in_response.dart';
import 'package:payroll_app/features/check_in/data/models/clock_out_request.dart';
import 'package:payroll_app/features/check_in/data/models/clock_out_response.dart';
import 'package:payroll_app/features/check_in/data/models/attendance_history_response.dart';

abstract interface class AttendanceRemoteDataSource {
  Future<ClockInResponse> clockIn({required ClockInRequest request});
  Future<ClockOutResponse> clockOut({required ClockOutRequest request});
  Future<AttendanceHistoryResponse> getHistory({
    int page = 1,
    int perPage = 10,
  });
}

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  AttendanceRemoteDataSourceImpl();

  @override
  Future<ClockInResponse> clockIn({required ClockInRequest request}) async {
    return ApiHelper.request<ClockInResponse>(
      url: 'http://8.215.33.70:8080/api/v1/attendance/clock-in',
      data: request.toJson(),
      method: Method.POST,
      fromJson: (json) => ClockInResponse.fromJson(json),
    );
  }

  @override
  Future<ClockOutResponse> clockOut({required ClockOutRequest request}) async {
    return ApiHelper.request<ClockOutResponse>(
      url: 'http://8.215.33.70:8080/api/v1/attendance/clock-out',
      data: request.toJson(),
      method: Method.POST,
      fromJson: (json) => ClockOutResponse.fromJson(json),
    );
  }

  @override
  Future<AttendanceHistoryResponse> getHistory({
    int page = 1,
    int perPage = 10,
  }) async {
    return ApiHelper.request<AttendanceHistoryResponse>(
      url: 'http://8.215.33.70:8080/api/v1/attendance/history',
      method: Method.GET,
      queryParams: {
        'page': page,
        'per_page': perPage,
      },
      fromJson: (json) => AttendanceHistoryResponse.fromJson(json),
    );
  }
}
