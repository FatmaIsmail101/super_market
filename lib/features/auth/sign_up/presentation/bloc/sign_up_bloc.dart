import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/domain/sign_up_usecase/sign_up_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpUseCase signUpUseCase;
  SignUpBloc(this.signUpUseCase) : super(AuthinitState()) {
    on<GetSignUpEvent>((event, emit) async{
     emit(state.copyWith(signUpRequestState: RequestState.loading));
     var request=SignUpRequest(name: event.name, phone: event.phone, email: event.email, rePassword: event.rePassword, password: event.password);
     var result=await signUpUseCase.call(request);
     result.fold((l) {
       emit(state.copyWith(signUpRequestState: RequestState.error,
       failure: l));
     }, (r) {
       emit(state.copyWith(signUpRequestState: RequestState.success,
           response: r));
     },);
    });
  }
}
