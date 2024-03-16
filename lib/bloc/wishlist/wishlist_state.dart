part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

//add to wishlist
class AddRemovetoWishListLoadingState extends WishlistState {}

class AddRemovetoWishListSuccessState extends WishlistState {
  final Map<String, dynamic> response;

  AddRemovetoWishListSuccessState({required this.response});
}

class AddRemovetoWishListErrorState extends WishlistState {
  final String error;

  AddRemovetoWishListErrorState({required this.error});
}
