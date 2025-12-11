import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';

abstract class SignUpDS{
  Future<AuthResponse>signUp(SignUpRequest request);
}