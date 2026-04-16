import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/check_in/data/models/clock_out_request.dart';
import 'package:payroll_app/features/check_in/data/models/clock_out_response.dart';
import 'package:payroll_app/features/check_in/domain/repositories/attendance_repository.dart';

class ClockOut implements UseCase<ClockOutResponse, ClockOutRequest> {
  final AttendanceRepository repository;

  ClockOut(this.repository);

  @override
  FutureOr<Either<Failure, ClockOutResponse>> call(
    ClockOutRequest params,
  ) async {
    return await repository.clockOut(request: params);
  }
}
