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
