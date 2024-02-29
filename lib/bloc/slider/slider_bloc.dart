import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:kaya/models/image_model/slider_model.dart';
import 'package:kaya/repository/api_service.dart';
import 'package:meta/meta.dart';

import '../../injection_container.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderInitial()) {
    on<SliderFetchEvent>(sliderFetchEvent);
  }

  FutureOr<void> sliderFetchEvent(
      SliderFetchEvent event, Emitter<SliderState> emit) async {
    emit(SliderLoadingState());

    try {
      SliderModel slider = await sl<ApiService>().getSlider();

      log("slider response = $slider");

      emit(SliderSuccessfulState(slider: slider));
    } catch (e) {
      log("error in slider = $e");
    }
  }
}
