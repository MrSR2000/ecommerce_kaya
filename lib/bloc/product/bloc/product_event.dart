part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class LatestProductFetchEvent extends ProductEvent {}

class ProductDetailFetchEvent extends ProductEvent {
  final String slug;

  ProductDetailFetchEvent({required this.slug});
}

class SearchProductsEvent extends ProductEvent {
  final String searchQuery;

  SearchProductsEvent({required this.searchQuery});
}

class ProductOfCategoryFetchEvent extends ProductEvent {
  final String slug;

  ProductOfCategoryFetchEvent({required this.slug});
}
