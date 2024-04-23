import 'package:flutter/material.dart';
import 'package:kaya/features/products/pages/category/bloc/category_bloc.dart';
import 'package:kaya/features/products/pages/category/category_body.dart';
import 'package:kaya/features/products/pages/category/filter_end_drawer.dart';
import 'package:kaya/features/products/pages/category/widgets/category_widgets.dart';
import 'package:kaya/injection_container.dart';
import 'package:kaya/models/filter_model/filter_model.dart';

class CategoryPage extends StatelessWidget {
  final String title;
  final String slug;
  CategoryPage({
    super.key,
    required this.slug,
    required this.title,
  });

  final CategoryBloc categoryBloc = sl<CategoryBloc>();

  @override
  Widget build(BuildContext context) {
    FilterModel filterModel = FilterModel(slug: slug);

    return Scaffold(
      endDrawer: FilterEndDrawer(
        filterModel: filterModel,
        categoryBloc: categoryBloc,
        slug: slug,
      ),
      appBar: categoryAppBar(title: title),
      body: CategoryBody(
        slug: slug,
        filterModel: filterModel,
        categoryBloc: categoryBloc,
      ),
    );
  }
}
