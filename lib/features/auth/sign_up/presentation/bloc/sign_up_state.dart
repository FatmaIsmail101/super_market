part of 'sign_up_bloc.dart';

class SignUpState{
  final RequestState? signUpRequestState;
  final AuthResponse? response;
  final CommerceFailure? failure;

  SignUpState({this.signUpRequestState, this.response, this.failure});
  SignUpState copyWith({
    RequestState? signUpRequestState,
    AuthResponse ?response,
    CommerceFailure ?failure
}){
    return SignUpState(failure: failure??this.failure,
    signUpRequestState: signUpRequestState??this.signUpRequestState,
    response: response??this.response);
  }
}
class AuthinitState extends SignUpState{
  AuthinitState():super(signUpRequestState: RequestState.init);
}
enum RequestState{init,loading,success,error}
