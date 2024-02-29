import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaya/bloc/product_categories/product_categories_bloc.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/body_padding.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/contact_developer_widget.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/features/products/pages/home_page/widgets/product_of_category.dart';

import '../../../../../bloc/product/bloc/product_bloc.dart';
import '../../../../../injection_container.dart';
import '../../../../../models/category_model/category_model.dart';

class Item {
  Item({
    required this.category,
    this.isExpanded = false,
    required this.productCategoriesBloc,
  });

  CategoryDataModel category;
  bool isExpanded;
  ProductCategoriesBloc productCategoriesBloc;
}

class CategoryExpansionWidget extends StatefulWidget {
  final List<CategoryDataModel> categories;
  const CategoryExpansionWidget({
    super.key,
    required this.categories,
  });

  @override
  State<CategoryExpansionWidget> createState() =>
      _CategoryExpansionWidgetState();
}

class _CategoryExpansionWidgetState extends State<CategoryExpansionWidget> {
  List<Item> categories = [];

  @override
  Widget build(BuildContext context) {
    return bodyPadding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          gap20,
          gap20,
          textWidget(
            text: "KAYA",
            textSize: TextSize.large,
            color: primaryColor,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              Item category = categories[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          category.isExpanded = !category.isExpanded;
                          category.productCategoriesBloc.add(
                            ProductChildCategoryFetchEvent(
                                slug: category.category.slug),
                          );
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          textWidget(
                            text: category.category.title,
                            textSize: TextSize.medium,
                          ),
                          const Spacer(),
                          category.isExpanded
                              ? const Icon(Icons.keyboard_arrow_up)
                              : const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    if (category.isExpanded)
                      bodyPadding(
                          child: BlocBuilder<ProductCategoriesBloc,
                              ProductCategoriesState>(
                        bloc: category.productCategoriesBloc,
                        builder: (context, state) {
                          if (state is ProductChildCategoryLoadingState) {
                            return centerCircularLoadingWidget();
                          }

                          if (state is ProductChildCategorySuccessState) {
                            List<CategoryDataModel> categories =
                                state.productChildCategory.data;

                            return categories.isEmpty
                                ? textWidget(
                                    text: "No items found",
                                    textSize: TextSize.medium,
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: categories.length,
                                    itemBuilder: (context, index) {
                                      CategoryDataModel category =
                                          categories[index];

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            pushPage(
                                              context: context,
                                              page: BlocProvider(
                                                create: (context) =>
                                                    sl<ProductBloc>()
                                                      ..add(
                                                        ProductOfCategoryFetchEvent(
                                                          slug: category.slug,
                                                        ),
                                                      ),
                                                child: ProductOfCategoryPage(
                                                  categoryName: category.title,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              textWidget(
                                                text: category.title,
                                                textSize: TextSize.medium,
                                              ),
                                              // gap20,
                                              const Spacer(),
                                              const Icon(
                                                Icons.keyboard_arrow_right,
                                                size: 17,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                          }

                          if (state is ProductChildCategoryErrorState) {
                            return textWidget(
                              text: state.errorMessage,
                              textSize: TextSize.medium,
                            );
                          }

                          return contactDeveloperWidget();
                        },
                      ))
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    generateCategories();
  }

  generateCategories() {
    for (var category in widget.categories) {
      categories.add(
        Item(
            category: category,
            productCategoriesBloc: sl<ProductCategoriesBloc>()),
      );
    }
  }
}
