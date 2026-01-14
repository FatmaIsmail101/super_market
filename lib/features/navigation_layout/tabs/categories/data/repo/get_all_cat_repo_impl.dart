import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/data_source/get_all_cat_ds.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/category_models/categories_response_dto.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/repo/get_all_cat_repo.dart';

@Injectable(as: GetAllCategoriesRepo)
class GetAllCategoriesRepoImpl implements GetAllCategoriesRepo {
  GetAllCategoriesDs getAllCategoriesDs;

  GetAllCategoriesRepoImpl(this.getAllCategoriesDs);

  @override
  Future<Either<CommerceFailure, CategoriesResponseDto>>
  getAllCategories() async {
    try {
      final result = await getAllCategoriesDs.getAllCategories();
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
