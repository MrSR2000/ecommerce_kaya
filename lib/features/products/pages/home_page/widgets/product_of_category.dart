import 'package:flutter/material.dart';
import 'package:kaya/features/products/pages/home_page/widgets/products_grid_widget.dart';

class ProductOfCategoryPage extends StatelessWidget {
  final String categoryName;
  const ProductOfCategoryPage({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: SingleChildScrollView(
        child: productsGrid(),
      ),
    );
  }
}
