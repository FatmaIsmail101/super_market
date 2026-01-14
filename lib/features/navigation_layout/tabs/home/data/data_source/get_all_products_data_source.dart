import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_response.dart';

abstract class GetAllProductsDataSource {
  Future<ProductsResponse> getAllProducts();
}
