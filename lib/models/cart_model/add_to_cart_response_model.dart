import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_response_model.g.dart';

@JsonSerializable()
class CartOuterResponseModel {
  String? title;
  String? message;
  CartDataModel? data;

  CartOuterResponseModel({this.title, this.message, this.data});

  factory CartOuterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartOuterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartOuterResponseModelToJson(this);
}

@JsonSerializable()
class CartDataModel {
  BillingAddressModel? billingAddress;
  ShippingAddressModel? shippingAddress;
  String? id;
  String? user;
  String? orderId;
  String? orderStatus;
  String? paymentMethod;
  bool? paymentVerifiedByAdmin;
  String? paymentStatus;
  int? subTotal;
  int? totalAmount;
  int? amountWithoutDeliveryCharge;
  String? voucherCode;
  bool? useAvailableRewardCoin;
  int? rewardCoin;
  int? voucherAmount;
  int? voucherPercentage;
  int? packageWeight;
  String? deliveryAddress;
  String? deliveryPackageType;
  int? deliveryPackageCost;
  int? deliveryCharge;
  bool? isDeleted;
  List<CartItemModel>? items;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CartDataModel({
    this.billingAddress,
    this.shippingAddress,
    this.id,
    this.user,
    this.orderId,
    this.orderStatus,
    this.paymentMethod,
    this.paymentVerifiedByAdmin,
    this.paymentStatus,
    this.subTotal,
    this.totalAmount,
    this.amountWithoutDeliveryCharge,
    this.voucherCode,
    this.useAvailableRewardCoin,
    this.rewardCoin,
    this.voucherAmount,
    this.voucherPercentage,
    this.packageWeight,
    this.deliveryAddress,
    this.deliveryPackageType,
    this.deliveryPackageCost,
    this.deliveryCharge,
    this.isDeleted,
    this.items,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) =>
      _$CartDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataModelToJson(this);
}

@JsonSerializable()
class BillingAddressModel {
  String? fullName;
  String? email;
  String? contactNumber;
  String? contactNumberAlt;
  String? location;

  BillingAddressModel(
      {this.fullName,
      this.email,
      this.contactNumber,
      this.contactNumberAlt,
      this.location});

  factory BillingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$BillingAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillingAddressModelToJson(this);
}

@JsonSerializable()
class ShippingAddressModel {
  String? fullName;
  String? email;
  String? contactNumber;
  String? location;

  ShippingAddressModel(
      {this.fullName, this.email, this.contactNumber, this.location});

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressModelToJson(this);
}

@JsonSerializable()
class CartItemModel {
  ProductModel? product;
  String? variantType;
  List<String>? productImages;
  String? selectedVariantName;
  ColorModel? selectedColor;
  int? quantity;
  int? unitWeight;
  int? price;
  int? strikePrice;
  int? offPercent;
  int? minOrder;
  int? maxOrder;
  int? subTotal;
  int? rewardPoint;
  bool? reviewGiven;
  String? id;

  CartItemModel({
    this.product,
    this.variantType,
    this.productImages,
    this.selectedVariantName,
    this.selectedColor,
    this.quantity,
    this.unitWeight,
    this.price,
    this.strikePrice,
    this.offPercent,
    this.minOrder,
    this.maxOrder,
    this.subTotal,
    this.rewardPoint,
    this.reviewGiven,
    this.id,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}

@JsonSerializable()
class ProductModel {
  String? id;
  String? slug;
  String? brand;
  String? title;
  List<String>? images;

  ProductModel({this.id, this.slug, this.brand, this.title, this.images});
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ColorModel {
  String? id;
  String? name;
  String? colorValue;

  ColorModel({this.id, this.name, this.colorValue});
  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorModelToJson(this);
}
