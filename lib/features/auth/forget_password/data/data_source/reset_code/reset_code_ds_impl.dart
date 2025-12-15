import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/data_source/reset_code/reset_code_ds.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_code_response.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/rest_code_request.dart';

import '../../../../../../core/constants/di.dart';

@Injectable(as: ResetCodeDS)
class ResetCodeDSImpl implements ResetCodeDS {
  @override
  Future<ResetCodeResponse> resetCode(RestCodeRequest request) {
    return getIt<EcommerceClient>().resetCode(request);
  }
}
