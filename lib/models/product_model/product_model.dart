import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
class PaginationModel with _$PaginationModel {
  const factory PaginationModel(
    final int? total,
    final int? page,
    final int? limit,
    final bool? perviousPage,
    final bool? nextPage,
  ) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
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

@freezed
class DataModel with _$DataModel {
  const factory DataModel(
    final PaginationModel? pagination,
    final List<ProductModel>? docs,
  ) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
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
