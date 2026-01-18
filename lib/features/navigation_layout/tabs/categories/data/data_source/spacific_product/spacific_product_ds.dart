import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/constants/di.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';

import '../../models/product_specific_model/product_specific_model.dart';

abstract class SpacificProductDs {
  Future<ProductSpecificModel> getProduct(String id);
}

@Injectable(as: SpacificProductDs)
class SpacificProductDsImpl implements SpacificProductDs {
  @override
  Future<ProductSpecificModel> getProduct(String id) {
    return getIt<EcommerceClient>().getSpacificPro(id);
  }
}
