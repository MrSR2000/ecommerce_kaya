import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:kaya/models/category_model/category_model.dart';
import 'package:kaya/repository/api_service.dart';
import 'package:meta/meta.dart';

import '../../injection_container.dart';

part 'product_categories_event.dart';
part 'product_categories_state.dart';

class ProductCategoriesBloc
    extends Bloc<ProductCategoriesEvent, ProductCategoriesState> {
  ProductCategoriesBloc() : super(ProductCategoriesInitial()) {
    on<ProductCategoriesInitialFetchEvent>(productCategoriesInitialFetchEvent);
    on<ProductChildCategoryFetchEvent>(productChildCategoryFetchEvent);
  }

  FutureOr<void> productCategoriesInitialFetchEvent(
      ProductCategoriesInitialFetchEvent event,
      Emitter<ProductCategoriesState> emit) async {
    emit(ProductCategoriesLoadingState());

    try {
      ProductCategoryOuterModel productCategory =
          await sl<ApiService>().getCategories();

      log("product categories success = $productCategory");

      emit(ProductCategoriesSuccessfulState(productCategory: productCategory));
    } catch (e) {
      log("error in product category = ${e.toString()}");

      emit(ProductCategoriesErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> productChildCategoryFetchEvent(
      ProductChildCategoryFetchEvent event,
      Emitter<ProductCategoriesState> emit) async {
    emit(ProductChildCategoryLoadingState());

    try {
      ProductCategoryOuterModel productChildCategory =
          await sl<ApiService>().getChildCategories(event.slug);

      log("product child category success = $productChildCategory");

      emit(
        ProductChildCategorySuccessState(
            productChildCategory: productChildCategory),
      );
    } catch (e) {
      log("product child category error = $e");

      emit(ProductChildCategoryErrorState(errorMessage: e.toString()));
    }
  }
}
