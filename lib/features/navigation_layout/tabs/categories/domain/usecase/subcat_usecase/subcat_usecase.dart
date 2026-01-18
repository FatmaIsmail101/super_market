import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/sub_categories_models/sub_categories_response_dto.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/repo/subcat_repo/subcat_repo.dart';

@injectable
class SubcatUsecase {
  SubcatRepo subcatRepo;

  SubcatUsecase(this.subcatRepo);

  Future<Either<CommerceFailure, SubCategoriesResponseDto>> call(String catId) {
    return subcatRepo.subCat(catId);
  }
}
