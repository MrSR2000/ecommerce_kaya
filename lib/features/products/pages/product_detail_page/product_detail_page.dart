import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaya/bloc/cart/cart_bloc.dart';
import 'package:kaya/bloc/wishlist/wishlist_bloc.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/body_padding.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/contact_developer_widget.dart';
import 'package:kaya/core/resources/components/elevated_button_style.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/image_slider.dart';
import 'package:kaya/core/resources/components/rounded_border_container.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/features/products/pages/product_detail_page/widgets/product_detail_page_widget.dart';
import 'package:kaya/models/cart_model/add_to_cart_request_model.dart';
import 'package:kaya/models/product_detail_model/product_detail_model.dart';

import '../../../../bloc/product/bloc/product_bloc.dart';
import '../../../../injection_container.dart';
import 'widgets/product_quantity_widget.dart';

class ProductDetailpage extends StatelessWidget {
  // final ProductDetailModel productDetail;
  final String slug;
  ProductDetailpage({
    super.key,
    // required this.productDetail,
    required this.slug,
  });

  int selectedVariationIndex = 0;
  int productQty = 1;

  final CartBloc _cartBloc = sl<CartBloc>();
  final WishlistBloc _wishListBloc = sl<WishlistBloc>();

  void handleVariationChange(int newValue) {
    selectedVariationIndex = newValue;
    log('Parent received new value: $selectedVariationIndex');
  }

  void handleQtyVariationChange(int newQty) {
    productQty = newQty;

    log("new qty from parent = $productQty");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ProductBloc>()..add(ProductDetailFetchEvent(slug: slug)),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductDetailLoadingState) {
            return Scaffold(
              body: centerCircularLoadingWidget(),
            );
          }

          if (state is ProductDetailSuccessfulState) {
            ProductDetailModel productDetail = state.productDetail;

            log("product id = ${productDetail.data?.id}");

            // log("product detail id = ${productDetail.data!.id} \n variation = ${productDetail.data!.variantType!} \n variationID = ${productDetail.data!.colorVariants![selectedVariationIndex].id}");

            return Scaffold(
              appBar: _appBar(productDetail: productDetail),
              body: _body(productDetail: productDetail),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: ElevatedButton(
                  style: elevatedButtonStyle,
                  onPressed: () {
                    log("variation type = ${productDetail.data!.variantType!}");

                    AddToCartRequestModel addToCartRequestModel =
                        AddToCartRequestModel(
                      product: productDetail.data!.id!,
                      quantity: productQty,
                      variantType: productDetail.data!.variantType!,
                      variantId: productDetail.data!.variantType! == "Color"
                          ? productDetail
                              .data!.colorVariants![selectedVariationIndex].id!
                          : productDetail
                              .data!.sizeVariants![selectedVariationIndex].id!,
                      refCode: "",
                    );

                    _cartBloc.add(
                      AddToCartEvent(
                          addToCartRequestModel: addToCartRequestModel),
                    );
                  },
                  child: BlocConsumer<CartBloc, CartState>(
                    bloc: _cartBloc,
                    listener: (context, state) {
                      if (state is AddToCartSuccessState) {
                        Fluttertoast.showToast(
                          msg: "Added to Cart",
                          gravity: ToastGravity.CENTER,
                        );
                      }

                      if (state is AddToCartErrorState) {
                        Fluttertoast.showToast(
                          msg: state.error,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AddToCartLoadingState) {
                        return const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      return textWidget(
                        text: "Add to Cart",
                        textSize: TextSize.medium,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      );
                    },
                  ),
                ),
              ),
            );
          }

          if (state is ProductDetailErrorState) {
            return textWidget(
              text: state.error,
              textSize: TextSize.medium,
            );
          }

          return contactDeveloperWidget();
        },
      ),
    );
  }

  AppBar _appBar({required ProductDetailModel productDetail}) {
    return AppBar(
      title: Text(productDetail.data!.title!),
    );
  }

  SingleChildScrollView _body({required ProductDetailModel productDetail}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlider(
            imageStringList: productDetail.data!.images!,
            boxFit: BoxFit.contain,
          ),
          gap10,
          bodyPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                  text: productDetail.data!.title!,
                  textSize: TextSize.large,
                  fontWeight: FontWeight.w500,
                ),
                gap10,
                Row(
                  children: [
                    textWidget(
                      text: "Rs.${productDetail.data!.strikePrice!.toString()}",
                      textSize: TextSize.large,
                      fontWeight: FontWeight.bold,
                    ),
                    gap10,
                    textWidget(
                      text: "Rs.${productDetail.data!.strikePrice}",
                      textSize: TextSize.medium,
                      color: const Color.fromARGB(255, 224, 224, 224),
                      textDecoration: TextDecoration.lineThrough,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        _wishListBloc.add(
                          AddRemoveToWishListEvent(
                            productId: productDetail.data!.id!,
                          ),
                        );
                      },
                      icon: BlocConsumer<WishlistBloc, WishlistState>(
                        bloc: _wishListBloc,
                        listener: (context, state) {
                          if (state is AddRemovetoWishListSuccessState) {
                            Fluttertoast.showToast(
                              msg: state.response['message'],
                              gravity: ToastGravity.CENTER,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is AddRemovetoWishListSuccessState) {
                            return state.response['message'] ==
                                    "Added To WishList"
                                ? const Icon(
                                    CupertinoIcons.heart_fill,
                                    color: Colors.red,
                                  )
                                : const Icon(CupertinoIcons.heart);
                          }
                          return const Icon(CupertinoIcons.heart);
                        },
                      ),
                    ),
                  ],
                ),
                gap10,
                roundedBorderContainer(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  bgColor: primaryColor,
                  child: textWidget(
                    text: "${productDetail.data!.offPercent}%",
                    textSize: TextSize.medium,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                gap15,
                if (productDetail.data!.colorVariants!.isNotEmpty)
                  ProductColorVariationWidget(
                    colorVariants: productDetail.data!.colorVariants!,
                    onValueChanged: handleVariationChange,
                  ),
                if (productDetail.data!.sizeVariants!.isNotEmpty)
                  ProductSizeVariationWidget(
                    sizeVariants: productDetail.data!.sizeVariants!,
                    onValueChanged: handleVariationChange,
                  ),
                gap15,
                ProductQuantityWidget(
                  onValueChanged: handleQtyVariationChange,
                  maxQty: productDetail.data!.colorVariants!.isNotEmpty
                      ? productDetail.data!
                          .colorVariants![selectedVariationIndex].maxOrder!
                      : productDetail.data!.sizeVariants!.isNotEmpty
                          ? productDetail.data!
                              .sizeVariants![selectedVariationIndex].maxOrder!
                          : 0,
                ),
                gap15,
                _hurryUpWidget(),
                gap15,
                roundedBorderContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  width: double.maxFinite,
                  border: Border.all(color: Colors.grey[500]!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(
                        text: "Product Details",
                        textSize: TextSize.large,
                        fontWeight: FontWeight.bold,
                      ),
                      gap5,
                      HtmlWidget(
                        productDetail.data!.description!,
                        textStyle: mediumTextStyle,
                      ),
                    ],
                  ),
                ),
                gap15,
                roundedBorderContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  width: double.maxFinite,
                  border: Border.all(color: Colors.grey[500]!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(
                        text: "Rating & Reviews",
                        textSize: TextSize.large,
                        fontWeight: FontWeight.bold,
                      ),
                      gap5,
                      SizedBox(
                        width: double.maxFinite,
                        child: Divider(
                          color: Colors.grey[400]!,
                        ),
                      ),

                      gap5,
                      // HtmlWidget(
                      //   productDetail.data!.description!,
                      //   textStyle: mediumTextStyle,
                      // ),
                      productDetail.data!.ratings == 0
                          ? textWidget(
                              text: "No Reviews Yet",
                              textSize: TextSize.small,
                            )
                          : textWidget(
                              text: productDetail.data!.ratings.toString(),
                              textSize: TextSize.small,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  RichText _hurryUpWidget() {
    return RichText(
      text: TextSpan(
        text: "Hurry up! Only ",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[800]!,
          fontFamily: "Poppins",
        ),
        children: [
          // TextSpan(
          //   text: productDetail.data!.colorVariants[selectedColorIndex].maxOrder
          //       .toString(),
          //   style: TextStyle(
          //     fontSize: 16,
          //     color: buttonColor,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          TextSpan(
            text: " items left in the stock inventory",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800]!,
            ),
          )
        ],
      ),
    );
  }
}
