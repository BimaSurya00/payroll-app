import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/constants/constants.dart';
import 'package:payroll_app/core/errors/exceptions.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/network/connection_checker.dart';
import 'package:payroll_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:payroll_app/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:payroll_app/features/profile/data/models/profile_response.dart';
import 'package:payroll_app/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ConnectionChecker connectionChecker;
  final AuthLocalDataSource authLocalDataSource;

  ProfileRepositoryImpl({
    required this.profileRemoteDataSource,
    required this.connectionChecker,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, ProfileResponse>> getProfile() async {
    if (!await connectionChecker.isConnected) {
      return left(Failure(Constants.noConnectionMessage));
    }
    try {
      final data = await profileRemoteDataSource.getProfile();
      return right(data);
    } on ClientException catch (e) {
      return left(Failure(e.message, e.errorDetails));
    } on ServerException catch (e) {
      return left(Failure(e.message, e.errorDetails));
    } catch (e) {
      return left(Failure('Error tidak diketahui'));
    }
  }
}
