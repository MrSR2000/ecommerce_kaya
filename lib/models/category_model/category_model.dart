import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class ProductCategoryOuterModel {
  String title;
  String message;
  List<CategoryDataModel> data;

  ProductCategoryOuterModel({
    required this.title,
    required this.message,
    required this.data,
  });

  factory ProductCategoryOuterModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryOuterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryOuterModelToJson(this);
}

@JsonSerializable()
class CategoryDataModel {
  String? id;
  String slug;
  String title;
  int level;
  String image;
  String? metaRobots;
  String? socialImage;
  String? metaTitle;
  String? imageAlt;
  String? metaDescription;

  CategoryDataModel({
    this.id,
    required this.slug,
    required this.title,
    required this.level,
    required this.image,
    this.metaRobots,
    this.socialImage,
    this.metaTitle,
    this.imageAlt,
    this.metaDescription,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataModelToJson(this);
}
