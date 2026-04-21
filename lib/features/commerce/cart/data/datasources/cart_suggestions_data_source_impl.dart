import '../models/cart_suggestion_product_model.dart';
import 'cart_suggestions_data_source.dart';

class CartSuggestionsDataSourceImpl implements CartSuggestionsDataSource {
  const CartSuggestionsDataSourceImpl();

  @override
  List<CartSuggestionProductModel> getSuggestions() {
    return const <CartSuggestionProductModel>[
      CartSuggestionProductModel(
        name: 'Cotton T-shirt Text',
        image: 'assets/home/arrival2.png',
        priceText: '\$ 49.00',
        priceValue: 49,
      ),
      CartSuggestionProductModel(
        name: 'Slit Denim Skirt',
        image: 'assets/home/arrival1.png',
        priceText: '\$ 129.00',
        priceValue: 129,
      ),
      CartSuggestionProductModel(
        name: 'Embroidered T-shirt',
        image: 'assets/home/arrival2.png',
        priceText: '\$ 39.00',
        priceValue: 39,
      ),
      CartSuggestionProductModel(
        name: 'Coat With Belt',
        image: 'assets/home/arrival1.png',
        priceText: '\$ 49.00',
        priceValue: 49,
      ),
    ];
  }
}
