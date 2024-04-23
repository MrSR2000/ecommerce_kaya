// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
      title: json['title'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SliderData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };

SliderData _$SliderDataFromJson(Map<String, dynamic> json) => SliderData(
      id: json['id'] as String?,
      image: json['image'] as String?,
      link: json['link'] as String?,
      title: json['title'] as String?,
      imageAlt: json['imageAlt'] as String?,
    );

Map<String, dynamic> _$SliderDataToJson(SliderData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'link': instance.link,
      'title': instance.title,
      'imageAlt': instance.imageAlt,
    };
