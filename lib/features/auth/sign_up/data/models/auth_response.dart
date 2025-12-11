import 'package:json_annotation/json_annotation.dart';
part 'auth_response.g.dart';

@JsonSerializable()

class AuthResponse{
  final String?message;
  final User ?user;
  final String ?token;
  AuthResponse({this.message,this.user,this.token});
  factory AuthResponse.fromJson(Map<String,dynamic>json)=>_$AuthResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$AuthResponseToJson(this);
}
@JsonSerializable()
class User{
  final String?name;
  final String?email;
  final String?role;
  factory User.fromJson(Map<String,dynamic>json)=>_$UserFromJson(json);

  User({this.name, this.email, this.role});

  Map<String,dynamic>toJson()=>_$UserToJson(this);
}