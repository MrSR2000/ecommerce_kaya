import 'package:flutter/material.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/features/products/pages/category/category_page.dart';
import 'package:kaya/models/product_by_filter_model/product_by_filter_model.dart';

class FilterCategoriesWidget extends StatefulWidget {
  final List<CategoryModel?> categories;
  const FilterCategoriesWidget({
    super.key,
    required this.categories,
  });

  @override
  State<FilterCategoriesWidget> createState() => FilterCategoriesWidgetState();
}

class FilterCategoriesWidgetState extends State<FilterCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textWidget(
          text: "Categories",
          textSize: TextSize.medium,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.categories.length,
          itemBuilder: (context, index) {
            CategoryModel? category = widget.categories[index];

            return InkWell(
              onTap: () {
                pushPage(
                  context: context,
                  page: CategoryPage(
                      slug: category?.slug ?? "", title: category?.title ?? ""),
                );
              },
              child: textWidget(
                text: category?.title ?? "",
                textSize: TextSize.small,
              ),
            );
          },
        ),
      ],
    );
  }
}
