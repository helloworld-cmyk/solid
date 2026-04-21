import '../entities/wishlist_item.dart';
import '../repositories/wishlist_repository.dart';

class RemoveWishlistItemUseCase {
  const RemoveWishlistItemUseCase({required WishlistRepository repository})
    : _repository = repository;

  final WishlistRepository _repository;

  Future<List<WishlistItem>> call(String productId) {
    return _repository.removeWishlistItem(productId);
  }
}