import 'package:dio/dio.dart';
import 'package:payroll_app/core/api/api_helper.dart';
import 'package:payroll_app/features/auth/data/models/login_request.dart';
import 'package:payroll_app/features/auth/data/models/login_response.dart';

abstract interface class AuthRemoteDataSource {
  Future<LoginResponse> login({required LoginRequest request});
  Future<LoginResponse> refreshToken({required String refreshToken});
  Future<String> logout({required String refreshToken});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginResponse> login({required LoginRequest request}) async {
    return ApiHelper.request<LoginResponse>(
      url: 'http://8.215.33.70:8080/api/v1/auth/login',
      data: request.toJson(),
      method: Method.POST,
      fromJson: (json) => LoginResponse.fromJson(json),
    );
  }

  @override
  Future<LoginResponse> refreshToken({required String refreshToken}) async {
    // ✅ FIX: Use ApiHelper.refreshAccessToken which handles UserID extraction
    final result = await ApiHelper.refreshAccessToken(refreshToken);
    
    if (result == null) {
      throw Exception('Failed to refresh token');
    }
    
    // Construct LoginResponse from the result
    return LoginResponse(
      success: true,
      statusCode: 200,
      message: 'Token refreshed successfully',
      data: LoginData(
        accessToken: result['accessToken'] as String?,
        refreshToken: result['refreshToken'] as String?,
        expiresIn: result['expiresIn'] as int?,
      ),
    );
  }

  // @override
  // Future<RegisterResponse> register({required RegisterRequest request}) async {
  //   return ApiHelper.request<RegisterResponse>(
  //     // url: ApiEndpoint.login,
  //     url: 'https://gapps.siwagen.net/api/v1/auth/register',
  //     data: request.toJson(),
  //     method: Method.POST,
  //     fromJson: (json) => RegisterResponse.fromJson(json),
  //   );
  // }

  // @override
  // Future<String> sendOtp({required String phone}) async {
  //   final endpoint = 'http://8.215.33.70:8080/api/v1/forget-password';
  //   // final options = Options(headers: {'X-API-Key': AnomanApi.xApiKey});

  //   try {
  //     final response = await dio.post(
  //       endpoint,
  //       // options: options,
  //       data: {'phone': phone},
  //     );

  //     return response.data['message'];
  //   } on DioException catch (e) {
  //     if (e.response == null) {
  //       throw ServerException(e.message.toString());
  //     }

  //     if (e.response!.statusCode! < 500) {
  //       throw ClientException(
  //         'Client Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
  //       );
  //     } else {
  //       throw ServerException(
  //         'Server Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
  //       );
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // @override
  // Future<String> verifOtp({required String phone, required String otp}) async {
  //   final endpoint = 'http://8.215.33.70:8080/api/v1/validate-otp';

  //   try {
  //     final response = await dio.post(
  //       endpoint,
  //       data: {'phone': phone, 'otp': otp},
  //     );

  //     return response.data['message'] as String;
  //   } on DioException catch (e) {
  //     if (e.response == null) {
  //       throw ServerException(e.message.toString());
  //     }

  //     if (e.response!.statusCode! < 500) {
  //       throw ClientException(
  //         'Client Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
  //       );
  //     } else {
  //       throw ServerException(
  //         'Server Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
  //       );
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // @override
  // Future<String> resetPassword({
  //   required String phone,
  //   required String otp,
  //   required String password,
  // }) async {
  //   final endpoint = 'http://8.215.33.70:8080/api/v1/reset-password';
  //   // final options = Options(headers: {'X-API-Key': AnomanApi.xApiKey});

  //   try {
  //     final response = await dio.post(
  //       endpoint,
  //       // options: options,
  //       data: {'otp': otp, 'password': password, 'phone': phone},
  //     );

  //     return response.data['message'] as String;
  //   } on DioException catch (e) {
  //     if (e.response == null) {
  //       throw ServerException(e.message.toString());
  //     }

  //     if (e.response!.statusCode! < 500) {
  //       throw ClientException(
  //         'Client Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
  //       );
  //     } else {
  //       throw ServerException(
  //         'Server Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
  //       );
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  @override
  Future<String> logout({required String refreshToken}) async {
    return ApiHelper.request(
      url: 'http://8.215.33.70:8080/api/v1/auth/logout',
      method: Method.POST,
      fromJson: (json) => json['message'] as String,
      data: {'refreshToken': refreshToken},
    );
  }
}
