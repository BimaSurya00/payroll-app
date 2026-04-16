// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    _ProfileResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(_ProfileResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => _ProfileData(
  id: json['id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
  profileImage: json['profileImage'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$ProfileDataToJson(_ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'profileImage': instance.profileImage,
      'createdAt': instance.createdAt,
    };
