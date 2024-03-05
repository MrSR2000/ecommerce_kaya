import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:kaya/core/resources/functions/authorization_format.dart';
import 'package:kaya/core/resources/functions/dio_error.dart';
import 'package:kaya/models/cart_model/add_to_cart_request_model.dart';
import 'package:kaya/models/cart_model/cart_response_model.dart';
import 'package:kaya/repository/api_service.dart';
import 'package:meta/meta.dart';

import '../../injection_container.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCartEvent>(addToCartEvent);
    on<GetMyCartEvent>(getMyCart);
    on<RemoveItemFromCart>(removeItemFromCart);
    on<UpdatedCartEvent>(updatedCartEvent);
  }

  FutureOr<void> addToCartEvent(
      AddToCartEvent event, Emitter<CartState> emit) async {
    emit(AddToCartLoadingState());

    try {
      String accessToken = await getAccessTokenFormat();

      CartOuterResponseModel addToCartResponse = await sl<ApiService>()
          .addToCart(accessToken, event.addToCartRequestModel);

      log("add to cart success = $addToCartResponse");

      cartBloc.add(UpdatedCartEvent(myCart: addToCartResponse));

      emit(AddToCartSuccessState(addToCartResponse: addToCartResponse));
    } catch (e) {
      var error = dioErrorResponse(e);

      log("add to cart error = $error");

      emit(AddToCartErrorState(error: error));
    }
  }

  FutureOr<void> getMyCart(
      GetMyCartEvent event, Emitter<CartState> emit) async {
    emit(MyCartLoadingState());

    try {
      String accessToken = await getAccessTokenFormat();

      CartOuterResponseModel cartResponseModel =
          await sl<ApiService>().getMyCart(accessToken);

      log("my cart success = $cartResponseModel");

      log("no of items in cart = ${cartResponseModel.data!.items!.length}");

      emit(MyCartSuccessState(cartData: cartResponseModel.data!));
    } catch (e) {
      var error = dioErrorResponse(e);

      log("my cart error = $error");

      emit(MyCartErrorState(error: error));
    }
  }

  FutureOr<void> removeItemFromCart(
      RemoveItemFromCart event, Emitter<CartState> emit) async {
    log("remove in bloc");

    emit(RemoveItemFromCartLoadingState());

    try {
      String accessToken = await getAccessTokenFormat();

      CartOuterResponseModel resopnse =
          await sl<ApiService>().removeItemFromCart(accessToken, event.itemId);

      log("success remove item = $resopnse");

      cartBloc.add(UpdatedCartEvent(myCart: resopnse));

      emit(RemoveItemFromCartSuccessState());
    } catch (e) {
      var error = dioErrorResponse(e);

      log("error remove item = $error");

      emit(RemoveItemFromCartErrorState(error: error));
    }
  }

  FutureOr<void> updatedCartEvent(
      UpdatedCartEvent event, Emitter<CartState> emit) async {
    emit(MyCartSuccessState(cartData: event.myCart.data!));
  }
}
