import 'package:flutter/material.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/core/resources/functions/hex_color.dart';
import 'package:kaya/models/product_detail_model/product_detail_model.dart';

//color variation
class ProductColorVariationWidget extends StatefulWidget {
  final List<ColorVariantsModel> colorVariants;
  final Function(int) onValueChanged;
  const ProductColorVariationWidget({
    super.key,
    required this.colorVariants,
    required this.onValueChanged,
  });

  @override
  State<ProductColorVariationWidget> createState() =>
      ProductColorVariationWidgetState();
}

class ProductColorVariationWidgetState
    extends State<ProductColorVariationWidget> {
  late int _selectedColorIndex;

  // Function to handle value changes and notify the parent
  void _handleValueChanged(int newValue) {
    setState(() {
      _selectedColorIndex = newValue;
    });

    // Notify the parent about the changed value
    widget.onValueChanged(_selectedColorIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          text:
              "Color (${widget.colorVariants[_selectedColorIndex].color!.name!})",
          textSize: TextSize.medium,
          fontWeight: FontWeight.w500,
        ),
        gap10,
        SizedBox(
          height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.colorVariants.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onTap: () {
                    _handleValueChanged(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: _selectedColorIndex == index
                          ? Border.all(
                              color: Colors.black,
                            )
                          : null,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        color: getColorFromHex(
                          widget.colorVariants[index].color!.colorValue!,
                        ),
                        // borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedColorIndex = 0;
  }
}

//size variation
class ProductSizeVariationWidget extends StatefulWidget {
  final List<SizeVariantsModel> sizeVariants;
  final Function(int) onValueChanged;

  const ProductSizeVariationWidget({
    super.key,
    required this.sizeVariants,
    required this.onValueChanged,
  });

  @override
  State<ProductSizeVariationWidget> createState() =>
      _ProductSizeVariationWidgetState();
}

class _ProductSizeVariationWidgetState
    extends State<ProductSizeVariationWidget> {
  late int _selectedSizeIndex;

  // Function to handle value changes and notify the parent
  void _handleValueChanged(int newValue) {
    setState(() {
      _selectedSizeIndex = newValue;
    });

    // Notify the parent about the changed value
    widget.onValueChanged(_selectedSizeIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textWidget(
          text: "Size (${widget.sizeVariants[_selectedSizeIndex].variantName})",
          textSize: TextSize.medium,
          fontWeight: FontWeight.w500,
        ),
        gap10,
        SizedBox(
          height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.sizeVariants.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _handleValueChanged(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: _selectedSizeIndex == index
                        ? Border.all(
                            color: Colors.black,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: textWidget(
                    text: widget.sizeVariants[index].variantName!,
                    textSize: TextSize.small,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedSizeIndex = 0;
  }
}
