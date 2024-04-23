// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailOuterModel _$UserDetailOuterModelFromJson(
        Map<String, dynamic> json) =>
    UserDetailOuterModel(
      data: json['data'] == null
          ? null
          : UserDetailModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$UserDetailOuterModelToJson(
        UserDetailOuterModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };

UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) =>
    UserDetailModel(
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
      v: json['v'] as int?,
      emailVerifiedAt: json['emailVerifiedAt'] == null
          ? null
          : DateTime.parse(json['emailVerifiedAt'] as String),
    );

Map<String, dynamic> _$UserDetailModelToJson(UserDetailModel instance) =>
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
      'v': instance.v,
      'emailVerifiedAt': instance.emailVerifiedAt?.toIso8601String(),
    };
