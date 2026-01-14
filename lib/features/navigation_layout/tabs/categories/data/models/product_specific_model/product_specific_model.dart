import 'package:json_annotation/json_annotation.dart';

part 'product_specific_model.g.dart';

@JsonSerializable()
class ProductSpecificModel {
  @JsonKey(name: 'sold')
  int? sold;

  @JsonKey(name: 'images')
  List<String>? images;

  @JsonKey(name: 'subcategory')
  List<SubCategoryDto>? subcategory;

  @JsonKey(name: 'ratingsQuantity')
  int? ratingsQuantity;

  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'slug')
  String? slug;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'quantity')
  int? quantity;

  @JsonKey(name: 'price')
  num? price;

  @JsonKey(name: 'imageCover')
  String? imageCover;

  @JsonKey(name: 'category')
  CategoryDto? category;

  @JsonKey(name: 'brand')
  BrandDto? brand;

  @JsonKey(name: 'ratingsAverage')
  num? ratingsAverage;

  @JsonKey(name: 'createdAt')
  String? createdAt;

  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  ProductSpecificModel({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductSpecificModel.fromJson(Map<String, dynamic> json) =>
      _$ProductSpecificModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSpecificModelToJson(this);
}

@JsonSerializable()
class SubCategoryDto {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'slug')
  String? slug;

  @JsonKey(name: 'category')
  String? categoryId;

  SubCategoryDto({this.id, this.name, this.slug, this.categoryId});

  factory SubCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryDtoToJson(this);
}

@JsonSerializable()
class CategoryDto {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'slug')
  String? slug;

  @JsonKey(name: 'image')
  String? image;

  CategoryDto({this.id, this.name, this.slug, this.image});

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}

@JsonSerializable()
class BrandDto {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'slug')
  String? slug;

  @JsonKey(name: 'image')
  String? image;

  BrandDto({this.id, this.name, this.slug, this.image});

  factory BrandDto.fromJson(Map<String, dynamic> json) =>
      _$BrandDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDtoToJson(this);
}
