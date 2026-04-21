import '../../domain/entities/cart_suggestion_product.dart';

class CartSuggestionProductModel {
  const CartSuggestionProductModel({
    required this.name,
    required this.image,
    required this.priceText,
    required this.priceValue,
  });

  final String name;
  final String image;
  final String priceText;
  final double priceValue;

  CartSuggestionProduct toEntity() {
    return CartSuggestionProduct(
      name: name,
      image: image,
      priceText: priceText,
      priceValue: priceValue,
    );
  }
}
