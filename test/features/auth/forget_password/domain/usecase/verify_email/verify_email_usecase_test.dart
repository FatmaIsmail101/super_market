import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/verify_email_response.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/repository/verify_email/verify_email_repo.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/usecase/verify_email/verify_email_usecase.dart';

import 'verify_email_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<VerifyEmailRepository>()])
void main() {
  test('TODO: Implement tests for verify_email_usecase.dart', () async {
    //Arrange
    final repo = MockVerifyEmailRepository();
    final useCase = VerifyEmailUsecas(repo);
    final response = VerifyEmailResponse(message: "true");
    final request = VerifyEmailRequest(email: "ismailfatm197@gmail.com");
    when(
      repo.verifyEmail(request),
    ).thenAnswer((realInvocation) async => Right(response));
    //Act
    final result = await useCase.verify(request);
    //Assert
    expect(result, Right(response));
    verify(repo.verifyEmail(request)).called(1);
  });
}
