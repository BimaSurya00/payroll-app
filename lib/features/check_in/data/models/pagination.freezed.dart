// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pagination {

@JsonKey(name: 'currentPage') int? get currentPage;@JsonKey(name: 'perPage') int? get perPage;@JsonKey(name: 'total') int? get total;@JsonKey(name: 'lastPage') int? get lastPage;@JsonKey(name: 'firstPageUrl') String? get firstPageUrl;@JsonKey(name: 'lastPageUrl') String? get lastPageUrl;@JsonKey(name: 'nextPageUrl') String? get nextPageUrl;@JsonKey(name: 'prevPageUrl') String? get prevPageUrl;
/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationCopyWith<Pagination> get copyWith => _$PaginationCopyWithImpl<Pagination>(this as Pagination, _$identity);

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pagination&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.firstPageUrl, firstPageUrl) || other.firstPageUrl == firstPageUrl)&&(identical(other.lastPageUrl, lastPageUrl) || other.lastPageUrl == lastPageUrl)&&(identical(other.nextPageUrl, nextPageUrl) || other.nextPageUrl == nextPageUrl)&&(identical(other.prevPageUrl, prevPageUrl) || other.prevPageUrl == prevPageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,perPage,total,lastPage,firstPageUrl,lastPageUrl,nextPageUrl,prevPageUrl);

@override
String toString() {
  return 'Pagination(currentPage: $currentPage, perPage: $perPage, total: $total, lastPage: $lastPage, firstPageUrl: $firstPageUrl, lastPageUrl: $lastPageUrl, nextPageUrl: $nextPageUrl, prevPageUrl: $prevPageUrl)';
}


}

/// @nodoc
abstract mixin class $PaginationCopyWith<$Res>  {
  factory $PaginationCopyWith(Pagination value, $Res Function(Pagination) _then) = _$PaginationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'currentPage') int? currentPage,@JsonKey(name: 'perPage') int? perPage,@JsonKey(name: 'total') int? total,@JsonKey(name: 'lastPage') int? lastPage,@JsonKey(name: 'firstPageUrl') String? firstPageUrl,@JsonKey(name: 'lastPageUrl') String? lastPageUrl,@JsonKey(name: 'nextPageUrl') String? nextPageUrl,@JsonKey(name: 'prevPageUrl') String? prevPageUrl
});




}
/// @nodoc
class _$PaginationCopyWithImpl<$Res>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._self, this._then);

  final Pagination _self;
  final $Res Function(Pagination) _then;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = freezed,Object? perPage = freezed,Object? total = freezed,Object? lastPage = freezed,Object? firstPageUrl = freezed,Object? lastPageUrl = freezed,Object? nextPageUrl = freezed,Object? prevPageUrl = freezed,}) {
  return _then(_self.copyWith(
currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,lastPage: freezed == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int?,firstPageUrl: freezed == firstPageUrl ? _self.firstPageUrl : firstPageUrl // ignore: cast_nullable_to_non_nullable
as String?,lastPageUrl: freezed == lastPageUrl ? _self.lastPageUrl : lastPageUrl // ignore: cast_nullable_to_non_nullable
as String?,nextPageUrl: freezed == nextPageUrl ? _self.nextPageUrl : nextPageUrl // ignore: cast_nullable_to_non_nullable
as String?,prevPageUrl: freezed == prevPageUrl ? _self.prevPageUrl : prevPageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Pagination].
extension PaginationPatterns on Pagination {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pagination value)  $default,){
final _that = this;
switch (_that) {
case _Pagination():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pagination value)?  $default,){
final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'currentPage')  int? currentPage, @JsonKey(name: 'perPage')  int? perPage, @JsonKey(name: 'total')  int? total, @JsonKey(name: 'lastPage')  int? lastPage, @JsonKey(name: 'firstPageUrl')  String? firstPageUrl, @JsonKey(name: 'lastPageUrl')  String? lastPageUrl, @JsonKey(name: 'nextPageUrl')  String? nextPageUrl, @JsonKey(name: 'prevPageUrl')  String? prevPageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that.currentPage,_that.perPage,_that.total,_that.lastPage,_that.firstPageUrl,_that.lastPageUrl,_that.nextPageUrl,_that.prevPageUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'currentPage')  int? currentPage, @JsonKey(name: 'perPage')  int? perPage, @JsonKey(name: 'total')  int? total, @JsonKey(name: 'lastPage')  int? lastPage, @JsonKey(name: 'firstPageUrl')  String? firstPageUrl, @JsonKey(name: 'lastPageUrl')  String? lastPageUrl, @JsonKey(name: 'nextPageUrl')  String? nextPageUrl, @JsonKey(name: 'prevPageUrl')  String? prevPageUrl)  $default,) {final _that = this;
switch (_that) {
case _Pagination():
return $default(_that.currentPage,_that.perPage,_that.total,_that.lastPage,_that.firstPageUrl,_that.lastPageUrl,_that.nextPageUrl,_that.prevPageUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'currentPage')  int? currentPage, @JsonKey(name: 'perPage')  int? perPage, @JsonKey(name: 'total')  int? total, @JsonKey(name: 'lastPage')  int? lastPage, @JsonKey(name: 'firstPageUrl')  String? firstPageUrl, @JsonKey(name: 'lastPageUrl')  String? lastPageUrl, @JsonKey(name: 'nextPageUrl')  String? nextPageUrl, @JsonKey(name: 'prevPageUrl')  String? prevPageUrl)?  $default,) {final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that.currentPage,_that.perPage,_that.total,_that.lastPage,_that.firstPageUrl,_that.lastPageUrl,_that.nextPageUrl,_that.prevPageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pagination implements Pagination {
  const _Pagination({@JsonKey(name: 'currentPage') this.currentPage, @JsonKey(name: 'perPage') this.perPage, @JsonKey(name: 'total') this.total, @JsonKey(name: 'lastPage') this.lastPage, @JsonKey(name: 'firstPageUrl') this.firstPageUrl, @JsonKey(name: 'lastPageUrl') this.lastPageUrl, @JsonKey(name: 'nextPageUrl') this.nextPageUrl, @JsonKey(name: 'prevPageUrl') this.prevPageUrl});
  factory _Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

@override@JsonKey(name: 'currentPage') final  int? currentPage;
@override@JsonKey(name: 'perPage') final  int? perPage;
@override@JsonKey(name: 'total') final  int? total;
@override@JsonKey(name: 'lastPage') final  int? lastPage;
@override@JsonKey(name: 'firstPageUrl') final  String? firstPageUrl;
@override@JsonKey(name: 'lastPageUrl') final  String? lastPageUrl;
@override@JsonKey(name: 'nextPageUrl') final  String? nextPageUrl;
@override@JsonKey(name: 'prevPageUrl') final  String? prevPageUrl;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationCopyWith<_Pagination> get copyWith => __$PaginationCopyWithImpl<_Pagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pagination&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.firstPageUrl, firstPageUrl) || other.firstPageUrl == firstPageUrl)&&(identical(other.lastPageUrl, lastPageUrl) || other.lastPageUrl == lastPageUrl)&&(identical(other.nextPageUrl, nextPageUrl) || other.nextPageUrl == nextPageUrl)&&(identical(other.prevPageUrl, prevPageUrl) || other.prevPageUrl == prevPageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,perPage,total,lastPage,firstPageUrl,lastPageUrl,nextPageUrl,prevPageUrl);

@override
String toString() {
  return 'Pagination(currentPage: $currentPage, perPage: $perPage, total: $total, lastPage: $lastPage, firstPageUrl: $firstPageUrl, lastPageUrl: $lastPageUrl, nextPageUrl: $nextPageUrl, prevPageUrl: $prevPageUrl)';
}


}

/// @nodoc
abstract mixin class _$PaginationCopyWith<$Res> implements $PaginationCopyWith<$Res> {
  factory _$PaginationCopyWith(_Pagination value, $Res Function(_Pagination) _then) = __$PaginationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'currentPage') int? currentPage,@JsonKey(name: 'perPage') int? perPage,@JsonKey(name: 'total') int? total,@JsonKey(name: 'lastPage') int? lastPage,@JsonKey(name: 'firstPageUrl') String? firstPageUrl,@JsonKey(name: 'lastPageUrl') String? lastPageUrl,@JsonKey(name: 'nextPageUrl') String? nextPageUrl,@JsonKey(name: 'prevPageUrl') String? prevPageUrl
});




}
/// @nodoc
class __$PaginationCopyWithImpl<$Res>
    implements _$PaginationCopyWith<$Res> {
  __$PaginationCopyWithImpl(this._self, this._then);

  final _Pagination _self;
  final $Res Function(_Pagination) _then;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = freezed,Object? perPage = freezed,Object? total = freezed,Object? lastPage = freezed,Object? firstPageUrl = freezed,Object? lastPageUrl = freezed,Object? nextPageUrl = freezed,Object? prevPageUrl = freezed,}) {
  return _then(_Pagination(
currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,lastPage: freezed == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int?,firstPageUrl: freezed == firstPageUrl ? _self.firstPageUrl : firstPageUrl // ignore: cast_nullable_to_non_nullable
as String?,lastPageUrl: freezed == lastPageUrl ? _self.lastPageUrl : lastPageUrl // ignore: cast_nullable_to_non_nullable
as String?,nextPageUrl: freezed == nextPageUrl ? _self.nextPageUrl : nextPageUrl // ignore: cast_nullable_to_non_nullable
as String?,prevPageUrl: freezed == prevPageUrl ? _self.prevPageUrl : prevPageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
