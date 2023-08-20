import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/data/cart_items.dart';
import 'package:flutter_bloc_app/features/home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    // in this Event run function "cartInitialEvent".
    on<CartInitialEvent>(cartInitialEvent);

    on<CartToHomeNavigateEvent>(cartToHomeNavigateEvent);

    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartToHomeNavigateEvent(
      CartToHomeNavigateEvent event, Emitter<CartState> emit) {
    print('Cart to home');
    emit(CartToHomeNavigateState());
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    print('Remove item from cart.');
    emit(CartSuccessState(cartItems: cartItems));
  }
}
