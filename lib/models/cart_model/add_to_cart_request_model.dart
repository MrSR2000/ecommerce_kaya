import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_request_model.g.dart';

@JsonSerializable()
class AddToCartRequestModel {
  final String product;
  final int quantity;
  final String variantType;
  final String variantId;
  final String refCode;

  AddToCartRequestModel({
    required this.product,
    required this.quantity,
    required this.variantType,
    required this.variantId,
    required this.refCode,
  });

  factory AddToCartRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddToCartRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartRequestModelToJson(this);
}
