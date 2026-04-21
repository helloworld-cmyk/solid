import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_event.dart';
import 'cart_item.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
    on<CartItemQuantityUpdated>(_onItemQuantityUpdated);
    on<CartCleared>(_onCleared);
  }

  void _onItemAdded(CartItemAdded event, Emitter<CartState> emit) {
    final int existingIndex = state.items.indexWhere(
      (CartItem item) => item.id == event.item.id,
    );

    if (existingIndex < 0) {
      emit(state.copyWith(items: <CartItem>[...state.items, event.item]));
      return;
    }

    final List<CartItem> updatedItems = List<CartItem>.from(state.items);
    final CartItem existingItem = updatedItems[existingIndex];

    updatedItems[existingIndex] = existingItem.copyWith(
      quantity: existingItem.quantity + event.item.quantity,
    );

    emit(state.copyWith(items: updatedItems));
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    final List<CartItem> updatedItems = state.items
        .where((CartItem item) => item.id != event.productId)
        .toList();
    emit(state.copyWith(items: updatedItems));
  }

  void _onItemQuantityUpdated(
    CartItemQuantityUpdated event,
    Emitter<CartState> emit,
  ) {
    if (event.quantity <= 0) {
      add(CartItemRemoved(event.productId));
      return;
    }

    final List<CartItem> updatedItems = state.items.map((CartItem item) {
      if (item.id != event.productId) {
        return item;
      }
      return item.copyWith(quantity: event.quantity);
    }).toList();

    emit(state.copyWith(items: updatedItems));
  }

  void _onCleared(CartCleared event, Emitter<CartState> emit) {
    emit(const CartState());
  }
}