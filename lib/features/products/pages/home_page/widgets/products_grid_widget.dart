import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/body_padding.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/elevated_button_style.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/network_image_widget.dart';
import 'package:kaya/core/resources/components/rounded_border_container.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/core/resources/screen_size.dart';
import 'package:kaya/features/products/pages/product_detail_page/product_detail_page.dart';
import 'package:kaya/models/product_model/product_model.dart';

import '../../../../../bloc/product/bloc/product_bloc.dart';

class ProductsGrid extends StatefulWidget {
  final dynamic reCallApi;
  ProductsGrid({
    super.key,
    required this.reCallApi,
  });

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  late ScrollController scrollController;
  bool isFinal = false;

  @override
  Widget build(BuildContext context) {
    return bodyPadding(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            return SizedBox(
              height: getDeviceSize(context: context).deviceHeight,
              child: Center(
                child: textWidget(
                  text: "Search...",
                  textSize: TextSize.medium,
                ),
              ),
            );
          }

          if (state is ProductLoadingState && state.isFirstFetch) {
            return centerCircularLoadingWidget();
          }

          List<ProductModel> products = [];
          bool isLoading = true;

          if (state is ProductLoadingState) {
            products = state.oldProducts;
            isLoading = true;
          } else if (state is ProductErrorState) {
            return textWidget(
              text: state.error,
              textSize: TextSize.medium,
            );
          } else if (state is ProductSuccessfulState) {
            // var successState = state as ProductSuccessfulState;
            // ProductOuterModel productOuter = successState.product;
            // List<ProductModel> products = productOuter.data!.docs!;
            // List<ProductModel> products = state.products;

            products = state.products;
            isFinal = state.isFinalPage;
          }

          log("in UI part this is final page = $isFinal");

          return products.isEmpty
              ? Center(
                  child: textWidget(
                    text: "No Items Found",
                    textSize: TextSize.medium,
                  ),
                )
              : GridView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2 / 3.6,
                  ),
                  itemCount: products.length +
                      (isFinal
                          ? 0
                          : isLoading
                              ? 1
                              : 0),
                  itemBuilder: (context, index) {
                    log("total product = ${products.length} ");

                    if (index < products.length) {
                      log("here = $index");
                      ProductModel product = products[index];

                      return InkWell(
                        onTap: () {
                          // productDetailBloc.add(
                          //   ProductDetailFetchEvent(slug: product.slug!),
                          // );

                          pushPage(
                            context: context,
                            page: ProductDetailpage(
                              slug: product.slug!,
                            ),
                          );
                        },
                        child: roundedBorderContainer(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          bgColor: lightPrimaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              networkImageWidget(
                                height: 130,
                                imageUrl: product.images![0],
                              ),
                              gap10,
                              textWidget(
                                text: product.title!,
                                textSize: TextSize.medium,
                                fontWeight: FontWeight.w500,
                              ),
                              gap5,
                              textWidget(
                                text: product.brand!.name!,
                                textSize: TextSize.small,
                                color: Colors.grey[400]!,
                              ),
                              gap5,
                              textWidget(
                                text: "Rs. ${product.price!.toString()}",
                                textSize: TextSize.medium,
                                fontWeight: FontWeight.bold,
                              ),
                              gap10,
                              ElevatedButton(
                                onPressed: () {},
                                style: elevatedButtonStyle,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // const Icon(
                                    //   Icons.shopping_cart_outlined,
                                    //   size: 16,
                                    //   color: Colors.white,
                                    // ),
                                    // const SizedBox(
                                    //   height: 16,
                                    //   child: VerticalDivider(
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                    textWidget(
                                      text: "Add To Cart",
                                      textSize: TextSize.small,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      log("loading");
                      Timer(
                        const Duration(milliseconds: 30),
                        () {
                          scrollController.jumpTo(
                            scrollController.position.maxScrollExtent -
                                getDeviceSize(context: context).deviceHeight /
                                    3.4,
                          );
                        },
                      );

                      // return centerCircularLoadingWidget();
                      return textWidget(
                        text: "Loading ...",
                        textSize: TextSize.medium,
                      );
                    }
                  },
                );
        },
      ),
    );
  }

  @override
  void initState() {
    scrollController = ScrollController();
    setupScrollController();
    super.initState();
  }

  void setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          if (!isFinal) {
            log("called from grid widget");
            widget.reCallApi();
          }
        }
      }
    });
  }
}
