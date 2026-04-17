// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyResponse _$CompanyResponseFromJson(Map<String, dynamic> json) =>
    _CompanyResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CompanyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyResponseToJson(_CompanyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) => _CompanyData(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  isActive: json['isActive'] as bool,
  plan: json['plan'] as String,
  maxEmployees: (json['maxEmployees'] as num).toInt(),
  officeLat: (json['officeLat'] as num?)?.toDouble(),
  officeLong: (json['officeLong'] as num?)?.toDouble(),
  allowedRadiusMeters: (json['allowedRadiusMeters'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$CompanyDataToJson(_CompanyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'isActive': instance.isActive,
      'plan': instance.plan,
      'maxEmployees': instance.maxEmployees,
      'officeLat': instance.officeLat,
      'officeLong': instance.officeLong,
      'allowedRadiusMeters': instance.allowedRadiusMeters,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
