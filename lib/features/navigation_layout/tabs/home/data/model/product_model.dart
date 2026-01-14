import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {
  int? sold;
  List<String>? images;
  List<SubCategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  double? price;
  double? priceAfterDiscount;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductModel({
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
    this.priceAfterDiscount,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class SubCategory {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? slug;
  String? category;

  SubCategory({this.id, this.name, this.slug, this.category});

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? slug;
  String? image;

  Category({this.id, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Brand {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? slug;
  String? image;

  Brand({this.id, this.name, this.slug, this.image});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
