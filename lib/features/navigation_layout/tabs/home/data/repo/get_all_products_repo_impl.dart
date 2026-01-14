import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/data_source/get_all_products_data_source.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_response.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/domain/repo/get_all_products_repo.dart';

@Injectable(as: GetAllProductsRepo)
class GetAllProductsRepoImpl implements GetAllProductsRepo {
  GetAllProductsDataSource getAllProductsDs;

  GetAllProductsRepoImpl(this.getAllProductsDs);

  @override
  Future<Either<CommerceFailure, ProductsResponse>> getAllProduts() async {
    try {
      final result = await getAllProductsDs.getAllProducts();
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
