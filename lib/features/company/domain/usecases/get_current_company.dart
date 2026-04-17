import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/company/data/models/company_response.dart';
import 'package:payroll_app/features/company/domain/repositories/company_repository.dart';

class GetCurrentCompany implements UseCase<CompanyData, NoParams> {
  final CompanyRepository repository;

  GetCurrentCompany(this.repository);

  @override
  FutureOr<Either<Failure, CompanyData>> call(NoParams params) async {
    return await repository.getCurrentCompany();
  }
}
