// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClockInRequest _$ClockInRequestFromJson(Map<String, dynamic> json) =>
    _ClockInRequest(
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$ClockInRequestToJson(_ClockInRequest instance) =>
    <String, dynamic>{'lat': instance.lat, 'long': instance.long};
