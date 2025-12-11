import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/data/models/auth_response.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepository{
  Future<Either<CommerceFailure,AuthResponse>>signUp(SignUpRequest request);
}
