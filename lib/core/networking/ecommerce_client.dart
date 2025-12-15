import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_code_response.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_password_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_response.dart';
import 'package:route_e_commerce_v2/features/auth/login/data/models/login_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/sign_up_request.dart';

import '../../features/auth/forget_password/data/models/verify_email/rest_code_request.dart';
import '../constants/api_constants.dart';

part 'ecommerce_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class EcommerceClient {
  factory EcommerceClient(Dio dio, {String? baseUrl}) = _EcommerceClient;
 @POST(ApiConstants.signUp)
  Future<AuthResponse>signUp(@Body() SignUpRequest request);
 @POST(ApiConstants.signIn)
  Future<AuthResponse>login(@Body() LoginRequest request);

  @POST(ApiConstants.forgetPassword)
  Future<VerifyEmailResponse> forgetPassword(
      @Body() VerifyEmailRequest request);

  @POST(ApiConstants.verifyRestCode)
  Future<ResetCodeResponse> resetCode(@Body() RestCodeRequest request);

  @PUT(ApiConstants.updatePassword)
  Future<AuthResponse> updatePassword(@Body() ResetPasswordRequest request,
      @Header("token") String token);

}
@module
abstract class DioModule{
  Dio get dio=>Dio();
  //عشان ال Commerce Client abstract class مسنفعش اكريت اوبجيكت منه
  @lazySingleton
  EcommerceClient provideCommerceClient(Dio dio)=>EcommerceClient(dio);
}
