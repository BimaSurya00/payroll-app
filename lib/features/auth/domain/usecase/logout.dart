import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/auth/domain/repositories/auth_repository.dart';

class AuthLogout implements UseCase<String, AuthLogoutParams> {
  final AuthRepository authRepository;

  AuthLogout(this.authRepository);

  @override
  FutureOr<Either<Failure, String>> call(AuthLogoutParams params) async {
    return await authRepository.logout(refreshToken: params.refreshToken);
  }
}

class AuthLogoutParams {
  final String refreshToken;

  AuthLogoutParams({required this.refreshToken});
}
