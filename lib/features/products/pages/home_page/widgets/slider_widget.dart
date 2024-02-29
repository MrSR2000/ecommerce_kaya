import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/contact_developer_widget.dart';
import 'package:kaya/models/image_model/slider_model.dart';
import '../../../../../bloc/slider/slider_bloc.dart';
import '../../../../../core/resources/components/image_slider.dart';
import '../../../../../injection_container.dart';

Widget sliderWidget() {
  return BlocProvider(
    create: (context) => sl<SliderBloc>()..add(SliderFetchEvent()),
    child: BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case SliderLoadingState:
            return centerCircularLoadingWidget();

          case SliderSuccessfulState:
            var successState = state as SliderSuccessfulState;

            SliderModel slider = successState.slider;

            return ImageSlider(images: slider.data!);

          case SliderErrorState:
            return const Text("error");

          default:
            return contactDeveloperWidget();
        }
      },
    ),
  );
}
