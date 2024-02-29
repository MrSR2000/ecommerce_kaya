part of 'product_categories_bloc.dart';

@immutable
sealed class ProductCategoriesState {}

final class ProductCategoriesInitial extends ProductCategoriesState {}

class ProductCategoriesLoadingState extends ProductCategoriesState {}

class ProductCategoriesSuccessfulState extends ProductCategoriesState {
  final ProductCategoryOuterModel productCategory;

  ProductCategoriesSuccessfulState({required this.productCategory});
}

class ProductCategoriesErrorState extends ProductCategoriesState {
  final String errorMessage;

  ProductCategoriesErrorState({required this.errorMessage});
}

class ProductChildCategoryLoadingState extends ProductCategoriesState {}

class ProductChildCategorySuccessState extends ProductCategoriesState {
  final ProductCategoryOuterModel productChildCategory;

  ProductChildCategorySuccessState({required this.productChildCategory});
}

class ProductChildCategoryErrorState extends ProductCategoriesState {
  final String errorMessage;

  ProductChildCategoryErrorState({required this.errorMessage});
}
