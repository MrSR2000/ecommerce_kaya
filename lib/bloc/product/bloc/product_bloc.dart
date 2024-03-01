import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:kaya/models/product_detail_model/product_detail_model.dart';
import 'package:kaya/models/product_model/product_model.dart';
import 'package:kaya/repository/api_service.dart';
import 'package:meta/meta.dart';

import '../../../injection_container.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  int page = 1;

  ProductBloc() : super(ProductInitial()) {
    on<LatestProductFetchEvent>(latestProductFetchEvent);
    on<ProductDetailFetchEvent>(productDetailFetchEvent);
    on<SearchProductsEvent>(searchProductsEvent);
    on<ProductOfCategoryFetchEvent>(productOfCategoryFetchEvent);
  }

  FutureOr<void> latestProductFetchEvent(
      LatestProductFetchEvent event, Emitter<ProductState> emit) async {
    if (state is ProductLoadingState) return;

    final currentState = state;
    var oldProducts = <ProductModel>[];

    if (currentState is ProductSuccessfulState) {
      oldProducts = currentState.products;
    }
    emit(
      ProductLoadingState(
        oldProducts: oldProducts,
        isFirstFetch: page == 1,
      ),
    );
    try {
      ProductOuterModel productOuter =
          await sl<ApiService>().getLatestProducts(page.toString());

      log("latest  product success = $productOuter");

      page++;

      final products = (state as ProductLoadingState).oldProducts;
      products.addAll(productOuter.data!.docs!);

      log("this is final page = ${!productOuter.data!.pagination!.nextPage!}");

      emit(ProductSuccessfulState(
        products: products,
        isFinalPage: !productOuter.data!.pagination!.nextPage!,
      ));
    } catch (e) {
      log("Latest product error = $e");

      emit(ProductErrorState(error: e.toString()));
    }
  }

  FutureOr<void> productDetailFetchEvent(
      ProductDetailFetchEvent event, Emitter<ProductState> emit) async {
    emit(ProductDetailLoadingState());

    log("product detail here = ${event.slug}");

    try {
      ProductDetailModel productDetail =
          await sl<ApiService>().getProductDetail(event.slug);

      log("product detail success =$productDetail");

      emit(ProductDetailSuccessfulState(productDetail: productDetail));
    } catch (e) {
      log("product detail error = $e");

      emit(ProductDetailErrorState(error: e.toString()));
    }
  }

  FutureOr<void> searchProductsEvent(
      SearchProductsEvent event, Emitter<ProductState> emit) async {
    // emit(ProductLoadingState());

    try {
      ProductOuterModel productOuter =
          await sl<ApiService>().getSearchProduct(event.searchQuery);

      log("search product success = $productOuter");

      // emit(SearchProductSuccessfulState(searchProduct: productOuter));
      // emit(ProductSuccessfulState(product: productOuter));
    } catch (e) {
      log("search product error = $e");
    }
  }

  FutureOr<void> productOfCategoryFetchEvent(
      ProductOfCategoryFetchEvent event, Emitter<ProductState> emit) async {
    // emit(ProductLoadingState());

    try {
      ProductOuterModel productOuterModel =
          await sl<ApiService>().getProductsByCategory(event.slug);

      log("product by category success = $productOuterModel");

      // emit(ProductSuccessfulState(product: productOuterModel));
    } catch (e) {
      log("erorr in product by category = $e");

      emit(ProductErrorState(error: e.toString()));
    }
  }
}