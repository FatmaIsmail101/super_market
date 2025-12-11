import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/domain/repository/sign_up_repository.dart';

@injectable
class SignUpUseCase{
  SignUpRepository signUpRepository;

  SignUpUseCase(this.signUpRepository);

  Future<Either<CommerceFailure,AuthResponse>>call(SignUpRequest request){
    return signUpRepository.signUp(request);
  }
}