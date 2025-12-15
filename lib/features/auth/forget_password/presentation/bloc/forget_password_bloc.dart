import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_password_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/rest_code_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_response.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/usecase/reset_code/reset_code_usecase.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/usecase/update_password_usecase/update_password_usecase.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/usecase/verify_email/verify_email_usecase.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';

import '../../data/models/verify_email/reset_code_response.dart';

part 'forget_password_event.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  VerifyEmailUsecas usecas;
  ResetCodeUseCase resetCodeUseCase;
  UpdatePasswordUsecase updatePasswordUsecase;

  ForgetPasswordBloc(
    this.usecas,
    this.resetCodeUseCase,
    this.updatePasswordUsecase,
  ) : super(ForgetPasswordState.init()) {
    on<ForgetPasswordEvent>((event, emit) async {
      switch (event) {
        case VerifyEmailEvent():
          emit(state.copyWith(verifyEmailState: RequestState.loading));
          var request = VerifyEmailRequest(email: event.email);
          var result = await usecas.verify(request);
          result.fold(
            (failure) => emit(
              state.copyWith(
                verifyEmailState: RequestState.error,
                failure: failure,
              ),
            ),
            (response) => emit(
              state.copyWith(
                verifyEmailResponse: response,
                verifyEmailState: RequestState.success,
              ),
            ),
          );
        case ResetCodeEvent():
          emit(state.copyWith(resetCodeState: RequestState.loading));
          var request = RestCodeRequest(resetCode: event.resetCode);
          var result = await resetCodeUseCase.resetCode(request);
          result.fold(
            (l) {
              emit(
                state.copyWith(failure: l, resetCodeState: RequestState.error),
              );
            },
            (r) {
              emit(
                state.copyWith(
                  resetCodeResponse: r,
                  resetCodeState: RequestState.success,
                ),
              );
            },
          );
        case UpdatePasswordEvent():
          emit(state.copyWith(updatePasswordState: RequestState.loading));
          var request = ResetPasswordRequest(
            password: event.password,
            currentPassword: event.currentPassword,
            rePassword: event.rePassword,
          );
          var result = await updatePasswordUsecase.call(request);
          result.fold(
            (l) {
              emit(
                state.copyWith(
                  updatePasswordState: RequestState.error,
                  failure: l,
                ),
              );
            },
            (r) {
              emit(
                state.copyWith(
                  updatePasswordState: RequestState.success,
                  updatePasswordResponse: r,
                ),
              );
            },
          );
      }
    });
  }
}
