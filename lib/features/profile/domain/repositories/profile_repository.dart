import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/features/profile/data/models/profile_response.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileResponse>> getProfile();
}