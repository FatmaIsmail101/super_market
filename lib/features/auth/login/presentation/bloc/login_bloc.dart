import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/login/data/models/login_request.dart';
import 'package:route_e_commerce_v2/features/auth/login/domain/login_usecase/login_usecase.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';
@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginState.init()) {
    on<GetLoginEvent>((event, emit) async{
      emit(state.copyWith(loginRequestState: RequestState.loading));
      var request=LoginRequest(email:  event.email,
      password: event.password);
      var result=await loginUseCase.call(request);
      result.fold((l) {
        emit(state.copyWith(loginRequestState: RequestState.error,
          failure: l
        ));
      }, (r) {
        emit(state.copyWith(loginRequestState: RequestState.success,
            response: r
        ));
      },);
    });
  }
}
