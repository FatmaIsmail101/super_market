import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_response.dart';

abstract class VerifyEmailRepository {
  Future<Either<CommerceFailure, VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequest request,
  );
}
