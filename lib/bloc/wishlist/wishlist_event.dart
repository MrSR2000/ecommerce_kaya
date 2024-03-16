part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class AddRemoveToWishListEvent extends WishlistEvent {
  final String productId;

  AddRemoveToWishListEvent({required this.productId});
}
