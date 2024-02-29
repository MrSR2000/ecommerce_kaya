// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      total: json['total'] as int?,
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      perviousPage: json['perviousPage'] as bool?,
      nextPage: json['nextPage'] as bool?,
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'perviousPage': instance.perviousPage,
      'nextPage': instance.nextPage,
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

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      brand: json['brand'] == null
          ? null
          : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      strikePrice: (json['strikePrice'] as num?)?.toDouble(),
      offPercent: (json['offPercent'] as num?)?.toDouble(),
      ratings: (json['ratings'] as num?)?.toDouble(),
      totalRatings: (json['totalRatings'] as num?)?.toDouble(),
      ratedBy: json['ratedBy'] as int?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      variantType: json['variantType'] as String?,
      wished: json['wished'] as bool?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'brand': instance.brand,
      'title': instance.title,
      'price': instance.price,
      'strikePrice': instance.strikePrice,
      'offPercent': instance.offPercent,
      'ratings': instance.ratings,
      'totalRatings': instance.totalRatings,
      'ratedBy': instance.ratedBy,
      'images': instance.images,
      'variantType': instance.variantType,
      'wished': instance.wished,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'pagination': instance.pagination,
      'docs': instance.docs,
    };

ProductOuterModel _$ProductOuterModelFromJson(Map<String, dynamic> json) =>
    ProductOuterModel(
      title: json['title'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductOuterModelToJson(ProductOuterModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
