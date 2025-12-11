part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class GetSignUpEvent extends SignUpEvent{
 String name;
 String rePassword;
 String phone;
 String email;
 String password;

 GetSignUpEvent({required this.name,required this.phone,required this.email,required this.rePassword,required this.password});
}
