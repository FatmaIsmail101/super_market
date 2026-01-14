import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_response.dart';

abstract class GetAllProductsRepo {
  Future<Either<CommerceFailure, ProductsResponse>> getAllProduts();
}
