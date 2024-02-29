import 'package:json_annotation/json_annotation.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel {
  String? title;
  String? message;
  List<SliderData>? data;

  SliderModel({
    this.title,
    this.message,
    this.data,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}

@JsonSerializable()
class SliderData {
  String? id;
  String? image;
  String? link;
  String? title;
  String? imageAlt;

  SliderData({
    this.id,
    this.image,
    this.link,
    this.title,
    this.imageAlt,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) =>
      _$SliderDataFromJson(json);

  Map<String, dynamic> toJson() => _$SliderDataToJson(this);
}
