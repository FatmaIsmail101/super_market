import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/constants/di.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';
import 'package:route_e_commerce_v2/features/auth/login/data/login_data_source/login_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/login/data/models/login_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';

@Injectable(as: LoginDataSource)
class LoginDSImpl implements LoginDataSource {
  @override
  Future<AuthResponse> login(LoginRequest request) {
    return getIt<EcommerceClient>().login(request);
  }
}
