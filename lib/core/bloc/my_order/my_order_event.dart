import 'package:solid/core/bloc/cart/cart_item.dart';

sealed class MyOrderEvent {
  const MyOrderEvent();
}

final class MyOrderStarted extends MyOrderEvent {
  const MyOrderStarted();
}

final class MyOrderPlacedFromCart extends MyOrderEvent {
  const MyOrderPlacedFromCart(this.items);

  final List<CartItem> items;
}

final class MyOrderReloadRequested extends MyOrderEvent {
  const MyOrderReloadRequested();
}
