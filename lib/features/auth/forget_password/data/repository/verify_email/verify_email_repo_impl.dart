import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/cache_helper/cache_helper.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/data_source/verify_email/verify_email_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_response.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/repository/verify_email/verify_email_repo.dart';

import '../../models/verify_email/verify_email_request.dart';

@Injectable(as: VerifyEmailRepository)
class VerifyEmailRepositoryImpl implements VerifyEmailRepository {
  VerifyEmailDS ds;

  VerifyEmailRepositoryImpl(this.ds);

  @override
  Future<Either<CommerceFailure, VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequest request,
  ) async {
    try {
      var email = CacheHelper.getString("email");
      if (email == null) {
        return Left(GeneralFailure(message: "No email cached"));
      } else {
        var result = await ds.verifyEmail(request);
        return Right(result);
      }
    } catch (e) {
      return Left(GeneralFailure(message: "Something went wrong "));
    }
  }
}
