part of 'product_categories_bloc.dart';

@immutable
sealed class ProductCategoriesEvent {}

class ProductCategoriesInitialFetchEvent extends ProductCategoriesEvent {}

class ProductChildCategoryFetchEvent extends ProductCategoriesEvent {
  final String slug;

  ProductChildCategoryFetchEvent({required this.slug});
}
