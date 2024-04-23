// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartOuterResponseModel _$CartOuterResponseModelFromJson(
        Map<String, dynamic> json) =>
    CartOuterResponseModel(
      title: json['title'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CartDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartOuterResponseModelToJson(
        CartOuterResponseModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };

CartDataModel _$CartDataModelFromJson(Map<String, dynamic> json) =>
    CartDataModel(
      billingAddress: json['billingAddress'] == null
          ? null
          : BillingAddressModel.fromJson(
              json['billingAddress'] as Map<String, dynamic>),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddressModel.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      id: json['id'] as String?,
      user: json['user'] as String?,
      orderId: json['orderId'] as String?,
      orderStatus: json['orderStatus'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      paymentVerifiedByAdmin: json['paymentVerifiedByAdmin'] as bool?,
      paymentStatus: json['paymentStatus'] as String?,
      subTotal: json['subTotal'] as int?,
      totalAmount: json['totalAmount'] as int?,
      amountWithoutDeliveryCharge: json['amountWithoutDeliveryCharge'] as int?,
      voucherCode: json['voucherCode'] as String?,
      useAvailableRewardCoin: json['useAvailableRewardCoin'] as bool?,
      rewardCoin: json['rewardCoin'] as int?,
      voucherAmount: json['voucherAmount'] as int?,
      voucherPercentage: json['voucherPercentage'] as int?,
      packageWeight: json['packageWeight'] as int?,
      deliveryAddress: json['deliveryAddress'] as String?,
      deliveryPackageType: json['deliveryPackageType'] as String?,
      deliveryPackageCost: json['deliveryPackageCost'] as int?,
      deliveryCharge: json['deliveryCharge'] as int?,
      isDeleted: json['isDeleted'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['v'] as int?,
    );

Map<String, dynamic> _$CartDataModelToJson(CartDataModel instance) =>
    <String, dynamic>{
      'billingAddress': instance.billingAddress,
      'shippingAddress': instance.shippingAddress,
      'id': instance.id,
      'user': instance.user,
      'orderId': instance.orderId,
      'orderStatus': instance.orderStatus,
      'paymentMethod': instance.paymentMethod,
      'paymentVerifiedByAdmin': instance.paymentVerifiedByAdmin,
      'paymentStatus': instance.paymentStatus,
      'subTotal': instance.subTotal,
      'totalAmount': instance.totalAmount,
      'amountWithoutDeliveryCharge': instance.amountWithoutDeliveryCharge,
      'voucherCode': instance.voucherCode,
      'useAvailableRewardCoin': instance.useAvailableRewardCoin,
      'rewardCoin': instance.rewardCoin,
      'voucherAmount': instance.voucherAmount,
      'voucherPercentage': instance.voucherPercentage,
      'packageWeight': instance.packageWeight,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryPackageType': instance.deliveryPackageType,
      'deliveryPackageCost': instance.deliveryPackageCost,
      'deliveryCharge': instance.deliveryCharge,
      'isDeleted': instance.isDeleted,
      'items': instance.items,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
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
