import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/product_specific_model/product_specific_model.dart';

import '../../../../../../../core/error_handling/error_handling.dart';
import '../../../domain/repo/get_product_repo/get_product_repo.dart';
import '../../data_source/spacific_product/spacific_product_ds.dart';

@Injectable(as: GetProductRepo)
class GetSpacificProductRepo implements GetProductRepo {
  SpacificProductDs spacificProductDs;

  GetSpacificProductRepo(this.spacificProductDs);

  @override
  Future<Either<CommerceFailure, ProductSpecificModel>> getSpacificPro(
    String id,
  ) async {
    try {
      final result = await spacificProductDs.getProduct(id);
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
