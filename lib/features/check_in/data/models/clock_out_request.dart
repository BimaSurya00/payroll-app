import 'package:freezed_annotation/freezed_annotation.dart';

part 'clock_out_request.freezed.dart';
part 'clock_out_request.g.dart';

@freezed
abstract class ClockOutRequest with _$ClockOutRequest {
  const factory ClockOutRequest({
    @JsonKey(name: 'lat') required double lat,
    @JsonKey(name: 'long') required double long,
  }) = _ClockOutRequest;

  factory ClockOutRequest.fromJson(Map<String, dynamic> json) =>
      _$ClockOutRequestFromJson(json);
}
