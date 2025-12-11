part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class GetLoginEvent extends LoginEvent{
  String email;
  String password;

  GetLoginEvent({required this.email,required this.password});
}
