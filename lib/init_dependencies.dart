import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:payroll_app/core/api/api_helper.dart';
import 'package:payroll_app/core/network/connection_checker.dart';
import 'package:payroll_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:payroll_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:payroll_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:payroll_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:payroll_app/features/auth/domain/usecase/login.dart';
import 'package:payroll_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'init_dependencies.main.dart';
