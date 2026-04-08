import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payroll_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:payroll_app/init_dependencies.dart';

get blocs => [BlocProvider(create: (context) => serviceLocator<AuthBloc>())];
