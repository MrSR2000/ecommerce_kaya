import 'package:json_annotation/json_annotation.dart';

part "login_model.g.dart";

@JsonSerializable()
class LoginRequestModel {
  final String emailOrContactNumber;
  final String password;

  LoginRequestModel(
      {required this.emailOrContactNumber, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}

@JsonSerializable()
class LoginResponseOuterModel {
  final String title;
  final String message;
  final LoginResponseModel data;

  LoginResponseOuterModel({
    required this.title,
    required this.message,
    required this.data,
  });

  factory LoginResponseOuterModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseOuterModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseOuterModelToJson(this);
}

@JsonSerializable()
class LoginResponseModel {
  final String? id;
  final String? slug;
  final List<String>? userType;
  final List<String>? permissions;
  final String? status;
  final String? email;
  final int? emailVerifyCode;
  final int? contactNumberVerifyCode;
  final int? resetPasswordCode;
  final String? fullName;
  final int? rewardCoinAvailable;
  final bool? isContactNumberVerified;
  final bool? isEmailVerified;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? emailVerifiedAt;
  final String? accessToken;
  final DateTime? accessTokenExpireIn;
  final String? refreshToken;
  final DateTime? refreshTokenExpireIn;

  LoginResponseModel({
    required this.id,
    required this.slug,
    required this.userType,
    required this.permissions,
    required this.status,
    required this.email,
    required this.emailVerifyCode,
    required this.contactNumberVerifyCode,
    required this.resetPasswordCode,
    required this.fullName,
    required this.rewardCoinAvailable,
    required this.isContactNumberVerified,
    required this.isEmailVerified,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.emailVerifiedAt,
    required this.accessToken,
    required this.accessTokenExpireIn,
    required this.refreshToken,
    required this.refreshTokenExpireIn,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
