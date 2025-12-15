import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_code_response.dart';

import '../../../data/models/verify_email/rest_code_request.dart';

abstract class ResetCodeRepo {
  Future<Either<CommerceFailure, ResetCodeResponse>> resetCode(
    RestCodeRequest request,
  );
}
