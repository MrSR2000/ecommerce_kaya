part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class AddToCartLoadingState extends CartState {}

class AddToCartSuccessState extends CartState {
  final CartOuterResponseModel addToCartResponse;

  AddToCartSuccessState({required this.addToCartResponse});
}

class AddToCartErrorState extends CartState {
  final String error;

  AddToCartErrorState({required this.error});
}
