import '../../domain/entities/wishlist_item.dart';
import '../../domain/entities/wishlist_recommendation.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../datasources/wishlist_data_source.dart';
import '../models/wishlist_item_model.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  const WishlistRepositoryImpl({required WishlistDataSource dataSource})
    : _dataSource = dataSource;

  final WishlistDataSource _dataSource;

  @override
  Future<List<WishlistItem>> getWishlistItems() async {
    final List<WishlistItemModel> models = await _dataSource.getWishlistItems();
    return models
        .map((WishlistItemModel model) => model.toEntity())
        .toList(growable: false);
  }

  @override
  Future<List<WishlistItem>> addWishlistItem(WishlistItem item) async {
    final List<WishlistItemModel> models = await _dataSource.addWishlistItem(
      WishlistItemModel.fromEntity(item),
    );
    return models
        .map((WishlistItemModel model) => model.toEntity())
        .toList(growable: false);
  }

  @override
  Future<List<WishlistItem>> removeWishlistItem(String productId) async {
    final List<WishlistItemModel> models = await _dataSource.removeWishlistItem(
      productId,
    );
    return models
        .map((WishlistItemModel model) => model.toEntity())
        .toList(growable: false);
  }

  @override
  Future<List<WishlistRecommendation>> getWishlistRecommendations() async {
    final models = await _dataSource.getWishlistRecommendations();
    return models
        .map((model) => model.toEntity())
        .toList(growable: false);
  }
}