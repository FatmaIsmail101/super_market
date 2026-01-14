import 'package:json_annotation/json_annotation.dart';
import '../../../../home/data/model/product_model.dart';
import 'sub_category_dto.dart';

part 'sub_categories_response_dto.g.dart';

@JsonSerializable()
class SubCategoriesResponseDto {
  int? results;
  Metadata? metadata;
  @JsonKey(name: "data")
  List<SubCategoryDto>? subCategory;

  SubCategoriesResponseDto({this.results, this.metadata, this.subCategory});

  factory SubCategoriesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubCategoriesResponseDtoFromJson(json);
}
