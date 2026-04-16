import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'statusCode') int? statusCode,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') LoginData? data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class LoginData with _$LoginData {
  const factory LoginData({
    @JsonKey(name: 'user') UserLogin? user,
    @JsonKey(name: 'accessToken') String? accessToken,
    @JsonKey(name: 'refreshToken') String? refreshToken,
    @JsonKey(name: 'expiresIn') int? expiresIn,
    @JsonKey(name: 'expiresAt')
    int? expiresAt, // ✅ Add: Unix timestamp dari backend
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, Object?> json) =>
      _$LoginDataFromJson(json);
}

@freezed
abstract class UserLogin with _$UserLogin {
  const factory UserLogin({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'profileImage') String? profileImage,
    @JsonKey(name: 'createdAt') String? createdAt,
  }) = _UserLogin;

  factory UserLogin.fromJson(Map<String, Object?> json) =>
      _$UserLoginFromJson(json);
}
