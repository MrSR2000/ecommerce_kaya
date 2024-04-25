import 'package:flutter/material.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/features/products/pages/category/bloc/category_bloc.dart';
import 'package:kaya/models/filter_model/filter_model.dart';
import 'package:kaya/models/product_by_filter_model/product_by_filter_model.dart';

class FilterBrandsWidget extends StatefulWidget {
  final List<CustomBrandModel?> brands;
  final CategoryBloc categoryBloc;
  final String slug;
  final FilterModel filters;
  const FilterBrandsWidget({
    super.key,
    required this.brands,
    required this.categoryBloc,
    required this.slug,
    required this.filters,
  });

  @override
  State<FilterBrandsWidget> createState() => _FilterBrandsWidgetState();
}

class _FilterBrandsWidgetState extends State<FilterBrandsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textWidget(
          text: "Brands",
          textSize: TextSize.medium,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.brands.length,
          itemBuilder: (context, index) {
            CustomBrandModel? brand = widget.brands[index];

            return Row(
              children: [
                Checkbox(
                  value: brand?.isSelected ?? false,
                  onChanged: (value) {
                    setState(() {
                      brand?.isSelected = !brand.isSelected!;
                    });

                    widget.categoryBloc.add(CategoryGetProducts(
                      slug: widget.slug,
                      filter: widget.filters,
                      fromFilter: true,
                    ));
                  },
                ),
                textWidget(
                  text: brand?.name ?? "",
                  textSize: TextSize.small,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
