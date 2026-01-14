import 'package:json_annotation/json_annotation.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/sub_category.dart';

part 'sub_category_dto.g.dart';

@JsonSerializable()
class SubCategoryDto {
  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;

  SubCategoryDto({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  factory SubCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryDtoFromJson(json);

  SubCategory toEntity() {
    return SubCategory(
      id: id,
      name: name,
      slug: slug,
      categoryId: category,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
