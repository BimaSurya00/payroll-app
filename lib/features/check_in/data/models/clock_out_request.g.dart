// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_out_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClockOutRequest _$ClockOutRequestFromJson(Map<String, dynamic> json) =>
    _ClockOutRequest(
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$ClockOutRequestToJson(_ClockOutRequest instance) =>
    <String, dynamic>{'lat': instance.lat, 'long': instance.long};
