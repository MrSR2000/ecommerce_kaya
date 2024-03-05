part of 'product_bloc.dart';

sealed class ProductEvent {}

class LatestProductFetchEvent extends ProductEvent {}

class ProductDetailFetchEvent extends ProductEvent {
  final String slug;

  ProductDetailFetchEvent({required this.slug});
}

class SearchProductsEvent extends ProductEvent {
  final String searchQuery;
  final bool newQuery;

  SearchProductsEvent({
    required this.searchQuery,
    this.newQuery = false,
  });
}

class ProductOfCategoryFetchEvent extends ProductEvent {
  final String slug;

  ProductOfCategoryFetchEvent({required this.slug});
}
