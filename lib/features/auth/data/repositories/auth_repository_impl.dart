import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/constants/constants.dart';
import 'package:payroll_app/core/errors/exceptions.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/network/connection_checker.dart';
import 'package:payroll_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:payroll_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:payroll_app/features/auth/data/models/login_request.dart';
import 'package:payroll_app/features/auth/data/models/login_response.dart';
import 'package:payroll_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDatasource;
  final AuthLocalDataSource authLocalDataSource;
  final ConnectionChecker connectionChecker;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.connectionChecker,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest request,
  }) async {
    if (!await connectionChecker.isConnected) {
      return left(Failure(Constants.noConnectionMessage));
    }
    try {
      final userData = await remoteDatasource.login(request: request);
      print('LoginResponse: $userData');

      await authLocalDataSource.saveAccessToken(
        userData.data?.accessToken ?? '',
      );
      await authLocalDataSource.saveRefreshToken(
        userData.data?.refreshToken ?? '',
      );

      return right(userData);
    } on ClientException catch (e, stack) {
      print('Error di repository: $e');
      print(stack);
      return left(Failure(e.message, e.errorDetails));
    } on ServerException catch (e) {
      return left(Failure(e.message, e.errorDetails));
    } catch (e) {
      return left(Failure('Error tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> refreshToken({
    required String refreshToken,
  }) async {
    if (!await connectionChecker.isConnected) {
      return left(Failure(Constants.noConnectionMessage));
    }
    try {
      final data = await remoteDatasource.refreshToken(
        refreshToken: refreshToken,
      );

      await authLocalDataSource.saveAccessToken(data.data?.accessToken ?? '');
      await authLocalDataSource.saveRefreshToken(data.data?.refreshToken ?? '');

      return right(data);
    } on ClientException catch (e) {
      return left(Failure(e.message, e.errorDetails));
    } on ServerException catch (e) {
      return left(Failure(e.message, e.errorDetails));
    } catch (e) {
      return left(Failure('Error tidak diketahui'));
    }
  }

  // @override
  // Future<Either<Failure, RegisterResponse>> register(
  //     {required RegisterRequest request}) async {
  //   if (!await connectionChecker.isConnected) {
  //     return left(Failure(Constants.noConnectionMessage));
  //   }
  //   try {
  //     final userData = await remoteDatasource.register(request: request);
  //     print('LoginResponse: $userData');

  //     // await authLocalDataSource
  //     //     .saveAccessToken(userData.dataRegister?.accessToken ?? '');

  //     return right(userData);
  //   } on ClientException catch (e) {
  //     return left(Failure(e.message, e.errorDetails));
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message, e.errorDetails));
  //   } catch (e) {
  //     return left(Failure('Error tidak diketahui'));
  //   }
  // }

  // @override
  // Future<Either<Failure, String>> sendOtp({required String phone}) async {
  //   if (!await connectionChecker.isConnected) {
  //     return left(Failure(Constants.noConnectionMessage));
  //   }

  //   try {
  //     final userData = await remoteDatasource.sendOtp(phone: phone);
  //     // authLocalDataSource.saveToken(userData);
  //     return right(userData);
  //   } on ClientException catch (e) {
  //     return left(Failure(e.message, e.errorDetails));
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message, e.errorDetails));
  //   } catch (e) {
  //     return left(Failure('Error tidak diketahui'));
  //   }
  // }

  // @override
  // Future<Either<Failure, String>> verifOtp({
  //   required String phone,
  //   required String otp,
  // }) async {
  //   try {
  //     final userData = await remoteDatasource.verifOtp(phone: phone, otp: otp);
  //     // authLocalDataSource.saveToken(userData);
  //     return right(userData);
  //   } on ClientException catch (e) {
  //     return left(Failure(e.message, e.errorDetails));
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message, e.errorDetails));
  //   } catch (e) {
  //     return left(Failure('Error tidak diketahui'));
  //   }
  // }

  // @override
  // Future<Either<Failure, String>> resetPassword({
  //   required String phone,
  //   required String otp,
  //   required String password,
  // }) async {
  //   try {
  //     final userData = await remoteDatasource.resetPassword(
  //       phone: phone,
  //       password: password,
  //       otp: otp,
  //     );
  //     // authLocalDataSource.saveToken(userData);
  //     return right(userData);
  //   } on ClientException catch (e) {
  //     return left(Failure(e.message, e.errorDetails));
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message, e.errorDetails));
  //   } catch (e) {
  //     return left(Failure('Error tidak diketahui'));
  //   }
  // }

  Future<Either<Failure, String>> logout({required String refreshToken}) async {
    if (!await connectionChecker.isConnected) {
      return left(Failure(Constants.noConnectionMessage));
    }
    try {
      final result = await remoteDatasource.logout(refreshToken: refreshToken);
      await authLocalDataSource.deleteAll();
      return right(result);
    } on ClientException catch (e) {
      // Even if API fails, still clear local tokens
      await authLocalDataSource.deleteAll();
      return left(Failure(e.message, e.errorDetails));
    } on ServerException catch (e) {
      await authLocalDataSource.deleteAll();
      return left(Failure(e.message, e.errorDetails));
    } catch (e) {
      await authLocalDataSource.deleteAll();
      return left(Failure('Error tidak diketahui'));
    }
  }
}
