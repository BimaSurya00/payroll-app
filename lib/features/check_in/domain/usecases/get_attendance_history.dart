import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/check_in/data/models/attendance_history_response.dart';
import 'package:payroll_app/features/check_in/domain/repositories/attendance_repository.dart';

class GetAttendanceHistoryParams {
  final int page;
  final int perPage;

  GetAttendanceHistoryParams({
    this.page = 1,
    this.perPage = 10,
  });
}

class GetAttendanceHistory
    implements UseCase<AttendanceHistoryResponse, GetAttendanceHistoryParams> {
  final AttendanceRepository repository;

  GetAttendanceHistory(this.repository);

  @override
  FutureOr<Either<Failure, AttendanceHistoryResponse>> call(
    GetAttendanceHistoryParams params,
  ) async {
    return await repository.getHistory(
      page: params.page,
      perPage: params.perPage,
    );
  }
}
