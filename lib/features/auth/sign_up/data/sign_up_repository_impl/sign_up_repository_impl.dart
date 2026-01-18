
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/cache_helper/cache_helper.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/data_source/sign_up_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/domain/repository/sign_up_repository.dart';
@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository{
  SignUpDS signUpDS;

  SignUpRepositoryImpl(this.signUpDS);

  @override
  Future<Either<CommerceFailure, AuthResponse>> signUp(SignUpRequest request)async {
    try{
      var result=await signUpDS.signUp(request);
      CacheHelper.saveString("token", result.token??"");
      CacheHelper.saveString("email", result.user?.email??"");
      CacheHelper.saveString("name", request.name ?? "");
      CacheHelper.saveString("phone", request.phone ?? "");
      CacheHelper.saveString("password", request.password ?? "");

      return Right(result);
    }
    catch(e){
      return Left(GeneralFailure(message: "SomeThing went wrong "));
    }
  }

}