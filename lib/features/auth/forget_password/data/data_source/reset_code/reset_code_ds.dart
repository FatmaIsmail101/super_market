import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_code_response.dart';

import '../../models/verify_email/rest_code_request.dart';

abstract class ResetCodeDS {
  Future<ResetCodeResponse> resetCode(RestCodeRequest request);
}
