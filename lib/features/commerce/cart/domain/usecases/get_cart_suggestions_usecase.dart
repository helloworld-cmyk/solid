import '../entities/cart_suggestion_product.dart';
import '../repositories/cart_suggestions_repository.dart';

class GetCartSuggestionsUseCase {
  const GetCartSuggestionsUseCase({
    required CartSuggestionsRepository repository,
  }) : _repository = repository;

  final CartSuggestionsRepository _repository;

  List<CartSuggestionProduct> call() {
    return _repository.getSuggestions();
  }
}
