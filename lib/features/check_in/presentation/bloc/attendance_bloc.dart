import 'package:bloc/bloc.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/check_in/data/models/clock_in_request.dart';
import 'package:payroll_app/features/check_in/data/models/clock_in_response.dart';
import 'package:payroll_app/features/check_in/data/models/clock_out_request.dart';
import 'package:payroll_app/features/check_in/data/models/clock_out_response.dart';
import 'package:payroll_app/features/check_in/data/models/attendance_history_response.dart';
import 'package:payroll_app/features/check_in/data/models/attendance_status.dart';
import 'package:payroll_app/features/check_in/data/models/pagination.dart';
import 'package:payroll_app/features/check_in/domain/usecases/clock_in.dart';
import 'package:payroll_app/features/check_in/domain/usecases/clock_out.dart';
import 'package:payroll_app/features/check_in/domain/usecases/get_attendance_status.dart';
import 'package:payroll_app/features/check_in/domain/usecases/get_attendance_history.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final ClockIn _clockIn;
  final ClockOut _clockOut;
  final GetAttendanceStatus _getAttendanceStatus;
  final GetAttendanceHistory _getAttendanceHistory;

  AttendanceBloc({
    required ClockIn clockIn,
    required ClockOut clockOut,
    required GetAttendanceStatus getAttendanceStatus,
    required GetAttendanceHistory getAttendanceHistory,
  })  : _clockIn = clockIn,
        _clockOut = clockOut,
        _getAttendanceStatus = getAttendanceStatus,
        _getAttendanceHistory = getAttendanceHistory,
        super(AttendanceInitial()) {
    on<OnLoadPage>(_onLoadPage);
    on<OnClockIn>(_onClockIn);
    on<OnClockOut>(_onClockOut);
    on<OnGetHistory>(_onGetHistory);
    on<OnRefreshStatus>(_onRefreshStatus);
  }

  void _onLoadPage(OnLoadPage event, Emitter<AttendanceState> emit) async {
    emit(AttendanceLoading());
    final result = await _getAttendanceStatus.call(NoParams());
    result.fold(
      (l) => emit(AttendanceError(l.message)),
      (r) => emit(StatusLoaded(r)),
    );
  }

  void _onClockIn(OnClockIn event, Emitter<AttendanceState> emit) async {
    emit(ClockInLoading());
    final result = await _clockIn.call(
      ClockInRequest(lat: event.lat, long: event.long),
    );
    result.fold(
      (l) => emit(ClockInFailure(l.message, errors: l.errorDetails)),
      (r) => emit(ClockInSuccess(r)),
    );
  }

  void _onClockOut(OnClockOut event, Emitter<AttendanceState> emit) async {
    emit(ClockOutLoading());
    final result = await _clockOut.call(
      ClockOutRequest(lat: event.lat, long: event.long),
    );
    result.fold(
      (l) => emit(ClockOutFailure(l.message, errors: l.errorDetails)),
      (r) => emit(ClockOutSuccess(r)),
    );
  }

  void _onGetHistory(
    OnGetHistory event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(HistoryLoading());
    final result = await _getAttendanceHistory.call(
      GetAttendanceHistoryParams(
        page: event.page,
        perPage: event.perPage,
      ),
    );
    result.fold(
      (l) => emit(HistoryFailure(l.message)),
      (r) => emit(HistoryLoaded(
        r.data ?? [],
        pagination: r.pagination,
      )),
    );
  }

  void _onRefreshStatus(
    OnRefreshStatus event,
    Emitter<AttendanceState> emit,
  ) async {
    final result = await _getAttendanceStatus.call(NoParams());
    result.fold(
      (l) => emit(AttendanceError(l.message)),
      (r) => emit(StatusLoaded(r)),
    );
  }
}
