import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
abstract class Pagination with _$Pagination {
  const factory Pagination({
    @JsonKey(name: 'currentPage') int? currentPage,
    @JsonKey(name: 'perPage') int? perPage,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'lastPage') int? lastPage,
    @JsonKey(name: 'firstPageUrl') String? firstPageUrl,
    @JsonKey(name: 'lastPageUrl') String? lastPageUrl,
    @JsonKey(name: 'nextPageUrl') String? nextPageUrl,
    @JsonKey(name: 'prevPageUrl') String? prevPageUrl,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
