// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyResponse {

@JsonKey(name: 'success') bool? get success;@JsonKey(name: 'statusCode') int? get statusCode;@JsonKey(name: 'message') String? get message;@JsonKey(name: 'data') CompanyData? get data;
/// Create a copy of CompanyResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyResponseCopyWith<CompanyResponse> get copyWith => _$CompanyResponseCopyWithImpl<CompanyResponse>(this as CompanyResponse, _$identity);

  /// Serializes this CompanyResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,statusCode,message,data);

@override
String toString() {
  return 'CompanyResponse(success: $success, statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CompanyResponseCopyWith<$Res>  {
  factory $CompanyResponseCopyWith(CompanyResponse value, $Res Function(CompanyResponse) _then) = _$CompanyResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool? success,@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'message') String? message,@JsonKey(name: 'data') CompanyData? data
});


$CompanyDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$CompanyResponseCopyWithImpl<$Res>
    implements $CompanyResponseCopyWith<$Res> {
  _$CompanyResponseCopyWithImpl(this._self, this._then);

  final CompanyResponse _self;
  final $Res Function(CompanyResponse) _then;

/// Create a copy of CompanyResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CompanyData?,
  ));
}
/// Create a copy of CompanyResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CompanyDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CompanyResponse].
extension CompanyResponsePatterns on CompanyResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyResponse value)  $default,){
final _that = this;
switch (_that) {
case _CompanyResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  CompanyData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyResponse() when $default != null:
return $default(_that.success,_that.statusCode,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  CompanyData? data)  $default,) {final _that = this;
switch (_that) {
case _CompanyResponse():
return $default(_that.success,_that.statusCode,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  CompanyData? data)?  $default,) {final _that = this;
switch (_that) {
case _CompanyResponse() when $default != null:
return $default(_that.success,_that.statusCode,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyResponse implements CompanyResponse {
   _CompanyResponse({@JsonKey(name: 'success') this.success, @JsonKey(name: 'statusCode') this.statusCode, @JsonKey(name: 'message') this.message, @JsonKey(name: 'data') this.data});
  factory _CompanyResponse.fromJson(Map<String, dynamic> json) => _$CompanyResponseFromJson(json);

@override@JsonKey(name: 'success') final  bool? success;
@override@JsonKey(name: 'statusCode') final  int? statusCode;
@override@JsonKey(name: 'message') final  String? message;
@override@JsonKey(name: 'data') final  CompanyData? data;

/// Create a copy of CompanyResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyResponseCopyWith<_CompanyResponse> get copyWith => __$CompanyResponseCopyWithImpl<_CompanyResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,statusCode,message,data);

@override
String toString() {
  return 'CompanyResponse(success: $success, statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CompanyResponseCopyWith<$Res> implements $CompanyResponseCopyWith<$Res> {
  factory _$CompanyResponseCopyWith(_CompanyResponse value, $Res Function(_CompanyResponse) _then) = __$CompanyResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool? success,@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'message') String? message,@JsonKey(name: 'data') CompanyData? data
});


@override $CompanyDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$CompanyResponseCopyWithImpl<$Res>
    implements _$CompanyResponseCopyWith<$Res> {
  __$CompanyResponseCopyWithImpl(this._self, this._then);

  final _CompanyResponse _self;
  final $Res Function(_CompanyResponse) _then;

/// Create a copy of CompanyResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_CompanyResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CompanyData?,
  ));
}

/// Create a copy of CompanyResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CompanyDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CompanyData {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'slug') String get slug;@JsonKey(name: 'isActive') bool get isActive;@JsonKey(name: 'plan') String get plan;@JsonKey(name: 'maxEmployees') int get maxEmployees;@JsonKey(name: 'officeLat') double? get officeLat;@JsonKey(name: 'officeLong') double? get officeLong;@JsonKey(name: 'allowedRadiusMeters') int? get allowedRadiusMeters;@JsonKey(name: 'createdAt') String get createdAt;@JsonKey(name: 'updatedAt') String get updatedAt;
/// Create a copy of CompanyData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyDataCopyWith<CompanyData> get copyWith => _$CompanyDataCopyWithImpl<CompanyData>(this as CompanyData, _$identity);

  /// Serializes this CompanyData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.maxEmployees, maxEmployees) || other.maxEmployees == maxEmployees)&&(identical(other.officeLat, officeLat) || other.officeLat == officeLat)&&(identical(other.officeLong, officeLong) || other.officeLong == officeLong)&&(identical(other.allowedRadiusMeters, allowedRadiusMeters) || other.allowedRadiusMeters == allowedRadiusMeters)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive,plan,maxEmployees,officeLat,officeLong,allowedRadiusMeters,createdAt,updatedAt);

@override
String toString() {
  return 'CompanyData(id: $id, name: $name, slug: $slug, isActive: $isActive, plan: $plan, maxEmployees: $maxEmployees, officeLat: $officeLat, officeLong: $officeLong, allowedRadiusMeters: $allowedRadiusMeters, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CompanyDataCopyWith<$Res>  {
  factory $CompanyDataCopyWith(CompanyData value, $Res Function(CompanyData) _then) = _$CompanyDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'slug') String slug,@JsonKey(name: 'isActive') bool isActive,@JsonKey(name: 'plan') String plan,@JsonKey(name: 'maxEmployees') int maxEmployees,@JsonKey(name: 'officeLat') double? officeLat,@JsonKey(name: 'officeLong') double? officeLong,@JsonKey(name: 'allowedRadiusMeters') int? allowedRadiusMeters,@JsonKey(name: 'createdAt') String createdAt,@JsonKey(name: 'updatedAt') String updatedAt
});




}
/// @nodoc
class _$CompanyDataCopyWithImpl<$Res>
    implements $CompanyDataCopyWith<$Res> {
  _$CompanyDataCopyWithImpl(this._self, this._then);

  final CompanyData _self;
  final $Res Function(CompanyData) _then;

/// Create a copy of CompanyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? isActive = null,Object? plan = null,Object? maxEmployees = null,Object? officeLat = freezed,Object? officeLong = freezed,Object? allowedRadiusMeters = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,maxEmployees: null == maxEmployees ? _self.maxEmployees : maxEmployees // ignore: cast_nullable_to_non_nullable
as int,officeLat: freezed == officeLat ? _self.officeLat : officeLat // ignore: cast_nullable_to_non_nullable
as double?,officeLong: freezed == officeLong ? _self.officeLong : officeLong // ignore: cast_nullable_to_non_nullable
as double?,allowedRadiusMeters: freezed == allowedRadiusMeters ? _self.allowedRadiusMeters : allowedRadiusMeters // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyData].
extension CompanyDataPatterns on CompanyData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyData value)  $default,){
final _that = this;
switch (_that) {
case _CompanyData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyData value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'plan')  String plan, @JsonKey(name: 'maxEmployees')  int maxEmployees, @JsonKey(name: 'officeLat')  double? officeLat, @JsonKey(name: 'officeLong')  double? officeLong, @JsonKey(name: 'allowedRadiusMeters')  int? allowedRadiusMeters, @JsonKey(name: 'createdAt')  String createdAt, @JsonKey(name: 'updatedAt')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyData() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.isActive,_that.plan,_that.maxEmployees,_that.officeLat,_that.officeLong,_that.allowedRadiusMeters,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'plan')  String plan, @JsonKey(name: 'maxEmployees')  int maxEmployees, @JsonKey(name: 'officeLat')  double? officeLat, @JsonKey(name: 'officeLong')  double? officeLong, @JsonKey(name: 'allowedRadiusMeters')  int? allowedRadiusMeters, @JsonKey(name: 'createdAt')  String createdAt, @JsonKey(name: 'updatedAt')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CompanyData():
return $default(_that.id,_that.name,_that.slug,_that.isActive,_that.plan,_that.maxEmployees,_that.officeLat,_that.officeLong,_that.allowedRadiusMeters,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'plan')  String plan, @JsonKey(name: 'maxEmployees')  int maxEmployees, @JsonKey(name: 'officeLat')  double? officeLat, @JsonKey(name: 'officeLong')  double? officeLong, @JsonKey(name: 'allowedRadiusMeters')  int? allowedRadiusMeters, @JsonKey(name: 'createdAt')  String createdAt, @JsonKey(name: 'updatedAt')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CompanyData() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.isActive,_that.plan,_that.maxEmployees,_that.officeLat,_that.officeLong,_that.allowedRadiusMeters,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyData extends CompanyData {
  const _CompanyData({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'slug') required this.slug, @JsonKey(name: 'isActive') required this.isActive, @JsonKey(name: 'plan') required this.plan, @JsonKey(name: 'maxEmployees') required this.maxEmployees, @JsonKey(name: 'officeLat') this.officeLat, @JsonKey(name: 'officeLong') this.officeLong, @JsonKey(name: 'allowedRadiusMeters') this.allowedRadiusMeters, @JsonKey(name: 'createdAt') required this.createdAt, @JsonKey(name: 'updatedAt') required this.updatedAt}): super._();
  factory _CompanyData.fromJson(Map<String, dynamic> json) => _$CompanyDataFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'slug') final  String slug;
@override@JsonKey(name: 'isActive') final  bool isActive;
@override@JsonKey(name: 'plan') final  String plan;
@override@JsonKey(name: 'maxEmployees') final  int maxEmployees;
@override@JsonKey(name: 'officeLat') final  double? officeLat;
@override@JsonKey(name: 'officeLong') final  double? officeLong;
@override@JsonKey(name: 'allowedRadiusMeters') final  int? allowedRadiusMeters;
@override@JsonKey(name: 'createdAt') final  String createdAt;
@override@JsonKey(name: 'updatedAt') final  String updatedAt;

/// Create a copy of CompanyData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyDataCopyWith<_CompanyData> get copyWith => __$CompanyDataCopyWithImpl<_CompanyData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.maxEmployees, maxEmployees) || other.maxEmployees == maxEmployees)&&(identical(other.officeLat, officeLat) || other.officeLat == officeLat)&&(identical(other.officeLong, officeLong) || other.officeLong == officeLong)&&(identical(other.allowedRadiusMeters, allowedRadiusMeters) || other.allowedRadiusMeters == allowedRadiusMeters)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive,plan,maxEmployees,officeLat,officeLong,allowedRadiusMeters,createdAt,updatedAt);

@override
String toString() {
  return 'CompanyData(id: $id, name: $name, slug: $slug, isActive: $isActive, plan: $plan, maxEmployees: $maxEmployees, officeLat: $officeLat, officeLong: $officeLong, allowedRadiusMeters: $allowedRadiusMeters, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CompanyDataCopyWith<$Res> implements $CompanyDataCopyWith<$Res> {
  factory _$CompanyDataCopyWith(_CompanyData value, $Res Function(_CompanyData) _then) = __$CompanyDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'slug') String slug,@JsonKey(name: 'isActive') bool isActive,@JsonKey(name: 'plan') String plan,@JsonKey(name: 'maxEmployees') int maxEmployees,@JsonKey(name: 'officeLat') double? officeLat,@JsonKey(name: 'officeLong') double? officeLong,@JsonKey(name: 'allowedRadiusMeters') int? allowedRadiusMeters,@JsonKey(name: 'createdAt') String createdAt,@JsonKey(name: 'updatedAt') String updatedAt
});




}
/// @nodoc
class __$CompanyDataCopyWithImpl<$Res>
    implements _$CompanyDataCopyWith<$Res> {
  __$CompanyDataCopyWithImpl(this._self, this._then);

  final _CompanyData _self;
  final $Res Function(_CompanyData) _then;

/// Create a copy of CompanyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? isActive = null,Object? plan = null,Object? maxEmployees = null,Object? officeLat = freezed,Object? officeLong = freezed,Object? allowedRadiusMeters = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_CompanyData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,maxEmployees: null == maxEmployees ? _self.maxEmployees : maxEmployees // ignore: cast_nullable_to_non_nullable
as int,officeLat: freezed == officeLat ? _self.officeLat : officeLat // ignore: cast_nullable_to_non_nullable
as double?,officeLong: freezed == officeLong ? _self.officeLong : officeLong // ignore: cast_nullable_to_non_nullable
as double?,allowedRadiusMeters: freezed == allowedRadiusMeters ? _self.allowedRadiusMeters : allowedRadiusMeters // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
