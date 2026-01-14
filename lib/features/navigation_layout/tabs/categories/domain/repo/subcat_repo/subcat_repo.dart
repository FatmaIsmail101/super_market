import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';

import '../../../data/models/sub_categories_models/sub_categories_response_dto.dart';

abstract class SubcatRepo {
  Future<Either<CommerceFailure, SubCategoriesResponseDto>> subCat(
    String catId,
  );
}
