import 'package:json_annotation/json_annotation.dart';

part 'user_detail_model.g.dart';

@JsonSerializable()
class UserDetailOuterModel {
  String? title;
  String? message;
  UserDetailModel? data;

  UserDetailOuterModel({
    this.data,
    this.message,
    this.title,
  });

  factory UserDetailOuterModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailOuterModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailOuterModelToJson(this);
}

@JsonSerializable()
class UserDetailModel {
  String? id;
  String? slug;
  List<String>? userType;
  List<String>? permissions;
  String? status;
  String? email;
  int? emailVerifyCode;
  int? contactNumberVerifyCode;
  int? resetPasswordCode;
  String? fullName;
  int? rewardCoinAvailable;
  bool? isContactNumberVerified;
  bool? isEmailVerified;
  bool? isActive;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? emailVerifiedAt;

  UserDetailModel({
    this.id,
    this.slug,
    this.userType,
    this.permissions,
    this.status,
    this.email,
    this.emailVerifyCode,
    this.contactNumberVerifyCode,
    this.resetPasswordCode,
    this.fullName,
    this.rewardCoinAvailable,
    this.isContactNumberVerified,
    this.isEmailVerified,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.emailVerifiedAt,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailModelToJson(this);
}
