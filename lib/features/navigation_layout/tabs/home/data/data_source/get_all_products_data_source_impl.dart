import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/constants/di.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/data_source/get_all_products_data_source.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_response.dart';

@Injectable(as: GetAllProductsDataSource)
class GetAllProductsDataSourceImpl implements GetAllProductsDataSource {
  @override
  Future<ProductsResponse> getAllProducts() {
    return getIt<EcommerceClient>().getAllProducts();
  }
}
