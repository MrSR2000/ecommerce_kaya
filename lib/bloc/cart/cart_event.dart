part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCartEvent extends CartEvent {
  final AddToCartRequestModel addToCartRequestModel;

  AddToCartEvent({required this.addToCartRequestModel});
}

class GetMyCartEvent extends CartEvent {}

class UpdatedCartEvent extends CartEvent {
  final CartOuterResponseModel myCart;

  UpdatedCartEvent({required this.myCart});
}

class RemoveItemFromCart extends CartEvent {
  final String itemId;

  RemoveItemFromCart({
    required this.itemId,
  });
}
