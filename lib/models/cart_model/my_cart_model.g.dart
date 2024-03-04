// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseModel _$CartResponseModelFromJson(Map<String, dynamic> json) =>
    CartResponseModel(
      title: json['title'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CartDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseModelToJson(CartResponseModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };

BillingAddressModel _$BillingAddressModelFromJson(Map<String, dynamic> json) =>
    BillingAddressModel(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      contactNumber: json['contactNumber'] as String?,
      contactNumberAlt: json['contactNumberAlt'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$BillingAddressModelToJson(
        BillingAddressModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'contactNumber': instance.contactNumber,
      'contactNumberAlt': instance.contactNumberAlt,
      'location': instance.location,
    };

ShippingAddressModel _$ShippingAddressModelFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressModel(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      contactNumber: json['contactNumber'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$ShippingAddressModelToJson(
        ShippingAddressModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'contactNumber': instance.contactNumber,
      'location': instance.location,
    };

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      variantType: json['variantType'] as String?,
      productImages: (json['productImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      selectedVariantName: json['selectedVariantName'] as String?,
      selectedColor: json['selectedColor'] == null
          ? null
          : ColorModel.fromJson(json['selectedColor'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      unitWeight: json['unitWeight'] as int?,
      price: json['price'] as int?,
      strikePrice: json['strikePrice'] as int?,
      offPercent: json['offPercent'] as int?,
      minOrder: json['minOrder'] as int?,
      maxOrder: json['maxOrder'] as int?,
      subTotal: json['subTotal'] as int?,
      rewardPoint: json['rewardPoint'] as int?,
      reviewGiven: json['reviewGiven'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'variantType': instance.variantType,
      'productImages': instance.productImages,
      'selectedVariantName': instance.selectedVariantName,
      'selectedColor': instance.selectedColor,
      'quantity': instance.quantity,
      'unitWeight': instance.unitWeight,
      'price': instance.price,
      'strikePrice': instance.strikePrice,
      'offPercent': instance.offPercent,
      'minOrder': instance.minOrder,
      'maxOrder': instance.maxOrder,
      'subTotal': instance.subTotal,
      'rewardPoint': instance.rewardPoint,
      'reviewGiven': instance.reviewGiven,
      'id': instance.id,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      brand: json['brand'] as String?,
      title: json['title'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'brand': instance.brand,
      'title': instance.title,
      'images': instance.images,
    };

ColorModel _$ColorModelFromJson(Map<String, dynamic> json) => ColorModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      colorValue: json['colorValue'] as String?,
    );

Map<String, dynamic> _$ColorModelToJson(ColorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'colorValue': instance.colorValue,
    };
