
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/constants/di.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/data_source/sign_up_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';
@Injectable(as: SignUpDS)
class SignUpDSImpl implements SignUpDS{
  @override
  Future<AuthResponse> signUp(SignUpRequest request) {
    return getIt<EcommerceClient>().signUp(request);
  }

}