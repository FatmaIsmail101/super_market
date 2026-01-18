// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_specific_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSpecificModel _$ProductSpecificModelFromJson(
  Map<String, dynamic> json,
) => ProductSpecificModel(
  sold: (json['sold'] as num?)?.toInt(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  subcategory:
      (json['subcategory'] as List<dynamic>?)
          ?.map((e) => SubCategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
  ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
  id: json['_id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  price: json['price'] as num?,
  imageCover: json['imageCover'] as String?,
  category:
      json['category'] == null
          ? null
          : CategoryDto.fromJson(json['category'] as Map<String, dynamic>),
  brand:
      json['brand'] == null
          ? null
          : BrandDto.fromJson(json['brand'] as Map<String, dynamic>),
  ratingsAverage: json['ratingsAverage'] as num?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$ProductSpecificModelToJson(
  ProductSpecificModel instance,
) => <String, dynamic>{
  'sold': instance.sold,
  'images': instance.images,
  'subcategory': instance.subcategory,
  'ratingsQuantity': instance.ratingsQuantity,
  '_id': instance.id,
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'quantity': instance.quantity,
  'price': instance.price,
  'imageCover': instance.imageCover,
  'category': instance.category,
  'brand': instance.brand,
  'ratingsAverage': instance.ratingsAverage,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

SubCategoryDto _$SubCategoryDtoFromJson(Map<String, dynamic> json) =>
    SubCategoryDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      categoryId: json['category'] as String?,
    );

Map<String, dynamic> _$SubCategoryDtoToJson(SubCategoryDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.categoryId,
    };

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };

BrandDto _$BrandDtoFromJson(Map<String, dynamic> json) => BrandDto(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$BrandDtoToJson(BrandDto instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};
