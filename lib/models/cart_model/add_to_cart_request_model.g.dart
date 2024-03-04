// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartRequestModel _$AddToCartRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddToCartRequestModel(
      product: json['product'] as String,
      quantity: json['quantity'] as int,
      variantType: json['variantType'] as String,
      variantId: json['variantId'] as String,
      refCode: json['refCode'] as String,
    );

Map<String, dynamic> _$AddToCartRequestModelToJson(
        AddToCartRequestModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'variantType': instance.variantType,
      'variantId': instance.variantId,
      'refCode': instance.refCode,
    };
