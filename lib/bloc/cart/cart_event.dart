part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCartEvent extends CartEvent {
  final AddToCartRequestModel addToCartRequestModel;

  AddToCartEvent({required this.addToCartRequestModel});
}
