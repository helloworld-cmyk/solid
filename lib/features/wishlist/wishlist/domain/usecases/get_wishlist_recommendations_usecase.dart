import '../entities/wishlist_recommendation.dart';
import '../repositories/wishlist_repository.dart';

class GetWishlistRecommendationsUseCase {
  const GetWishlistRecommendationsUseCase({required WishlistRepository repository})
    : _repository = repository;

  final WishlistRepository _repository;

  Future<List<WishlistRecommendation>> call() {
    return _repository.getWishlistRecommendations();
  }
}