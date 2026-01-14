import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/reset_code_response.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/data/models/verify_email/rest_code_request.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/repository/reset_code/reset_code_repo.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/domain/usecase/reset_code/reset_code_usecase.dart';

@GenerateNiceMocks([MockSpec<ResetCodeRepo>()])
import 'reset_code_usecase_test.mocks.dart';

void main() {
  late ResetCodeUseCase useCase;
  late MockResetCodeRepo mockRepo;

  setUp(() {
    mockRepo = MockResetCodeRepo();
    useCase = ResetCodeUseCase(mockRepo);
  });
  test('TODO: Implement tests for reset_code_usecase.dart', () async {
    // TODO: Implement test

    //Arrange
    final request = RestCodeRequest(resetCode: "52201");
    final response = ResetCodeResponse();
    when(mockRepo.resetCode(request)).thenAnswer((_) async => Right(response));
    //Act
    final result = await useCase.resetCode(request);
    // Assert
    expect(result, Right(response));
    verify(mockRepo.resetCode(request)).called(1);
  });
}
