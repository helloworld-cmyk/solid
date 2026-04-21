import 'cart_item.dart';

class CartState {
  const CartState({this.items = const <CartItem>[]});

  final List<CartItem> items;

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }

  double get totalAmount {
    return items.fold(0, (double sum, CartItem item) => sum + item.totalPrice);
  }

  int get totalQuantity {
    return items.fold(0, (int sum, CartItem item) => sum + item.quantity);
  }
}