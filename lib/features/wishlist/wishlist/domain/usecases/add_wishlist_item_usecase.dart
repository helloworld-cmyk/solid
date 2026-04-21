import '../entities/wishlist_item.dart';
import '../repositories/wishlist_repository.dart';

class AddWishlistItemUseCase {
  const AddWishlistItemUseCase({required WishlistRepository repository})
    : _repository = repository;

  final WishlistRepository _repository;

  Future<List<WishlistItem>> call(WishlistItem item) {
    return _repository.addWishlistItem(item);
  }
}