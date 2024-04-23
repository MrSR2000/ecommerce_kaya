import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/contact_developer_widget.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/features/products/pages/category/bloc/category_bloc.dart';
import 'package:kaya/features/products/pages/category/widgets/filter_brands_widget.dart';
import 'package:kaya/features/products/pages/category/widgets/filter_categories_widget.dart';
import 'package:kaya/features/products/pages/category/widgets/price_range_widget.dart';
import 'package:kaya/injection_container.dart';
import 'package:kaya/models/filter_model/filter_model.dart';
import 'package:kaya/models/product_by_filter_model/product_by_filter_model.dart';

class FilterEndDrawer extends StatefulWidget {
  final FilterModel filterModel;
  final CategoryBloc categoryBloc;
  final String slug;
  const FilterEndDrawer({
    super.key,
    required this.filterModel,
    required this.categoryBloc,
    required this.slug,
  });

  @override
  State<FilterEndDrawer> createState() => _FilterEndDrawerState();
}

class _FilterEndDrawerState extends State<FilterEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: pagePadding(),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => sl<CategoryBloc>()
              ..add(CategoryGetFilters(
                slug: widget.slug,
              )),
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryFilterLoading) {
                  return centerCircularLoadingWidget();
                }

                if (state is CategoryFilterSuccess) {
                  bool previousFilterAvailable =
                      widget.filterModel.brands?.isNotEmpty ?? false;

                  CategoryFilterModel categoryFilterModel =
                      state.categoryFilterModel;

                  if (!previousFilterAvailable) {
                    widget.filterModel.max =
                        categoryFilterModel.priceRange?.max ?? 0;
                    widget.filterModel.min =
                        categoryFilterModel.priceRange?.min ?? 0;
                    widget.filterModel.brands =
                        categoryFilterModel.brands ?? [];
                    widget.filterModel.categories =
                        categoryFilterModel.categories ?? [];
                  }

                  return Column(
                    children: [
                      PriceRangeWidget(
                        max: categoryFilterModel.priceRange?.max ?? 0,
                        min: categoryFilterModel.priceRange?.min ?? 0,
                        filterModel: widget.filterModel,
                        categoryBloc: widget.categoryBloc,
                      ),
                      gap10,
                      FilterBrandsWidget(
                        brands: widget.filterModel.brands ?? [],
                        categoryBloc: widget.categoryBloc,
                        slug: widget.slug,
                        filters: widget.filterModel,
                      ),
                      gap10,
                      FilterCategoriesWidget(
                        categories: widget.filterModel.categories ?? [],
                      ),
                    ],
                  );
                }

                if (state is CategoryFilterError) {
                  return Text(state.error);
                }

                return contactDeveloperWidget();
              },
            ),
          ),
        ),
      ),
    );
  }
}
