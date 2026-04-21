import '../entities/wishlist_item.dart';
import '../repositories/wishlist_repository.dart';

class GetWishlistItemsUseCase {
  const GetWishlistItemsUseCase({required WishlistRepository repository})
    : _repository = repository;

  final WishlistRepository _repository;

  Future<List<WishlistItem>> call() {
    return _repository.getWishlistItems();
  }
}