part of 'attendance_bloc.dart';

abstract class AttendanceEvent {}

class OnLoadPage extends AttendanceEvent {}

class OnClockIn extends AttendanceEvent {
  final double lat;
  final double long;

  OnClockIn(this.lat, this.long);
}

class OnClockOut extends AttendanceEvent {
  final double lat;
  final double long;

  OnClockOut(this.lat, this.long);
}

class OnGetHistory extends AttendanceEvent {
  final int page;
  final int perPage;

  OnGetHistory({this.page = 1, this.perPage = 10});
}

class OnRefreshStatus extends AttendanceEvent {}
