import 'package:json_annotation/json_annotation.dart';

part 'verify_email_response.g.dart';

@JsonSerializable()
class VerifyEmailResponse {
  final String? statusMsg;
  final String? message;

  VerifyEmailResponse({this.statusMsg, this.message});

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailResponseToJson(this);
}
