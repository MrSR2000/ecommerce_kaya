import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/contact_developer_widget.dart';
import 'package:kaya/features/products/pages/category/bloc/category_bloc.dart';
import 'package:kaya/features/products/pages/product_detail_page/product_detail_page.dart';

import 'package:kaya/models/filter_model/filter_model.dart';
import 'package:kaya/models/product_model/product_model.dart';

class CategoryBody extends StatelessWidget {
  final String slug;
  final FilterModel filterModel;
  final CategoryBloc categoryBloc;
  const CategoryBody({
    super.key,
    required this.slug,
    required this.filterModel,
    required this.categoryBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoryBloc..add(CategoryGetProducts(slug: slug)),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return centerCircularLoadingWidget();
          }

          if (state is CategoryError) {
            return Text("error : ${state.error}");
          }

          if (state is CategorySuccess) {
            List<ProductModel>? products = state.dataModel.docs;

            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: const Text("filter"),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: products?.length,
                  itemBuilder: (context, index) {
                    ProductModel product = products![index];

                    return InkWell(
                      onTap: () {
                        pushPage(
                          context: context,
                          page: ProductDetailpage(slug: product.slug ?? ""),
                        );
                      },
                      child: Text(product.title ?? ""),
                    );
                  },
                ),
              ],
            );
          }

          return contactDeveloperWidget();
        },
      ),
    );
  }
}
