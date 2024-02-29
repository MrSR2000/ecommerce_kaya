import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/body_padding.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/contact_developer_widget.dart';
import 'package:kaya/core/resources/components/elevated_button_style.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/network_image_widget.dart';
import 'package:kaya/core/resources/components/rounded_border_container.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/features/products/pages/product_detail_page/product_detail_page.dart';
import 'package:kaya/models/product_model/product_model.dart';

import '../../../../../bloc/product/bloc/product_bloc.dart';

Widget productsGrid() {
  // ProductBloc productDetailBloc = sl<ProductBloc>();

  return bodyPadding(
    child: BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProductLoadingState:
            return centerCircularLoadingWidget();

          case ProductSuccessfulState:
            var successState = state as ProductSuccessfulState;
            ProductOuterModel productOuter = successState.product;
            List<ProductModel> products = productOuter.data!.docs!;

            return products.isEmpty
                ? Center(
                    child: textWidget(
                      text: "No Items Found",
                      textSize: TextSize.medium,
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 3.7,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
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
                    },
                  );

          case ProductErrorState:
            var errorState = state as ProductErrorState;

            return textWidget(
              text: errorState.error,
              textSize: TextSize.medium,
            );

          default:
            return contactDeveloperWidget();
        }
      },
    ),
  );
}
