import 'package:fpdart/fpdart.dart';
import 'package:payroll_app/core/errors/failure.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/profile/data/models/profile_response.dart';
import 'package:payroll_app/features/profile/domain/repositories/profile_repository.dart';

class GetProfile implements UseCase<ProfileResponse, NoParams> {
  final ProfileRepository profileRepository;

  GetProfile(this.profileRepository);

  @override
  Future<Either<Failure, ProfileResponse>> call(NoParams params) async {
    return await profileRepository.getProfile();
  }
}
