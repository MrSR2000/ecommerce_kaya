import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/contact_developer_widget.dart';
import 'package:kaya/core/resources/components/custom_refresher.dart';
import 'package:kaya/core/resources/screen_size.dart';
import 'package:kaya/features/products/pages/category/bloc/category_bloc.dart';
import 'package:kaya/features/products/pages/product_detail_page/product_detail_page.dart';

import 'package:kaya/models/filter_model/filter_model.dart';
import 'package:kaya/models/product_model/product_model.dart';

class CategoryBody extends StatefulWidget {
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
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  int _page = 1;
  ScrollController _scrollController = ScrollController();
  bool _loadMoreLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      bloc: widget.categoryBloc,
      listener: (context, state) {
        if (state is CategorySuccess) {
          setState(() {
            _loadMoreLoading = false;
          });

          if (state.dataModel.pagination?.nextPage ?? false) {
            if (!state.fromFilter) {
              log("page++");
              _page++;
              log("page++ === $_page");
            } else {
              _page = 2;
            }
          } else {
            _page = 1;
          }
        }
      },
      builder: (context, state) {
        if (state is CategoryLoading) {
          return centerCircularLoadingWidget();
        }

        if (state is CategoryError) {
          return Text("error : ${state.error}");
        }

        if (state is CategorySuccess) {
          List<ProductModel>? products = state.dataModel.docs;

          /* Infinite Scroll Pagination */
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: const Text("filter"),
              ),
              SizedBox(
                height: getDeviceSize(context: context).deviceHeight / 1.2,
                child: CustomRefresher(
                  onLoad: _onLoad,
                  scrollController: state.fromFilter
                      ? _scrollController = ScrollController()
                      : _scrollController,
                  canPaginate: state.dataModel.pagination?.nextPage ?? false,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Text(product.title ?? ""),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
          /* Infinite Scroll Pagination */

          /* Load More Pagination */
          // return Column(
          //   children: [
          // InkWell(
          //   onTap: () {
          //     Scaffold.of(context).openEndDrawer();
          //   },
          //   child: const Text("filter"),
          // ),
          // Expanded(
          //   child: ListView.builder(
          //     controller: _scrollController,
          //     shrinkWrap: true,
          //     itemCount: products?.length,
          //     itemBuilder: (context, index) {
          //       ProductModel product = products![index];

          //       return InkWell(
          //         onTap: () {
          //           pushPage(
          //             context: context,
          //             page: ProductDetailpage(slug: product.slug ?? ""),
          //           );
          //         },
          //         child: Text(product.title ?? ""),
          //       );
          //     },
          //   ),
          // ),
          //     if (state.dataModel.pagination?.nextPage ?? false) ...[
          //       Center(
          //         child: _loadMoreLoading
          //             ? const CircularProgressIndicator()
          //             : InkWell(
          //                 onTap: () {
          //                   _fetchData(reload: false);
          //                   _scrollController.jumpTo(
          //                       _scrollController.position.maxScrollExtent);

          //                   setState(() {
          //                     _loadMoreLoading = true;
          //                   });
          //                 },
          //                 child: textWidget(
          //                   text: "Load More",
          //                   textSize: TextSize.medium,
          //                 ),
          //               ),
          //       ),
          //     ]
          //   ],
          // );
          /* Load More Pagination */
        }

        return contactDeveloperWidget();
      },
    );
  }

  void _fetchData({
    bool reload = true,
  }) {
    log("pageno  === $_page");

    widget.categoryBloc.add(CategoryGetProducts(
      slug: widget.slug,
      page: _page,
      reload: reload,
      filter: widget.filterModel,
    ));
  }

  _onLoad() {
    _fetchData(reload: false);
  }
}
