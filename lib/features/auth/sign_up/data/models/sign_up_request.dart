import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  /// The generated code assumes these values exist in JSON.
  final String ?name;
    final String?  email;
    final String ?password;
  final String ?rePassword;
  final String ?phone;


  SignUpRequest({ this.name,  this.password, this.rePassword,this.email,this.phone});


  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}