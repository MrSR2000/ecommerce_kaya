part of 'slider_bloc.dart';

@immutable
sealed class SliderState {}

final class SliderInitial extends SliderState {}

final class SliderLoadingState extends SliderState {}

final class SliderSuccessfulState extends SliderState {
  final SliderModel slider;

  SliderSuccessfulState({required this.slider});
}

final class SliderErrorState extends SliderState {}
