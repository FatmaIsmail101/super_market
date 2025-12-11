import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/cache_helper/cache_helper.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/login/data/login_data_source/login_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/login/data/models/login_request.dart';
import 'package:route_e_commerce_v2/features/auth/login/domain/repository/login_repositroy.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';
@Injectable(as: LoginRepository)
class LoginRepositroyImpl implements LoginRepository{
  LoginDataSource loginDataSource;

  LoginRepositroyImpl(this.loginDataSource);

  @override
  Future<Either<CommerceFailure, AuthResponse>> login(LoginRequest request) async {
    try{
      var result=await loginDataSource.login(request);
      CacheHelper.saveString("token", result.token??"");
      return Right(result);
    }
    catch(e){
      return Left(GeneralFailure(message: e.toString()));
    }
  }

}