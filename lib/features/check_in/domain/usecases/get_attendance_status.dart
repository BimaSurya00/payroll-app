import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/check_in/data/models/attendance_status.dart';
import 'package:payroll_app/features/check_in/domain/repositories/attendance_repository.dart';

class GetAttendanceStatus implements UseCase<AttendanceStatus, NoParams> {
  final AttendanceRepository repository;

  GetAttendanceStatus(this.repository);

  @override
  FutureOr<Either<Failure, AttendanceStatus>> call(NoParams params) async {
    return await repository.getTodayStatus();
  }
}
