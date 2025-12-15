import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/cache_helper/cache_helper.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/data_source/update_password/update_password_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_password_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/repository/update_password_repo/update_password_repository.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';

@Injectable(as: UpdatePasswordRepository)
class UpdatePasswordRepositoryImpl implements UpdatePasswordRepository {
  UpdatePasswordDs updatePasswordDs;

  UpdatePasswordRepositoryImpl(this.updatePasswordDs);

  @override
  Future<Either<CommerceFailure, AuthResponse>> updatePassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final token = CacheHelper.getString("token");
      if (token == null) {
        return Left(GeneralFailure(message: "The Account doesn't exist"));
      }
      var result = await updatePasswordDs.updatePassword(
        request: request,
        token: token,
      );
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: "Something went wrong"));
    }
  }
}
