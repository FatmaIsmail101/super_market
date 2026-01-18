part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class GetSignUpEvent extends SignUpEvent{
  String? name;
  String? rePassword;
  String? phone;
  String? email;
  String? password;

  GetSignUpEvent({ this.name
    , this.phone, this.email,
    this.rePassword, this.password});
}
