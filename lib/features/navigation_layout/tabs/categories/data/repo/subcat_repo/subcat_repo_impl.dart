import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/data_source/subcat_ds/subcat_ds.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/sub_categories_models/sub_categories_response_dto.dart';

import '../../../domain/repo/subcat_repo/subcat_repo.dart';

@Injectable(as: SubcatRepo)
class SubcatRepoImpl implements SubcatRepo {
  SubcatDs subcatDs;

  SubcatRepoImpl(this.subcatDs);

  @override
  Future<Either<CommerceFailure, SubCategoriesResponseDto>> subCat(
    String catId,
  ) async {
    try {
      final result = await subcatDs.getAllSubCat(catId);
      return Right(result);
    } catch (e) {
      print(e.toString());
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
