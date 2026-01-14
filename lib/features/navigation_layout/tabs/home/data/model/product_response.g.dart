// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      results: (json['results'] as num?)?.toInt(),
      metadata:
          json['metadata'] == null
              ? null
              : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      products:
          (json['data'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata?.toJson(),
      'data': instance.products?.map((e) => e.toJson()).toList(),
    };
