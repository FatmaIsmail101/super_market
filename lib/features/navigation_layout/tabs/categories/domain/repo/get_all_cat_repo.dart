import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/category_models/categories_response_dto.dart';

abstract class GetAllCategoriesRepo {
  Future<Either<CommerceFailure, CategoriesResponseDto>> getAllCategories();
}
