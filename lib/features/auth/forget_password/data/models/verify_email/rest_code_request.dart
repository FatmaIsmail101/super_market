import 'package:json_annotation/json_annotation.dart';

part 'rest_code_request.g.dart';

@JsonSerializable()
class RestCodeRequest {
  String? resetCode;

  RestCodeRequest({this.resetCode});

  factory RestCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$RestCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RestCodeRequestToJson(this);
}
