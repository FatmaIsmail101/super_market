// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_categories_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoriesResponseDto _$SubCategoriesResponseDtoFromJson(
    Map<String, dynamic> json) =>
    SubCategoriesResponseDto(
      results: (json['results'] as num?)?.toInt(),
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      subCategory: (json['data'] as List<dynamic>?)
          ?.map((e) => SubCategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubCategoriesResponseDtoToJson(
    SubCategoriesResponseDto instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata,
      'data': instance.subCategory,
    };
