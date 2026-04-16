import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/check_in/data/models/clock_in_request.dart';
import 'package:payroll_app/features/check_in/data/models/clock_in_response.dart';
import 'package:payroll_app/features/check_in/domain/repositories/attendance_repository.dart';

class ClockIn implements UseCase<ClockInResponse, ClockInRequest> {
  final AttendanceRepository repository;

  ClockIn(this.repository);

  @override
  FutureOr<Either<Failure, ClockInResponse>> call(
    ClockInRequest params,
  ) async {
    return await repository.clockIn(request: params);
  }
}
