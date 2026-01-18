import '../../models/sub_categories_models/sub_categories_response_dto.dart';

abstract class SubcatDs {
  Future<SubCategoriesResponseDto> getAllSubCat(String id);
}
