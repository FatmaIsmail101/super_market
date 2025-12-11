import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/login/data/models/login_request.dart';
import 'package:route_e_commerce_v2/features/auth/login/domain/repository/login_repositroy.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';

@injectable
class LoginUseCase{
  LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);
  Future<Either<CommerceFailure,AuthResponse>>call(LoginRequest request){
    return loginRepository.login(request);
  }
}