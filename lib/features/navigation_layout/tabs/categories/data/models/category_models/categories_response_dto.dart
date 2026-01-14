import '../../../../home/data/model/product_model.dart';
import 'category_dto.dart';

class CategoriesResponseDto {
  int? results;
  Metadata? metadata;
  List<CategoryDto>? categories;

  CategoriesResponseDto({this.results, this.metadata, this.categories});

  CategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      categories = <CategoryDto>[];
      json['data'].forEach((v) {
        categories!.add(CategoryDto.fromJson(v));
      });
    }
  }
}
