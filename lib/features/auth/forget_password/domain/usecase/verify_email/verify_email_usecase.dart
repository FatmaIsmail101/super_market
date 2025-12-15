import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_response.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/repository/verify_email/verify_email_repo.dart';

@injectable
class VerifyEmailUsecas {
  VerifyEmailRepository repository;

  VerifyEmailUsecas(this.repository);

  Future<Either<CommerceFailure, VerifyEmailResponse>> verify(
    VerifyEmailRequest request,
  ) async {
    return repository.verifyEmail(request);
  }
}
