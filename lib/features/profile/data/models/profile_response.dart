// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'statusCode') int? statusCode,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, Object?> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'profileImage') String? profileImage,
    @JsonKey(name: 'created_at') String? createdAt,
    // @JsonKey(name: 'token') String? token,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}
