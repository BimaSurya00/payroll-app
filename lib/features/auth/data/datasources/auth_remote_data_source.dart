import 'package:dio/dio.dart';
import 'package:payroll_app/core/api/api_helper.dart';
import 'package:payroll_app/core/errors/exceptions.dart';
import 'package:payroll_app/features/auth/data/models/login_request.dart';
import 'package:payroll_app/features/auth/data/models/login_response.dart';

abstract interface class AuthRemoteDataSource {
  Future<LoginResponse> login({required LoginRequest request});
  // Future<RegisterResponse> register({required RegisterRequest request});
  Future<String> sendOtp({required String phone});
  Future<String> verifOtp({required String phone, required String otp});
  Future<String> resetPassword({
    required String phone,
    required String otp,
    required String password,
  });
  Future<LoginResponse> refreshToken({required String refreshToken});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginResponse> login({required LoginRequest request}) async {
    return ApiHelper.request<LoginResponse>(
      url: 'http://192.168.100.114:8080/api/v1/auth/login',
      data: request.toJson(),
      method: Method.POST,
      fromJson: (json) => LoginResponse.fromJson(json),
    );
  }

  Future<LoginResponse> refreshToken({required String refreshToken}) async {
    return ApiHelper.request(
      url: 'https://gapps.siwagen.net/api/v1/auth/refresh',
      data: {'refreshToken': refreshToken},
      method: Method.POST,
      fromJson: (json) => LoginResponse.fromJson(json),
      useToken: true,
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

  @override
  Future<String> sendOtp({required String phone}) async {
    final endpoint = 'http://192.168.10.33:3021/api/v1/forget-password';
    // final options = Options(headers: {'X-API-Key': AnomanApi.xApiKey});

    try {
      final response = await dio.post(
        endpoint,
        // options: options,
        data: {'phone': phone},
      );

      return response.data['message'];
    } on DioException catch (e) {
      if (e.response == null) {
        throw ServerException(e.message.toString());
      }

      if (e.response!.statusCode! < 500) {
        throw ClientException(
          'Client Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
        );
      } else {
        throw ServerException(
          'Server Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> verifOtp({required String phone, required String otp}) async {
    final endpoint = 'http://192.168.10.33:3021/api/v1/validate-otp';

    try {
      final response = await dio.post(
        endpoint,
        data: {'phone': phone, 'otp': otp},
      );

      return response.data['message'] as String;
    } on DioException catch (e) {
      if (e.response == null) {
        throw ServerException(e.message.toString());
      }

      if (e.response!.statusCode! < 500) {
        throw ClientException(
          'Client Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
        );
      } else {
        throw ServerException(
          'Server Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> resetPassword({
    required String phone,
    required String otp,
    required String password,
  }) async {
    final endpoint = 'http://192.168.10.33:3021/api/v1/reset-password';
    // final options = Options(headers: {'X-API-Key': AnomanApi.xApiKey});

    try {
      final response = await dio.post(
        endpoint,
        // options: options,
        data: {'otp': otp, 'password': password, 'phone': phone},
      );

      return response.data['message'] as String;
    } on DioException catch (e) {
      if (e.response == null) {
        throw ServerException(e.message.toString());
      }

      if (e.response!.statusCode! < 500) {
        throw ClientException(
          'Client Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
        );
      } else {
        throw ServerException(
          'Server Error Status Code: ${e.response!.statusCode} -> ${e.response!.statusMessage}',
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
