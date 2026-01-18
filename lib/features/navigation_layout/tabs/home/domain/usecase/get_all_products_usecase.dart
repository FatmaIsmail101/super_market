import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_response.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/domain/repo/get_all_products_repo.dart';

@injectable
class GetAllProductsUsecase {
  GetAllProductsRepo getAllProductsRepo;

  GetAllProductsUsecase(this.getAllProductsRepo);

  Future<Either<CommerceFailure, ProductsResponse>> call() {
    return getAllProductsRepo.getAllProduts();
  }
}
