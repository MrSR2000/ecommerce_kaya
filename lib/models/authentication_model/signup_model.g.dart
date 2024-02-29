// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      emailOrContactNumber: json['emailOrContactNumber'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      'emailOrContactNumber': instance.emailOrContactNumber,
      'password': instance.password,
      'fullName': instance.fullName,
    };
