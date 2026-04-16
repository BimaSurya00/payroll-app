import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payroll_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:payroll_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:payroll_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:payroll_app/features/check_in/presentation/bloc/attendance_bloc.dart';
import 'package:payroll_app/init_dependencies.dart';

get blocs => [
  RepositoryProvider<AuthLocalDataSource>(
    create: (context) => serviceLocator<AuthLocalDataSource>(),
  ),
  BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
  BlocProvider(create: (context) => serviceLocator<ProfileBloc>()),
  BlocProvider(create: (context) => serviceLocator<AttendanceBloc>()),
];
