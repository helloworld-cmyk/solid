import '../entities/cart_suggestion_product.dart';

abstract class CartSuggestionsRepository {
  List<CartSuggestionProduct> getSuggestions();
}
