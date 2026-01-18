import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/category_models/categories_response_dto.dart';

abstract class GetAllCategoriesDs {
  Future<CategoriesResponseDto> getAllCategories();
}
