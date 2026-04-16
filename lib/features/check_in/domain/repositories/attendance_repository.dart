import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/features/check_in/data/models/clock_in_request.dart';
import 'package:payroll_app/features/check_in/data/models/clock_in_response.dart';
import 'package:payroll_app/features/check_in/data/models/clock_out_request.dart';
import 'package:payroll_app/features/check_in/data/models/clock_out_response.dart';
import 'package:payroll_app/features/check_in/data/models/attendance_history_response.dart';
import 'package:payroll_app/features/check_in/data/models/attendance_status.dart';

abstract interface class AttendanceRepository {
  Future<Either<Failure, ClockInResponse>> clockIn({
    required ClockInRequest request,
  });

  Future<Either<Failure, ClockOutResponse>> clockOut({
    required ClockOutRequest request,
  });

  Future<Either<Failure, AttendanceHistoryResponse>> getHistory({
    int page = 1,
    int perPage = 10,
  });

  Future<Either<Failure, AttendanceStatus>> getTodayStatus();
}
