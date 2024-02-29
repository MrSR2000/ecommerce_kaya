import 'package:json_annotation/json_annotation.dart';

part 'signup_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  final String emailOrContactNumber;
  final String password;
  final String fullName;

  SignUpRequestModel({
    required this.emailOrContactNumber,
    required this.password,
    required this.fullName,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
