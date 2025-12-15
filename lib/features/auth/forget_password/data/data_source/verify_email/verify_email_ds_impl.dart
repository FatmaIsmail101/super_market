import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/constants/di.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/data_source/verify_email/verify_email_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_response.dart';

@Injectable(as: VerifyEmailDS)
class VerifyEmailDSImpl implements VerifyEmailDS {
  @override
  Future<VerifyEmailResponse> verifyEmail(VerifyEmailRequest request) {
    return getIt<EcommerceClient>().forgetPassword(request);
  }
}
