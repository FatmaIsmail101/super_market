import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_password_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';

abstract class UpdatePasswordRepository {
  Future<Either<CommerceFailure, AuthResponse>> updatePassword(
    ResetPasswordRequest request,
  );
}
