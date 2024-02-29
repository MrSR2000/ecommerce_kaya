import 'package:json_annotation/json_annotation.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class SizeVariantsModel {
  final String? variantName;
  final double? price;
  final int? rewardPoint;
  final double? unitWeight;
  final double? strikePrice;
  final double? offPercent;
  final int? minOrder;
  final int? maxOrder;
  final bool? status;
  final List<String>? images;
  final List<String>? imagesAlt;
  final int? stockAlertOn;
  final int? totalStock;
  final DateTime? expiresAt;
  final String? id;

  SizeVariantsModel({
    this.variantName,
    this.price,
    this.rewardPoint,
    this.unitWeight,
    this.strikePrice,
    this.offPercent,
    this.minOrder,
    this.maxOrder,
    this.status,
    this.images,
    this.imagesAlt,
    this.stockAlertOn,
    this.totalStock,
    this.expiresAt,
    this.id,
  });

  factory SizeVariantsModel.fromJson(Map<String, dynamic> json) =>
      _$SizeVariantsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SizeVariantsModelToJson(this);
}

@JsonSerializable()
class CategoryModel {
  final String? id;
  final String? slug;
  final String? title;
  final int? level;
  final String? parentId;
  final String? metaRobots;
  final String? socialImage;
  final String? metaTitle;
  final String? metaDescription;

  CategoryModel(
    this.id,
    this.slug,
    this.title,
    this.level,
    this.parentId,
    this.metaRobots,
    this.socialImage,
    this.metaTitle,
    this.metaDescription,
  );
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class BrandModel {
  final String? id;
  final String? slug;
  final String? name;

  BrandModel({
    this.id,
    this.slug,
    this.name,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}

@JsonSerializable()
class ColorAttributeModel {
  final String? id;
  final String? name;
  final String? colorValue;

  ColorAttributeModel({
    this.id,
    this.name,
    this.colorValue,
  });

  factory ColorAttributeModel.fromJson(Map<String, dynamic> json) =>
      _$ColorAttributeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorAttributeModelToJson(this);
}

@JsonSerializable()
class ColorVariantsModel {
  final String? id;
  final ColorAttributeModel? color;
  final double? price;
  final double? rewardPoint;
  final double? unitWeight;
  final double? strikePrice;
  final double? offPercent;
  final int? minOrder;
  final int? maxOrder;
  final bool? status;
  final List<String>? images;
  final List<String?>? imagesAlt;
  final int? stockAlertOn;
  final int? totalStock;
  final DateTime? expiresAt;

  ColorVariantsModel(
    this.id,
    this.color,
    this.price,
    this.rewardPoint,
    this.unitWeight,
    this.strikePrice,
    this.offPercent,
    this.minOrder,
    this.maxOrder,
    this.status,
    this.images,
    this.imagesAlt,
    this.stockAlertOn,
    this.totalStock,
    this.expiresAt,
  );

  factory ColorVariantsModel.fromJson(Map<String, dynamic> json) =>
      _$ColorVariantsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorVariantsModelToJson(this);
}

@JsonSerializable()
class DataModel {
  final String? id;
  final String? slug;
  final CategoryModel? category;
  final BrandModel? brand;
  final String? title;
  final String? description;
  final double? price;
  final double? strikePrice;
  final double? offPercent;
  final int? minOrder;
  final int? maxOrder;
  final double? ratings;
  final double? totalRatings;
  final double? ratedBy;
  final List<String>? images;
  final List<ColorAttributeModel>? colorAttributes;
  final List<ColorVariantsModel>? colorVariants;
  final List<SizeVariantsModel>? sizeVariants;
  final String? variantType;

  DataModel(
    this.id,
    this.slug,
    this.category,
    this.brand,
    this.title,
    this.description,
    this.price,
    this.strikePrice,
    this.offPercent,
    this.minOrder,
    this.maxOrder,
    this.ratings,
    this.totalRatings,
    this.ratedBy,
    this.images,
    this.colorAttributes,
    this.colorVariants,
    this.sizeVariants,
    this.variantType,
  );

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable()
class ProductDetailModel {
  final String? title;
  final String? message;
  final DataModel? data;

  ProductDetailModel(
    this.title,
    this.message,
    this.data,
  );

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);
}
