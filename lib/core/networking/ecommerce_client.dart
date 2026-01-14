import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_code_response.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_password_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_response.dart';
import 'package:route_e_commerce_v2/features/auth/login/data/models/login_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_response.dart';

import '../../features/auth/forget_password/data/models/verify_email/rest_code_request.dart';
import '../../features/navigation_layout/tabs/categories/data/models/brands_models/brands_response_dto.dart';
import '../../features/navigation_layout/tabs/categories/data/models/category_models/categories_response_dto.dart';
import '../../features/navigation_layout/tabs/categories/data/models/sub_categories_models/sub_categories_response_dto.dart';
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

  @GET(ApiConstants.getAllCategories)
  Future<BrandsResponseDto> getAllCategories();

  @GET(ApiConstants.getAllProducts)
  Future<ProductsResponse> getAllProducts();

  @GET('/api/v1/categories/{id}/subcategories')
  Future<SubCategoriesResponseDto> getAllSubCat(@Path("id") String catId);

  @GET(ApiConstants.getAllCategories)
  Future<CategoriesResponseDto> getCategories();
}
@module
abstract class DioModule{
  // Dio get dio=>Dio();
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();

    // إضافة PrettyDioLogger
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );

    return dio;
  }

  //عشان ال Commerce Client abstract class مسنفعش اكريت اوبجيكت منه
  @Singleton()
  EcommerceClient provideCommerceClient(Dio dio)=>EcommerceClient(dio);
}
