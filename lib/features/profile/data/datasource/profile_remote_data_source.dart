import 'package:payroll_app/core/api/api_helper.dart';
import 'package:payroll_app/features/profile/data/models/profile_response.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponse> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<ProfileResponse> getProfile() async {
    return ApiHelper.request(
      url: 'http://8.215.33.70:8080/api/v1/users/me',
      method: Method.GET,
      fromJson: (json) => ProfileResponse.fromJson(json),
      useToken: true,
    );
  }
}
