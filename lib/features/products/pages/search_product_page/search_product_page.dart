import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kaya/features/products/pages/home_page/widgets/products_grid_widget.dart';

import '../../../../bloc/product/bloc/product_bloc.dart';

import '../../../../injection_container.dart';

class SearchProductPage extends StatelessWidget {
  final String query;
  const SearchProductPage({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    ProductBloc _searchProductBloc = sl<ProductBloc>();

    return BlocProvider(
      create: (context) =>
          _searchProductBloc..add(SearchProductsEvent(searchQuery: query)),
      child: ProductsGrid(
        reCallApi: _searchProductBloc
          ..add(SearchProductsEvent(searchQuery: query)),
      ),
    );
  }
}
