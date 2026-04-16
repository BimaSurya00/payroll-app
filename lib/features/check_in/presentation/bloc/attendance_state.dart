part of 'attendance_bloc.dart';

abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

// Status states
class StatusLoaded extends AttendanceState {
  final AttendanceStatus status;
  StatusLoaded(this.status);
}

// Action states
class ClockInLoading extends AttendanceState {}

class ClockOutLoading extends AttendanceState {}

class ClockInSuccess extends AttendanceState {
  final ClockInResponse response;
  ClockInSuccess(this.response);
}

class ClockInFailure extends AttendanceState {
  final String message;
  final String? errors;
  ClockInFailure(this.message, {this.errors});
}

class ClockOutSuccess extends AttendanceState {
  final ClockOutResponse response;
  ClockOutSuccess(this.response);
}

class ClockOutFailure extends AttendanceState {
  final String message;
  final String? errors;
  ClockOutFailure(this.message, {this.errors});
}

// History states
class HistoryLoading extends AttendanceState {}

class HistoryLoaded extends AttendanceState {
  final List<AttendanceHistoryItem> history;
  final Pagination? pagination;
  HistoryLoaded(this.history, {this.pagination});
}

class HistoryFailure extends AttendanceState {
  final String message;
  HistoryFailure(this.message);
}

// Combined error state
class AttendanceError extends AttendanceState {
  final String message;
  AttendanceError(this.message);
}
