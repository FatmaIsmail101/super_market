import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';

import '../../../data/models/product_specific_model/product_specific_model.dart';

abstract class GetProductRepo {
  Future<Either<CommerceFailure, ProductSpecificModel>> getSpacificPro(
    String id,
  );
}
