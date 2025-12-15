import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/data_source/reset_code/reset_code_ds.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_code_response.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/repository/reset_code/reset_code_repo.dart';

import '../../models/verify_email/rest_code_request.dart';

@Injectable(as: ResetCodeRepo)
class ResetCodeRepositoryImpl implements ResetCodeRepo {
  ResetCodeDS resetCodeDS;

  ResetCodeRepositoryImpl(this.resetCodeDS);

  @override
  Future<Either<CommerceFailure, ResetCodeResponse>> resetCode(
    RestCodeRequest request,
  ) async {
    try {
      var result = await resetCodeDS.resetCode(request);
      return Right(result);
    } catch (error) {
      return Left(GeneralFailure(message: error.toString()));
    }
  }
}
