part of 'product_bloc.dart';

sealed class ProductState {}

//product
final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState {
  final List<ProductModel> oldProducts;
  final bool isFirstFetch;

  ProductLoadingState({
    required this.oldProducts,
    this.isFirstFetch = false,
  });
}

final class ProductSuccessfulState extends ProductState {
  // final ProductOuterModel product;

  // ProductSuccessfulState({required this.product});

  final List<ProductModel> products;
  final bool isFinalPage;

  ProductSuccessfulState({
    required this.products,
    this.isFinalPage = false,
  });
}

final class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState({required this.error});
}

//product detail
final class ProductDetailLoadingState extends ProductState {}

final class ProductDetailSuccessfulState extends ProductState {
  final ProductDetailModel productDetail;

  ProductDetailSuccessfulState({required this.productDetail});
}

final class ProductDetailErrorState extends ProductState {
  final String error;

  ProductDetailErrorState({required this.error});
}

//search product
// final class SearchProductLoadingState extends ProductState {}

// final class SearchProductSuccessfulState extends ProductState {
//   final ProductOuterModel searchProduct;

//   SearchProductSuccessfulState({required this.searchProduct});
// }

// final class SearchProductErrorState extends ProductState {
//   final String error;

//   SearchProductErrorState({required this.error});
// }
