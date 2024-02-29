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
    return BlocProvider(
      create: (context) =>
          sl<ProductBloc>()..add(SearchProductsEvent(searchQuery: query)),
      child: productsGrid(),
    );
  }
}
