// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      emailOrContactNumber: json['emailOrContactNumber'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'emailOrContactNumber': instance.emailOrContactNumber,
      'password': instance.password,
    };

LoginResponseOuterModel _$LoginResponseOuterModelFromJson(
        Map<String, dynamic> json) =>
    LoginResponseOuterModel(
      title: json['title'] as String,
      message: json['message'] as String,
      data: LoginResponseModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseOuterModelToJson(
        LoginResponseOuterModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      userType: (json['userType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      email: json['email'] as String?,
      emailVerifyCode: json['emailVerifyCode'] as int?,
      contactNumberVerifyCode: json['contactNumberVerifyCode'] as int?,
      resetPasswordCode: json['resetPasswordCode'] as int?,
      fullName: json['fullName'] as String?,
      rewardCoinAvailable: json['rewardCoinAvailable'] as int?,
      isContactNumberVerified: json['isContactNumberVerified'] as bool?,
      isEmailVerified: json['isEmailVerified'] as bool?,
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      emailVerifiedAt: json['emailVerifiedAt'] == null
          ? null
          : DateTime.parse(json['emailVerifiedAt'] as String),
      accessToken: json['accessToken'] as String?,
      accessTokenExpireIn: json['accessTokenExpireIn'] == null
          ? null
          : DateTime.parse(json['accessTokenExpireIn'] as String),
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpireIn: json['refreshTokenExpireIn'] == null
          ? null
          : DateTime.parse(json['refreshTokenExpireIn'] as String),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'userType': instance.userType,
      'permissions': instance.permissions,
      'status': instance.status,
      'email': instance.email,
      'emailVerifyCode': instance.emailVerifyCode,
      'contactNumberVerifyCode': instance.contactNumberVerifyCode,
      'resetPasswordCode': instance.resetPasswordCode,
      'fullName': instance.fullName,
      'rewardCoinAvailable': instance.rewardCoinAvailable,
      'isContactNumberVerified': instance.isContactNumberVerified,
      'isEmailVerified': instance.isEmailVerified,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'emailVerifiedAt': instance.emailVerifiedAt?.toIso8601String(),
      'accessToken': instance.accessToken,
      'accessTokenExpireIn': instance.accessTokenExpireIn?.toIso8601String(),
      'refreshToken': instance.refreshToken,
      'refreshTokenExpireIn': instance.refreshTokenExpireIn?.toIso8601String(),
    };
