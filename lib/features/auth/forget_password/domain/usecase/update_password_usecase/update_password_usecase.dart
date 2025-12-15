import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_password_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/repository/update_password_repo/update_password_repository.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';

@injectable
class UpdatePasswordUsecase {
  UpdatePasswordRepository updatePasswordRepository;

  UpdatePasswordUsecase(this.updatePasswordRepository);

  Future<Either<CommerceFailure, AuthResponse>> call(
    ResetPasswordRequest request,
  ) {
    return updatePasswordRepository.updatePassword(request);
  }
}
