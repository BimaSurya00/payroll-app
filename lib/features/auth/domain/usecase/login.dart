import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/auth/data/models/login_request.dart';
import 'package:payroll_app/features/auth/data/models/login_response.dart';
import 'package:payroll_app/features/auth/domain/repositories/auth_repository.dart';

class Login implements UseCase<LoginResponse, LoginRequest> {
  final AuthRepository _repository;

  Login(this._repository);

  @override
  FutureOr<Either<Failure, LoginResponse>> call(LoginRequest params) async {
    return await _repository.login(request: params);
  }
}
