import '../models/cart_suggestion_product_model.dart';

abstract class CartSuggestionsDataSource {
  List<CartSuggestionProductModel> getSuggestions();
}
