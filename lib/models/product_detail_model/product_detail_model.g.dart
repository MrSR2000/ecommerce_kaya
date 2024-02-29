// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizeVariantsModel _$SizeVariantsModelFromJson(Map<String, dynamic> json) =>
    SizeVariantsModel(
      variantName: json['variantName'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      rewardPoint: json['rewardPoint'] as int?,
      unitWeight: (json['unitWeight'] as num?)?.toDouble(),
      strikePrice: (json['strikePrice'] as num?)?.toDouble(),
      offPercent: (json['offPercent'] as num?)?.toDouble(),
      minOrder: json['minOrder'] as int?,
      maxOrder: json['maxOrder'] as int?,
      status: json['status'] as bool?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      imagesAlt: (json['imagesAlt'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stockAlertOn: json['stockAlertOn'] as int?,
      totalStock: json['totalStock'] as int?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SizeVariantsModelToJson(SizeVariantsModel instance) =>
    <String, dynamic>{
      'variantName': instance.variantName,
      'price': instance.price,
      'rewardPoint': instance.rewardPoint,
      'unitWeight': instance.unitWeight,
      'strikePrice': instance.strikePrice,
      'offPercent': instance.offPercent,
      'minOrder': instance.minOrder,
      'maxOrder': instance.maxOrder,
      'status': instance.status,
      'images': instance.images,
      'imagesAlt': instance.imagesAlt,
      'stockAlertOn': instance.stockAlertOn,
      'totalStock': instance.totalStock,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'id': instance.id,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      json['id'] as String?,
      json['slug'] as String?,
      json['title'] as String?,
      json['level'] as int?,
      json['parentId'] as String?,
      json['metaRobots'] as String?,
      json['socialImage'] as String?,
      json['metaTitle'] as String?,
      json['metaDescription'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'level': instance.level,
      'parentId': instance.parentId,
      'metaRobots': instance.metaRobots,
      'socialImage': instance.socialImage,
      'metaTitle': instance.metaTitle,
      'metaDescription': instance.metaDescription,
    };

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => BrandModel(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
    };

ColorAttributeModel _$ColorAttributeModelFromJson(Map<String, dynamic> json) =>
    ColorAttributeModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      colorValue: json['colorValue'] as String?,
    );

Map<String, dynamic> _$ColorAttributeModelToJson(
        ColorAttributeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'colorValue': instance.colorValue,
    };

ColorVariantsModel _$ColorVariantsModelFromJson(Map<String, dynamic> json) =>
    ColorVariantsModel(
      json['id'] as String?,
      json['color'] == null
          ? null
          : ColorAttributeModel.fromJson(json['color'] as Map<String, dynamic>),
      (json['price'] as num?)?.toDouble(),
      (json['rewardPoint'] as num?)?.toDouble(),
      (json['unitWeight'] as num?)?.toDouble(),
      (json['strikePrice'] as num?)?.toDouble(),
      (json['offPercent'] as num?)?.toDouble(),
      json['minOrder'] as int?,
      json['maxOrder'] as int?,
      json['status'] as bool?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['imagesAlt'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['stockAlertOn'] as int?,
      json['totalStock'] as int?,
      json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$ColorVariantsModelToJson(ColorVariantsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'price': instance.price,
      'rewardPoint': instance.rewardPoint,
      'unitWeight': instance.unitWeight,
      'strikePrice': instance.strikePrice,
      'offPercent': instance.offPercent,
      'minOrder': instance.minOrder,
      'maxOrder': instance.maxOrder,
      'status': instance.status,
      'images': instance.images,
      'imagesAlt': instance.imagesAlt,
      'stockAlertOn': instance.stockAlertOn,
      'totalStock': instance.totalStock,
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      json['id'] as String?,
      json['slug'] as String?,
      json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      json['brand'] == null
          ? null
          : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      json['title'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['strikePrice'] as num?)?.toDouble(),
      (json['offPercent'] as num?)?.toDouble(),
      json['minOrder'] as int?,
      json['maxOrder'] as int?,
      (json['ratings'] as num?)?.toDouble(),
      (json['totalRatings'] as num?)?.toDouble(),
      (json['ratedBy'] as num?)?.toDouble(),
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['colorAttributes'] as List<dynamic>?)
          ?.map((e) => ColorAttributeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['colorVariants'] as List<dynamic>?)
          ?.map((e) => ColorVariantsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sizeVariants'] as List<dynamic>?)
          ?.map((e) => SizeVariantsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['variantType'] as String?,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'category': instance.category,
      'brand': instance.brand,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'strikePrice': instance.strikePrice,
      'offPercent': instance.offPercent,
      'minOrder': instance.minOrder,
      'maxOrder': instance.maxOrder,
      'ratings': instance.ratings,
      'totalRatings': instance.totalRatings,
      'ratedBy': instance.ratedBy,
      'images': instance.images,
      'colorAttributes': instance.colorAttributes,
      'colorVariants': instance.colorVariants,
      'sizeVariants': instance.sizeVariants,
      'variantType': instance.variantType,
    };

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      json['title'] as String?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
