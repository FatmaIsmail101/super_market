import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/constants/di.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/data_source/subcat_ds/subcat_ds.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/sub_categories_models/sub_categories_response_dto.dart';

@Injectable(as: SubcatDs)
class SubcatDsImpl implements SubcatDs {
  @override
  Future<SubCategoriesResponseDto> getAllSubCat(String catId) {
    return getIt<EcommerceClient>().getAllSubCat(catId);
  }
}
