import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaya/core/resources/components/body_padding.dart';
import 'package:kaya/core/resources/components/button_circular_progress_indicator.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/contact_developer_widget.dart';
import 'package:kaya/core/resources/components/elevated_button_style.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/network_image_widget.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/features/products/pages/product_detail_page/widgets/product_quantity_widget.dart';
import 'package:kaya/models/cart_model/cart_response_model.dart';

import '../../../bloc/cart/cart_bloc.dart';
import '../../../injection_container.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int productQty = 0;
  int totalCost = 0;

  // late CartBloc _cartBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }

  RefreshIndicator _body() {
    return RefreshIndicator(
      onRefresh: () async {
        cartBloc.add(GetMyCartEvent());
      },
      child: BlocProvider(
        create: (context) => cartBloc..add(GetMyCartEvent()),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is MyCartLoadingState) {
              return centerCircularLoadingWidget();
            }

            if (state is MyCartSuccessState) {
              List<CartItemModel> cartItems = state.cartData.items!;

              calculateTotalCost(cartItems: cartItems);

              return bodyPadding(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: cartItems.length,
                        separatorBuilder: (context, index) {
                          // return gap5;
                          return Divider(
                            color: Colors.grey[300],
                          );
                        },
                        itemBuilder: (context, index) {
                          CartItemModel cartItem = cartItems[index];

                          CartBloc removeItemBloc = sl<CartBloc>();

                          return _listViewBody(
                            cartItem: cartItem,
                            removeItemBloc: removeItemBloc,
                          );
                        },
                      ),
                    ),
                    // gap15,
                    // const Spacer(),
                    _totalPriceAndCheckout(),
                    gap10,
                  ],
                ),
              );
            }

            if (state is MyCartErrorState) {
              return textWidget(
                text: state.error,
                textSize: TextSize.medium,
              );
            }

            return contactDeveloperWidget();
          },
        ),
      ),
    );
  }

  Row _totalPriceAndCheckout() {
    return Row(
      children: [
        textWidget(
          text: "Rs. $totalCost",
          textSize: TextSize.large,
          fontWeight: FontWeight.bold,
        ),
        // const Spacer(),
        gap20,
        Expanded(
          child: ElevatedButton(
            style: elevatedButtonStyle,
            onPressed: () {},
            child: textWidget(
                text: "Proceed To Checkout",
                textSize: TextSize.medium,
                color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _listViewBody(
      {required CartItemModel cartItem, required CartBloc removeItemBloc}) {
    return bodyPadding(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              networkImageWidget(
                imageUrl: cartItem.product!.images![0],
                height: 100,
                width: 100,
                boxFit: BoxFit.cover,
              ),
              gap15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  textWidget(
                    text: cartItem.product!.title!,
                    textSize: TextSize.medium,
                    fontWeight: FontWeight.bold,
                  ),
                  gap5,
                  textWidget(
                    text:
                        "${cartItem.variantType} : ${cartItem.variantType == "Color" ? cartItem.selectedColor!.name! : cartItem.selectedVariantName!}",
                    textSize: TextSize.small,
                  ),
                  textWidget(
                    text: "Rs. ${cartItem.price}",
                    textSize: TextSize.small,
                  ),
                  ProductQuantityWidget(
                    onValueChanged: handleQtyVariationChange,
                    maxQty: cartItem.maxOrder!,
                    initialQty: cartItem.quantity!,
                  ),
                  gap10,
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: elevatedButtonWithRedBGStyle,
                  onPressed: () {
                    log("remove tapped");

                    removeItemBloc.add(RemoveItemFromCart(
                      itemId: cartItem.id!,
                    ));
                  },
                  child: BlocConsumer<CartBloc, CartState>(
                    bloc: removeItemBloc,
                    listener: (context, state) {
                      if (state is RemoveItemFromCartSuccessState) {
                        // _cartBloc.add(GetMyCartEvent());
                      }

                      if (state is RemoveItemFromCartErrorState) {
                        Fluttertoast.showToast(
                          msg: state.error,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is RemoveItemFromCartLoadingState) {
                        return buttonCircularProgressIndicator();
                      }

                      return textWidget(
                        text: "Remove",
                        textSize: TextSize.small,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
              gap15,
              Expanded(
                child: ElevatedButton(
                  style: elevatedButtonStyle,
                  onPressed: () {},
                  child: textWidget(
                    text: "Move to wishlist",
                    textSize: TextSize.small,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text("Cart"),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void handleQtyVariationChange(int newQty) {
    productQty = newQty;

    log("new qty from parent = $productQty");
  }

  calculateTotalCost({required List<CartItemModel> cartItems}) {
    totalCost = 0;
    for (var item in cartItems) {
      totalCost += (item.price! * item.quantity!);
    }
  }
}
