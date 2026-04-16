import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/network/connection_checker.dart';
import 'package:payroll_app/features/check_in/data/datasources/attendance_remote_data_source.dart';
import 'package:payroll_app/features/check_in/data/models/clock_in_request.dart';
import 'package:payroll_app/features/check_in/data/models/clock_in_response.dart';
import 'package:payroll_app/features/check_in/data/models/clock_out_request.dart';
import 'package:payroll_app/features/check_in/data/models/clock_out_response.dart';
import 'package:payroll_app/features/check_in/data/models/attendance_history_response.dart';
import 'package:payroll_app/features/check_in/data/models/attendance_status.dart';
import 'package:payroll_app/features/check_in/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;

  AttendanceRepositoryImpl({
    required this.remoteDataSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<Failure, ClockInResponse>> clockIn({
    required ClockInRequest request,
  }) async {
    try {
      if (!await connectionChecker.isConnected) {
        return Left(Failure('No internet connection'));
      }

      final response = await remoteDataSource.clockIn(request: request);
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ClockOutResponse>> clockOut({
    required ClockOutRequest request,
  }) async {
    try {
      if (!await connectionChecker.isConnected) {
        return Left(Failure('No internet connection'));
      }

      final response = await remoteDataSource.clockOut(request: request);
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AttendanceHistoryResponse>> getHistory({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      if (!await connectionChecker.isConnected) {
        return Left(Failure('No internet connection'));
      }

      final response = await remoteDataSource.getHistory(
        page: page,
        perPage: perPage,
      );
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AttendanceStatus>> getTodayStatus() async {
    try {
      if (!await connectionChecker.isConnected) {
        return Left(Failure('No internet connection'));
      }

      // Get today's attendance from history (first page)
      final response = await remoteDataSource.getHistory(page: 1, perPage: 1);
      
      if (response.data != null && response.data!.isNotEmpty) {
        final todayAttendance = response.data!.first;
        // Parse today's date
        final today = DateTime.now().toIso8601String().split('T')[0];
        final attendanceDate = todayAttendance.date?.split('T')[0] ?? '';
        
        if (attendanceDate == today) {
          return Right(AttendanceStatus(
            hasClockedIn: todayAttendance.clockInTime != null,
            hasClockedOut: todayAttendance.clockOutTime != null,
            clockInTime: todayAttendance.clockInTime,
            clockOutTime: todayAttendance.clockOutTime,
            attendanceId: todayAttendance.id,
            status: todayAttendance.status,
          ));
        }
      }
      
      // No attendance record for today
      return Right(const AttendanceStatus(
        hasClockedIn: false,
        hasClockedOut: false,
      ));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
