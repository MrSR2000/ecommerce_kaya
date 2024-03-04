// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryOuterModel _$ProductCategoryOuterModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryOuterModel(
      title: json['title'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CategoryDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductCategoryOuterModelToJson(
        ProductCategoryOuterModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };

CategoryDataModel _$CategoryDataModelFromJson(Map<String, dynamic> json) =>
    CategoryDataModel(
      id: json['_id'] as String?,
      slug: json['slug'] as String,
      title: json['title'] as String,
      level: json['level'] as int,
      image: json['image'] as String,
      metaRobots: json['metaRobots'] as String?,
      socialImage: json['socialImage'] as String?,
      metaTitle: json['metaTitle'] as String?,
      imageAlt: json['imageAlt'] as String?,
      metaDescription: json['metaDescription'] as String?,
    );

Map<String, dynamic> _$CategoryDataModelToJson(CategoryDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'level': instance.level,
      'image': instance.image,
      'metaRobots': instance.metaRobots,
      'socialImage': instance.socialImage,
      'metaTitle': instance.metaTitle,
      'imageAlt': instance.imageAlt,
      'metaDescription': instance.metaDescription,
    };
