import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:kaya/injection_container.dart';
import 'package:kaya/models/filter_model/filter_model.dart';
import 'package:kaya/models/product_by_filter_model/product_by_filter_model.dart';
import 'package:kaya/models/product_model/product_model.dart';
import 'package:kaya/repository/api_service.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final initial = true;
  DataModel? _requestData;

  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryGetProducts>(categoryGetProducts);
    on<CategoryGetFilters>(categoryGetFilters);
  }

  FutureOr<void> categoryGetProducts(
      CategoryGetProducts event, Emitter<CategoryState> emit) async {
    if (event.reload) {
      emit(CategoryLoading());
    }
    try {
      late ProductOuterModel productOuterModel;
      String brandFilter = "";

      if (event.filter != null) {
        // log("filters = ${event.filter?.brands?[0]?.name} is selected = ${event.filter?.brands?[0]?.isSelected ?? false}");

        if (event.filter!.brands != null) {
          for (var brand in event.filter!.brands!) {
            if (brand?.isSelected ?? false) {
              brandFilter =
                  "$brandFilter${brandFilter.isEmpty ? "" : ","}${brand?.slug}";
            }
          }

          log("brands == $brandFilter");
        }
      }

      productOuterModel = await sl<ApiService>().getProductByCategory(
        slug: event.slug,
        brands: brandFilter.isNotEmpty ? brandFilter : null,
        min: event.filter?.min?.toString(),
        max: event.filter?.max?.toString(),
        page: event.page,
      );

      DataModel? a = productOuterModel.data;

      log("get product by category success = $productOuterModel");

      if (event.page == 1) {
        _requestData = productOuterModel.data!;
      } else {
        _requestData = _requestData!.copyWith(
          pagination: _requestData?.pagination?.copyWith(
            nextPage: a?.pagination?.nextPage ?? false,
          ),
          docs: (_requestData?.docs ?? []) + (a?.docs ?? []),
        );
      }

      emit(
        CategorySuccess(
          dataModel: _requestData!,
          fromFilter: event.fromFilter,
        ),
      );
    } catch (e) {
      log("get product by category error = $e");
    }
  }

  FutureOr<void> categoryGetFilters(
      CategoryGetFilters event, Emitter<CategoryState> emit) async {
    emit(CategoryFilterLoading());

    try {
      CategoryFilterOuterModel categoryFilterOuterModel =
          await sl<ApiService>().getProductByCategoryFilters(event.slug);

      log("category filter model = ${categoryFilterOuterModel.data?.categories}");

      emit(CategoryFilterSuccess(
        categoryFilterModel: categoryFilterOuterModel.data!,
      ));
    } catch (e) {
      log("Category filter error = $e");
    }
  }
}
