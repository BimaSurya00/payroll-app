import 'package:freezed_annotation/freezed_annotation.dart';

part 'clock_in_request.freezed.dart';
part 'clock_in_request.g.dart';

@freezed
abstract class ClockInRequest with _$ClockInRequest {
  const factory ClockInRequest({
    @JsonKey(name: 'lat') required double lat,
    @JsonKey(name: 'long') required double long,
  }) = _ClockInRequest;

  factory ClockInRequest.fromJson(Map<String, dynamic> json) =>
      _$ClockInRequestFromJson(json);
}
