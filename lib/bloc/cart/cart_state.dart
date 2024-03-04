part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

//add to cart
class AddToCartLoadingState extends CartState {}

class AddToCartSuccessState extends CartState {
  final CartOuterResponseModel addToCartResponse;

  AddToCartSuccessState({required this.addToCartResponse});
}

class AddToCartErrorState extends CartState {
  final String error;

  AddToCartErrorState({required this.error});
}

//get my cart
class MyCartLoadingState extends CartState {}

class MyCartSuccessState extends CartState {
  final CartDataModel cartData;

  MyCartSuccessState({required this.cartData});
}

class MyCartErrorState extends CartState {
  final String error;

  MyCartErrorState({required this.error});
}
