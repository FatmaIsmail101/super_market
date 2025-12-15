import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_code_response.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/rest_code_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/repository/reset_code/reset_code_repo.dart';

@injectable
class ResetCodeUseCase {
  ResetCodeRepo resetCodeRepo;

  ResetCodeUseCase(this.resetCodeRepo);

  Future<Either<CommerceFailure, ResetCodeResponse>> resetCode(
    RestCodeRequest request,
  ) async {
    return resetCodeRepo.resetCode(request);
  }
}
