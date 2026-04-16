import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/features/auth/data/models/login_request.dart';
import 'package:payroll_app/features/auth/data/models/login_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login({required LoginRequest request});
  // Future<Either<Failure, RegisterResponse>> register(
  //     {required RegisterRequest request});

  // Future<Either<Failure, String>> sendOtp({required String phone});
  // Future<Either<Failure, String>> verifOtp({
  //   required String otp,
  //   required String phone,
  // });

  // Future<Either<Failure, String>> resetPassword({
  //   required String phone,
  //   required String otp,
  //   required String password,
  // });
  Future<Either<Failure, LoginResponse>> refreshToken({
    required String refreshToken,
  });

  Future<Either<Failure, String>> logout({required String refreshToken});
}
