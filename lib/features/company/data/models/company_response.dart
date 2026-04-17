import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_response.freezed.dart';
part 'company_response.g.dart';

@freezed
abstract class CompanyResponse with _$CompanyResponse {
  factory CompanyResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'statusCode') int? statusCode,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') CompanyData? data,
  }) = _CompanyResponse;

  factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseFromJson(json);
}

@freezed
abstract class CompanyData with _$CompanyData {
  const CompanyData._();

  const factory CompanyData({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'isActive') required bool isActive,
    @JsonKey(name: 'plan') required String plan,
    @JsonKey(name: 'maxEmployees') required int maxEmployees,
    @JsonKey(name: 'officeLat') double? officeLat,
    @JsonKey(name: 'officeLong') double? officeLong,
    @JsonKey(name: 'allowedRadiusMeters') int? allowedRadiusMeters,
    @JsonKey(name: 'createdAt') required String createdAt,
    @JsonKey(name: 'updatedAt') required String updatedAt,
  }) = _CompanyData;

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);

  bool get hasOfficeLocation =>
      officeLat != null && officeLong != null && allowedRadiusMeters != null;
}
