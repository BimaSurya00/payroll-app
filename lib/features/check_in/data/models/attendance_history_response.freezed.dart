// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceHistoryResponse {

@JsonKey(name: 'success') bool? get success;@JsonKey(name: 'statusCode') int? get statusCode;@JsonKey(name: 'message') String? get message;@JsonKey(name: 'data') List<AttendanceHistoryItem>? get data;@JsonKey(name: 'pagination') Pagination? get pagination;
/// Create a copy of AttendanceHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceHistoryResponseCopyWith<AttendanceHistoryResponse> get copyWith => _$AttendanceHistoryResponseCopyWithImpl<AttendanceHistoryResponse>(this as AttendanceHistoryResponse, _$identity);

  /// Serializes this AttendanceHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceHistoryResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,statusCode,message,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'AttendanceHistoryResponse(success: $success, statusCode: $statusCode, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $AttendanceHistoryResponseCopyWith<$Res>  {
  factory $AttendanceHistoryResponseCopyWith(AttendanceHistoryResponse value, $Res Function(AttendanceHistoryResponse) _then) = _$AttendanceHistoryResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool? success,@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'message') String? message,@JsonKey(name: 'data') List<AttendanceHistoryItem>? data,@JsonKey(name: 'pagination') Pagination? pagination
});


$PaginationCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$AttendanceHistoryResponseCopyWithImpl<$Res>
    implements $AttendanceHistoryResponseCopyWith<$Res> {
  _$AttendanceHistoryResponseCopyWithImpl(this._self, this._then);

  final AttendanceHistoryResponse _self;
  final $Res Function(AttendanceHistoryResponse) _then;

/// Create a copy of AttendanceHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AttendanceHistoryItem>?,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,
  ));
}
/// Create a copy of AttendanceHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttendanceHistoryResponse].
extension AttendanceHistoryResponsePatterns on AttendanceHistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceHistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceHistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceHistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceHistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  List<AttendanceHistoryItem>? data, @JsonKey(name: 'pagination')  Pagination? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceHistoryResponse() when $default != null:
return $default(_that.success,_that.statusCode,_that.message,_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  List<AttendanceHistoryItem>? data, @JsonKey(name: 'pagination')  Pagination? pagination)  $default,) {final _that = this;
switch (_that) {
case _AttendanceHistoryResponse():
return $default(_that.success,_that.statusCode,_that.message,_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  List<AttendanceHistoryItem>? data, @JsonKey(name: 'pagination')  Pagination? pagination)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceHistoryResponse() when $default != null:
return $default(_that.success,_that.statusCode,_that.message,_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceHistoryResponse implements AttendanceHistoryResponse {
  const _AttendanceHistoryResponse({@JsonKey(name: 'success') this.success, @JsonKey(name: 'statusCode') this.statusCode, @JsonKey(name: 'message') this.message, @JsonKey(name: 'data') final  List<AttendanceHistoryItem>? data, @JsonKey(name: 'pagination') this.pagination}): _data = data;
  factory _AttendanceHistoryResponse.fromJson(Map<String, dynamic> json) => _$AttendanceHistoryResponseFromJson(json);

@override@JsonKey(name: 'success') final  bool? success;
@override@JsonKey(name: 'statusCode') final  int? statusCode;
@override@JsonKey(name: 'message') final  String? message;
 final  List<AttendanceHistoryItem>? _data;
@override@JsonKey(name: 'data') List<AttendanceHistoryItem>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'pagination') final  Pagination? pagination;

/// Create a copy of AttendanceHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceHistoryResponseCopyWith<_AttendanceHistoryResponse> get copyWith => __$AttendanceHistoryResponseCopyWithImpl<_AttendanceHistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceHistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceHistoryResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,statusCode,message,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'AttendanceHistoryResponse(success: $success, statusCode: $statusCode, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$AttendanceHistoryResponseCopyWith<$Res> implements $AttendanceHistoryResponseCopyWith<$Res> {
  factory _$AttendanceHistoryResponseCopyWith(_AttendanceHistoryResponse value, $Res Function(_AttendanceHistoryResponse) _then) = __$AttendanceHistoryResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool? success,@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'message') String? message,@JsonKey(name: 'data') List<AttendanceHistoryItem>? data,@JsonKey(name: 'pagination') Pagination? pagination
});


@override $PaginationCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$AttendanceHistoryResponseCopyWithImpl<$Res>
    implements _$AttendanceHistoryResponseCopyWith<$Res> {
  __$AttendanceHistoryResponseCopyWithImpl(this._self, this._then);

  final _AttendanceHistoryResponse _self;
  final $Res Function(_AttendanceHistoryResponse) _then;

/// Create a copy of AttendanceHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,Object? pagination = freezed,}) {
  return _then(_AttendanceHistoryResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AttendanceHistoryItem>?,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,
  ));
}

/// Create a copy of AttendanceHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$AttendanceHistoryItem {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'date') String? get date;@JsonKey(name: 'clockInTime') String? get clockInTime;@JsonKey(name: 'clockOutTime') String? get clockOutTime;@JsonKey(name: 'status') String? get status;@JsonKey(name: 'notes') String? get notes;@JsonKey(name: 'scheduleName') String? get scheduleName;
/// Create a copy of AttendanceHistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceHistoryItemCopyWith<AttendanceHistoryItem> get copyWith => _$AttendanceHistoryItemCopyWithImpl<AttendanceHistoryItem>(this as AttendanceHistoryItem, _$identity);

  /// Serializes this AttendanceHistoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.scheduleName, scheduleName) || other.scheduleName == scheduleName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,clockInTime,clockOutTime,status,notes,scheduleName);

@override
String toString() {
  return 'AttendanceHistoryItem(id: $id, date: $date, clockInTime: $clockInTime, clockOutTime: $clockOutTime, status: $status, notes: $notes, scheduleName: $scheduleName)';
}


}

/// @nodoc
abstract mixin class $AttendanceHistoryItemCopyWith<$Res>  {
  factory $AttendanceHistoryItemCopyWith(AttendanceHistoryItem value, $Res Function(AttendanceHistoryItem) _then) = _$AttendanceHistoryItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'date') String? date,@JsonKey(name: 'clockInTime') String? clockInTime,@JsonKey(name: 'clockOutTime') String? clockOutTime,@JsonKey(name: 'status') String? status,@JsonKey(name: 'notes') String? notes,@JsonKey(name: 'scheduleName') String? scheduleName
});




}
/// @nodoc
class _$AttendanceHistoryItemCopyWithImpl<$Res>
    implements $AttendanceHistoryItemCopyWith<$Res> {
  _$AttendanceHistoryItemCopyWithImpl(this._self, this._then);

  final AttendanceHistoryItem _self;
  final $Res Function(AttendanceHistoryItem) _then;

/// Create a copy of AttendanceHistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = freezed,Object? clockInTime = freezed,Object? clockOutTime = freezed,Object? status = freezed,Object? notes = freezed,Object? scheduleName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as String?,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,scheduleName: freezed == scheduleName ? _self.scheduleName : scheduleName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceHistoryItem].
extension AttendanceHistoryItemPatterns on AttendanceHistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceHistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceHistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceHistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceHistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceHistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceHistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'date')  String? date, @JsonKey(name: 'clockInTime')  String? clockInTime, @JsonKey(name: 'clockOutTime')  String? clockOutTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'notes')  String? notes, @JsonKey(name: 'scheduleName')  String? scheduleName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceHistoryItem() when $default != null:
return $default(_that.id,_that.date,_that.clockInTime,_that.clockOutTime,_that.status,_that.notes,_that.scheduleName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'date')  String? date, @JsonKey(name: 'clockInTime')  String? clockInTime, @JsonKey(name: 'clockOutTime')  String? clockOutTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'notes')  String? notes, @JsonKey(name: 'scheduleName')  String? scheduleName)  $default,) {final _that = this;
switch (_that) {
case _AttendanceHistoryItem():
return $default(_that.id,_that.date,_that.clockInTime,_that.clockOutTime,_that.status,_that.notes,_that.scheduleName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'date')  String? date, @JsonKey(name: 'clockInTime')  String? clockInTime, @JsonKey(name: 'clockOutTime')  String? clockOutTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'notes')  String? notes, @JsonKey(name: 'scheduleName')  String? scheduleName)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceHistoryItem() when $default != null:
return $default(_that.id,_that.date,_that.clockInTime,_that.clockOutTime,_that.status,_that.notes,_that.scheduleName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceHistoryItem implements AttendanceHistoryItem {
  const _AttendanceHistoryItem({@JsonKey(name: 'id') this.id, @JsonKey(name: 'date') this.date, @JsonKey(name: 'clockInTime') this.clockInTime, @JsonKey(name: 'clockOutTime') this.clockOutTime, @JsonKey(name: 'status') this.status, @JsonKey(name: 'notes') this.notes, @JsonKey(name: 'scheduleName') this.scheduleName});
  factory _AttendanceHistoryItem.fromJson(Map<String, dynamic> json) => _$AttendanceHistoryItemFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'date') final  String? date;
@override@JsonKey(name: 'clockInTime') final  String? clockInTime;
@override@JsonKey(name: 'clockOutTime') final  String? clockOutTime;
@override@JsonKey(name: 'status') final  String? status;
@override@JsonKey(name: 'notes') final  String? notes;
@override@JsonKey(name: 'scheduleName') final  String? scheduleName;

/// Create a copy of AttendanceHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceHistoryItemCopyWith<_AttendanceHistoryItem> get copyWith => __$AttendanceHistoryItemCopyWithImpl<_AttendanceHistoryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceHistoryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.scheduleName, scheduleName) || other.scheduleName == scheduleName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,clockInTime,clockOutTime,status,notes,scheduleName);

@override
String toString() {
  return 'AttendanceHistoryItem(id: $id, date: $date, clockInTime: $clockInTime, clockOutTime: $clockOutTime, status: $status, notes: $notes, scheduleName: $scheduleName)';
}


}

/// @nodoc
abstract mixin class _$AttendanceHistoryItemCopyWith<$Res> implements $AttendanceHistoryItemCopyWith<$Res> {
  factory _$AttendanceHistoryItemCopyWith(_AttendanceHistoryItem value, $Res Function(_AttendanceHistoryItem) _then) = __$AttendanceHistoryItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'date') String? date,@JsonKey(name: 'clockInTime') String? clockInTime,@JsonKey(name: 'clockOutTime') String? clockOutTime,@JsonKey(name: 'status') String? status,@JsonKey(name: 'notes') String? notes,@JsonKey(name: 'scheduleName') String? scheduleName
});




}
/// @nodoc
class __$AttendanceHistoryItemCopyWithImpl<$Res>
    implements _$AttendanceHistoryItemCopyWith<$Res> {
  __$AttendanceHistoryItemCopyWithImpl(this._self, this._then);

  final _AttendanceHistoryItem _self;
  final $Res Function(_AttendanceHistoryItem) _then;

/// Create a copy of AttendanceHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = freezed,Object? clockInTime = freezed,Object? clockOutTime = freezed,Object? status = freezed,Object? notes = freezed,Object? scheduleName = freezed,}) {
  return _then(_AttendanceHistoryItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as String?,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,scheduleName: freezed == scheduleName ? _self.scheduleName : scheduleName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
