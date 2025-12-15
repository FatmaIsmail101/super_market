import 'package:json_annotation/json_annotation.dart';

part 'reset_code_response.g.dart';

@JsonSerializable()
class ResetCodeResponse {
  String? message;

  ResetCodeResponse({this.message});

  factory ResetCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetCodeResponseToJson(this);
}
