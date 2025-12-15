import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_password_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';

abstract class UpdatePasswordDs {
  Future<AuthResponse> updatePassword({
    required ResetPasswordRequest request,
    required String token,
  });
}
