import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/product/bloc/product_bloc.dart';
import '../../../../../injection_container.dart';

class ProductOfCategoryPage extends StatelessWidget {
  final String categoryName;
  final String slug;
  const ProductOfCategoryPage({
    super.key,
    required this.categoryName,
    required this.slug,
  });

  @override
  Widget build(BuildContext context) {
    ProductBloc productCategoryBloc = sl<ProductBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => productCategoryBloc
            ..add(
              ProductOfCategoryFetchEvent(
                slug: slug,
              ),
            ),
          // child: ProductsGrid(
          //   productBloc: productCategoryBloc,
          // ),
        ),
      ),
    );
  }
}
