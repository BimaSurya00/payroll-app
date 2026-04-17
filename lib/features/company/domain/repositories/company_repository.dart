import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/network/connection_checker.dart';
import 'package:payroll_app/features/company/data/datasources/company_remote_data_source.dart';
import 'package:payroll_app/features/company/data/models/company_response.dart';

abstract interface class CompanyRepository {
  Future<Either<Failure, CompanyData>> getCurrentCompany();
}

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;

  CompanyRepositoryImpl({
    required this.remoteDataSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<Failure, CompanyData>> getCurrentCompany() async {
    try {
      if (!await connectionChecker.isConnected) {
        return Left(Failure('No internet connection'));
      }

      final response = await remoteDataSource.getCurrentCompany();
      if (response.data == null) {
        return Left(Failure('Company data not found'));
      }
      return Right(response.data!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
