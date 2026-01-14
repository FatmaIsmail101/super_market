import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/data_source/get_all_cat_ds.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/category_models/categories_response_dto.dart';

import '../../../../../../core/constants/di.dart';

@Injectable(as: GetAllCategoriesDs)
class GetAllCategoriesDsImpl implements GetAllCategoriesDs {
  @override
  Future<CategoriesResponseDto> getAllCategories() {
    return getIt<EcommerceClient>().getCategories();
  }
}
