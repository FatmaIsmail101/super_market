part of 'login_bloc.dart';

class LoginState {
  RequestState? loginRequestState;
  AuthResponse? response;
  CommerceFailure? failure;

  LoginState({this.loginRequestState, this.response, this.failure});

  LoginState copyWith({
    RequestState? loginRequestState,
    AuthResponse? response,
    CommerceFailure? failure,
  }) {
    return LoginState(
      response: response ?? this.response,
      failure: failure ?? this.failure,
      loginRequestState: loginRequestState ?? this.loginRequestState,
    );
  }
  static LoginState  init(){
   return LoginState(loginRequestState: RequestState.loading);
  }

}
