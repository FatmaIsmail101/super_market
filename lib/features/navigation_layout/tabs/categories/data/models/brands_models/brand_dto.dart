import 'package:json_annotation/json_annotation.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/brand.dart';

part 'brand_dto.g.dart';

@JsonSerializable()
class BrandDto {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  BrandDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandDto.fromJson(Map<String, dynamic> json) =>
      _$BrandDtoFromJson(json);

  Brand toEntity() {
    return Brand(
      id: id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
