import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';

import '../../../data/models/product_specific_model/product_specific_model.dart';
import '../../repo/get_product_repo/get_product_repo.dart';

@injectable
class SpacificProductUsecase {
  GetProductRepo getProductRepo;

  SpacificProductUsecase(this.getProductRepo);

  Future<Either<CommerceFailure, ProductSpecificModel>> call(String id) {
    return getProductRepo.getSpacificPro(id);
  }
}
