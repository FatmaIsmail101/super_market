part of 'forget_password_bloc.dart';

class ForgetPasswordState {
  RequestState? verifyEmailState;
  RequestState? restCodeState;
  ResetCodeResponse? resetCodeResponse;
  CommerceFailure? failure;
  VerifyEmailResponse? verifyEmailResponse;
  AuthResponse? updatePasswordResponse;
  RequestState? updatePasswordState;

  ForgetPasswordState({
    this.resetCodeResponse,
    this.restCodeState,
    this.verifyEmailState,
    this.failure,
    this.verifyEmailResponse,
    this.updatePasswordResponse,
    this.updatePasswordState,
  });

  static ForgetPasswordState init() {
    return ForgetPasswordState(
      restCodeState: RequestState.init,
      verifyEmailState: RequestState.init,
    );
  }

  ForgetPasswordState copyWith({
    RequestState? verifyEmailState,
    RequestState? resetCodeState,
    ResetCodeResponse? resetCodeResponse,
    AuthResponse? updatePasswordResponse,
    RequestState? updatePasswordState,
    CommerceFailure? failure,
    VerifyEmailResponse? verifyEmailResponse,
  }) {
    return ForgetPasswordState(
      updatePasswordResponse:
          updatePasswordResponse ?? this.updatePasswordResponse,
      updatePasswordState: updatePasswordState ?? this.updatePasswordState,
      failure: failure ?? this.failure,
      verifyEmailResponse: verifyEmailResponse ?? this.verifyEmailResponse,
      verifyEmailState: verifyEmailState ?? this.verifyEmailState,
      restCodeState: resetCodeState ?? restCodeState,
      resetCodeResponse: resetCodeResponse ?? this.resetCodeResponse,
    );
  }
}
