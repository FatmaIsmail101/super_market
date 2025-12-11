import 'package:route_e_commerce_v2/features/auth/login/data/models/login_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';

abstract class LoginDataSource{
  Future<AuthResponse>login(LoginRequest request);
}