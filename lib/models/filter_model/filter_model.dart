import 'package:kaya/models/product_by_filter_model/product_by_filter_model.dart';

class FilterModel {
  String? slug;
  int? min;
  int? max;
  List<CustomBrandModel?>? brands;
  List<CategoryModel?>? categories;
  dynamic discount;

  FilterModel({
    this.slug,
    this.min,
    this.max,
    this.brands,
    this.categories,
    this.discount,
  });
}
