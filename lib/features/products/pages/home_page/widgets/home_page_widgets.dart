import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/contact_developer_widget.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/features/authentication/login_page/login_page.dart';
import 'package:kaya/features/notification/notification_page/notification_page.dart';
import 'package:kaya/features/products/pages/home_page/widgets/category_expansion_widget.dart';
import 'package:kaya/features/products/pages/home_page/widgets/search_bar_widget.dart';
import 'package:kaya/features/products/pages/home_page/widgets/slider_widget.dart';
import 'package:kaya/main.dart';
import 'package:kaya/models/category_model/category_model.dart';

import '../../../../../bloc/product/bloc/product_bloc.dart';
import '../../../../../bloc/product_categories/product_categories_bloc.dart';
import '../../../../../core/resources/components/gaps.dart';
import '../../../../../injection_container.dart';
import 'products_grid_widget.dart';

Drawer drawer(BuildContext context) {
  return Drawer(
    child: BlocProvider(
      create: (context) => sl<ProductCategoriesBloc>()
        ..add(ProductCategoriesInitialFetchEvent()),
      child: BlocBuilder<ProductCategoriesBloc, ProductCategoriesState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProductCategoriesLoadingState:
              return centerCircularLoadingWidget();

            case ProductCategoriesSuccessfulState:
              var successState = state as ProductCategoriesSuccessfulState;

              ProductCategoryOuterModel productCategoryOuter =
                  successState.productCategory;
              List<CategoryDataModel> categories = productCategoryOuter.data;

              return CategoryExpansionWidget(
                categories: categories,
              );

            case ProductCategoriesErrorState:
              var errorState = state as ProductCategoriesErrorState;

              return textWidget(
                text: errorState.errorMessage,
                textSize: TextSize.medium,
              );

            default:
              return contactDeveloperWidget();
          }
        },
      ),
    ),
  );
}

Widget body() {
  ProductBloc homepageBloc = sl<ProductBloc>();

  return RefreshIndicator(
    onRefresh: () async {
      homepageBloc.add(LatestProductFetchEvent());
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchBarWidget(),
        sliderWidget(),
        gap10,
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          child: textWidget(
            text: "Latest Products",
            textSize: TextSize.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: BlocProvider(
            create: (context) => homepageBloc..add(LatestProductFetchEvent()),
            child: ProductsGrid(
              reCallApi: () {
                homepageBloc.add(
                  LatestProductFetchEvent(),
                );
              },
              // productEvent: LatestProductFetchEvent(),
            ),
          ),
        ),
      ],
    ),
  );
}

AppBar appBar({required BuildContext context}) {
  return AppBar(
    title: const Text("KAYA"),
    actions: [
      gap10,
      InkWell(
        onTap: () {
          pushPage(
            context: context,
            page: isLoggedIn ? const NotificationPage() : const LoginPage(),
          );
        },
        child: const Icon(Icons.notifications_outlined),
      ),
      gap15,
    ],
  );
}
