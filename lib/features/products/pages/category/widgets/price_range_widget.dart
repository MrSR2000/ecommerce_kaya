import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/features/products/pages/category/bloc/category_bloc.dart';
import 'package:kaya/models/filter_model/filter_model.dart';

class PriceRangeWidget extends StatefulWidget {
  final int min;
  final int max;
  final FilterModel filterModel;
  final CategoryBloc categoryBloc;
  const PriceRangeWidget({
    super.key,
    required this.max,
    required this.min,
    required this.filterModel,
    required this.categoryBloc,
  });

  @override
  State<PriceRangeWidget> createState() => _PriceRangeWidgetState();
}

class _PriceRangeWidgetState extends State<PriceRangeWidget> {
  late RangeValues _currentRangeValues;
  late int _division;

  @override
  void initState() {
    super.initState();
    _division = (widget.max - widget.min) ~/ 100;

    log("valueeeeee == ${widget.filterModel.min}");

    if (widget.filterModel.min == null || widget.filterModel.max == null) {
      log("min max value not there");

      _currentRangeValues = RangeValues(
        widget.min.toDouble(),
        widget.max.toDouble(),
      );
    } else {
      log("min max value already there");

      _currentRangeValues = RangeValues(
        widget.filterModel.min!.toDouble(),
        widget.filterModel.max!.toDouble(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          text: "Budget",
          textSize: TextSize.medium,
          fontWeight: FontWeight.w700,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: primaryColor,
            inactiveTrackColor: primaryColor,
            trackShape: const RectangularSliderTrackShape(),
            trackHeight: 0.2,
            thumbColor: primaryColor,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 1.0,
              disabledThumbRadius: 1.0,
            ),
            // overlayColor: Colors.red.withAlpha(32),
            // overlayShape: const RoundSliderOverlayShape(overlayRadius: 5.0),
          ),
          child: RangeSlider(
            values: _currentRangeValues,
            min: widget.min.toDouble(),
            max: widget.max.toDouble(),
            divisions: _division,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
              widget.filterModel.max = values.end.toInt();
              widget.filterModel.min = values.start.toInt();

              widget.categoryBloc.add(CategoryGetProducts(
                slug: widget.filterModel.slug!,
                filter: widget.filterModel,
              ));
            },
          ),
        ),
        Row(
          children: [
            textWidget(
              text: "Rs.${widget.min.toInt().toString()}",
              textSize: TextSize.small,
            ),
            const Spacer(),
            textWidget(
              text: "Rs.${widget.max.toInt().toString()}",
              textSize: TextSize.small,
            ),
          ],
        ),
      ],
    );
  }
}
