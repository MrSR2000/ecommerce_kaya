import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class PaginationModel {
  int? total;
  int? page;
  int? limit;
  bool? perviousPage;
  bool? nextPage;

  PaginationModel({
    this.total,
    this.page,
    this.limit,
    this.perviousPage,
    this.nextPage,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}

@JsonSerializable()
class BrandModel {
  String? id;
  String? slug;
  String? name;

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
class ProductModel {
  String? id;
  String? slug;
  BrandModel? brand;
  String? title;
  double? price;
  double? strikePrice;
  double? offPercent;
  double? ratings;
  double? totalRatings;
  int? ratedBy;
  List<String>? images;
  String? variantType;
  bool? wished;

  ProductModel({
    this.id,
    this.slug,
    this.brand,
    this.title,
    this.price,
    this.strikePrice,
    this.offPercent,
    this.ratings,
    this.totalRatings,
    this.ratedBy,
    this.images,
    this.variantType,
    this.wished,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class DataModel {
  PaginationModel? pagination;
  List<ProductModel>? docs;

  DataModel({
    this.pagination,
    this.docs,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable()
class ProductOuterModel {
  String? title;
  String? message;
  DataModel? data;

  ProductOuterModel({
    this.title,
    this.message,
    this.data,
  });

  factory ProductOuterModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOuterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOuterModelToJson(this);
}
