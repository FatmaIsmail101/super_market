part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordEvent {}

class VerifyEmailEvent extends ForgetPasswordEvent {
  String email;

  VerifyEmailEvent(this.email);
}

class ResetCodeEvent extends ForgetPasswordEvent {
  String resetCode;

  ResetCodeEvent(this.resetCode);
}

class UpdatePasswordEvent extends ForgetPasswordEvent {
  String? currentPassword;
  String? password;
  String? rePassword;

  UpdatePasswordEvent({this.currentPassword, this.password, this.rePassword});
}
