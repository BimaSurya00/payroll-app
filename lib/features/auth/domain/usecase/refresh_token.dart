import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/auth/data/models/login_response.dart';
import 'package:payroll_app/features/auth/domain/repositories/auth_repository.dart';

class RefreshToken implements UseCase<LoginResponse, RefreshTokenParams> {
  final AuthRepository authRepository;

  RefreshToken(this.authRepository);

  @override
  FutureOr<Either<Failure, LoginResponse>> call(
    RefreshTokenParams params,
  ) async {
    return await authRepository.refreshToken(refreshToken: params.refreshToken);
  }
}

class RefreshTokenParams {
  final String refreshToken;

  RefreshTokenParams({required this.refreshToken});
}
