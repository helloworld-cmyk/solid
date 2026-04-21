import 'cart_item.dart';

sealed class CartEvent {
  const CartEvent();
}

final class CartItemAdded extends CartEvent {
  const CartItemAdded(this.item);

  final CartItem item;
}

final class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.productId);

  final String productId;
}

final class CartItemQuantityUpdated extends CartEvent {
  const CartItemQuantityUpdated({
    required this.productId,
    required this.quantity,
  });

  final String productId;
  final int quantity;
}

final class CartCleared extends CartEvent {
  const CartCleared();
}