// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  sold: (json['sold'] as num?)?.toInt(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  subcategory:
      (json['subcategory'] as List<dynamic>?)
          ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
  ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
  id: json['id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toDouble(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toDouble(),
  imageCover: json['imageCover'] as String?,
  category:
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
  brand:
      json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
  ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'sold': instance.sold,
      'images': instance.images,
      'subcategory': instance.subcategory?.map((e) => e.toJson()).toList(),
      'ratingsQuantity': instance.ratingsQuantity,
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'imageCover': instance.imageCover,
      'category': instance.category?.toJson(),
      'brand': instance.brand?.toJson(),
      'ratingsAverage': instance.ratingsAverage,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  nextPage: (json['nextPage'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'numberOfPages': instance.numberOfPages,
  'limit': instance.limit,
  'nextPage': instance.nextPage,
};
