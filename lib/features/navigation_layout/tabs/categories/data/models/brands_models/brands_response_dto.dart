import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/category.dart';
import 'brand_dto.dart';
import 'metadata_dto.dart';

part 'brands_response_dto.g.dart';

@JsonSerializable()
class BrandsResponseDto {
  int? results;
  Metadata? metadata;

  @JsonKey(name: "data")
  List<BrandDto>? brandDto;

  BrandsResponseDto({this.results, this.metadata, this.brandDto});

  factory BrandsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BrandsResponseDtoFromJson(json);
}

extension BrandDtoMapper on BrandDto {
  Category toCategoryEntity() {
    return Category(
      id: id,
      name: name,
      image: image,
    );
  }
}
