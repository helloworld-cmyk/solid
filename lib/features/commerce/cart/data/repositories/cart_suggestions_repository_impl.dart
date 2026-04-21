import '../../domain/entities/cart_suggestion_product.dart';
import '../../domain/repositories/cart_suggestions_repository.dart';
import '../datasources/cart_suggestions_data_source.dart';
import '../models/cart_suggestion_product_model.dart';

class CartSuggestionsRepositoryImpl implements CartSuggestionsRepository {
  const CartSuggestionsRepositoryImpl({
    required CartSuggestionsDataSource dataSource,
  }) : _dataSource = dataSource;

  final CartSuggestionsDataSource _dataSource;

  @override
  List<CartSuggestionProduct> getSuggestions() {
    final List<CartSuggestionProductModel> models = _dataSource
        .getSuggestions();
    return models
        .map((CartSuggestionProductModel model) => model.toEntity())
        .toList(growable: false);
  }
}
