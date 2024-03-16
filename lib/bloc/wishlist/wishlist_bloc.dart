import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:kaya/core/resources/functions/authorization_format.dart';
import 'package:kaya/core/resources/functions/dio_error.dart';
import 'package:kaya/repository/api_service.dart';
import 'package:meta/meta.dart';

import '../../injection_container.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<AddRemoveToWishListEvent>(addRemoveToWishListEvent);
  }

  FutureOr<void> addRemoveToWishListEvent(
      AddRemoveToWishListEvent event, Emitter<WishlistState> emit) async {
    emit(AddRemovetoWishListLoadingState());

    try {
      String accessToken = await getAccessTokenFormat();

      Map<String, dynamic> product = {
        "product": event.productId,
      };

      Map<String, dynamic> response =
          await sl<ApiService>().addOrRemoveToWishlist(accessToken, product);

      log("added or removed success = $response");

      emit(AddRemovetoWishListSuccessState(response: response));
    } catch (e) {
      var error = dioErrorResponse(e);

      log("add or remove error = $error");

      emit(AddRemovetoWishListErrorState(error: error));
    }
  }
}
