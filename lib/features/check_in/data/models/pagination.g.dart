// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pagination _$PaginationFromJson(Map<String, dynamic> json) => _Pagination(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  perPage: (json['perPage'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  lastPage: (json['lastPage'] as num?)?.toInt(),
  firstPageUrl: json['firstPageUrl'] as String?,
  lastPageUrl: json['lastPageUrl'] as String?,
  nextPageUrl: json['nextPageUrl'] as String?,
  prevPageUrl: json['prevPageUrl'] as String?,
);

Map<String, dynamic> _$PaginationToJson(_Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'perPage': instance.perPage,
      'total': instance.total,
      'lastPage': instance.lastPage,
      'firstPageUrl': instance.firstPageUrl,
      'lastPageUrl': instance.lastPageUrl,
      'nextPageUrl': instance.nextPageUrl,
      'prevPageUrl': instance.prevPageUrl,
    };
