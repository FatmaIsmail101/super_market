import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/category_models/categories_response_dto.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/repo/get_all_cat_repo.dart';

@injectable
class GetAllCategoriesUsecase {
  GetAllCategoriesRepo getAllCategoriesRepo;

  GetAllCategoriesUsecase(this.getAllCategoriesRepo);

  Future<Either<CommerceFailure, CategoriesResponseDto>> call() {
    return getAllCategoriesRepo.getAllCategories();
  }
}
