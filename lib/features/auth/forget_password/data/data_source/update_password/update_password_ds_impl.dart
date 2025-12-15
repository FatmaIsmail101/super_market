import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/constants/di.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/data_source/update_password/update_password_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_password_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';

@Injectable(as: UpdatePasswordDs)
class UpdatePasswordDSImpl implements UpdatePasswordDs {
  @override
  Future<AuthResponse> updatePassword({
    required ResetPasswordRequest request,
    required String token,
  }) {
    return getIt<EcommerceClient>().updatePassword(request, token);
  }
}
