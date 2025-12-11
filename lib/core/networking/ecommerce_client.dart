import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:route_e_commerce_v2/features/auth/login/data/models/login_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';

import '../constants/api_constants.dart';

part 'ecommerce_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class EcommerceClient {
  factory EcommerceClient(Dio dio, {String? baseUrl}) = _EcommerceClient;
 @POST(ApiConstants.signUp)
  Future<AuthResponse>signUp(@Body() SignUpRequest request);
 @POST(ApiConstants.signIn)
  Future<AuthResponse>login(@Body() LoginRequest request);
}
@module
abstract class DioModule{
  Dio get dio=>Dio();
  //عشان ال Commerce Client abstract class مسنفعش اكريت اوبجيكت منه
  @lazySingleton
  EcommerceClient provideCommerceClient(Dio dio)=>EcommerceClient(dio);
}
