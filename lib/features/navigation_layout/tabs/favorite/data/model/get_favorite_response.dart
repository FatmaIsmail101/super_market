import 'package:json_annotation/json_annotation.dart';

part 'get_favorite_response.g.dart';

@JsonSerializable()
class GetFavoriteResponse {
  final String? status;
  final int? count;
  final List<FavoriteProduct>? data;

  GetFavoriteResponse({this.status, this.count, this.data});

  factory GetFavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFavoriteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFavoriteResponseToJson(this);
}

@JsonSerializable()
class FavoriteProduct {
  final int? sold;
  final List<String>? images;
  final List<SubCategory>? subcategory;
  final int? ratingsQuantity;
  @JsonKey(name: "_id")
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final double? price;
  final String? imageCover;
  final Category? category;
  final Brand? brand;
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;

  FavoriteProduct({
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

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteProductToJson(this);
}

@JsonSerializable()
class SubCategory {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? slug;
  final String? category;

  SubCategory({this.id, this.name, this.slug, this.category});

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  Category({this.id, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Brand {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  Brand({this.id, this.name, this.slug, this.image});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
