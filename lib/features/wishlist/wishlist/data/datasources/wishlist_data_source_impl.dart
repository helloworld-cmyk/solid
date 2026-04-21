import '../models/wishlist_item_model.dart';
import '../models/wishlist_recommendation_model.dart';
import 'wishlist_data_source.dart';

class WishlistDataSourceImpl implements WishlistDataSource {
  WishlistDataSourceImpl()
    : _wishlistItems = List<WishlistItemModel>.from(
        _initialWishlistItems,
        growable: true,
      );

  final List<WishlistItemModel> _wishlistItems;

  @override
  Future<List<WishlistItemModel>> getWishlistItems() async {
    return List<WishlistItemModel>.from(_wishlistItems, growable: false);
  }

  @override
  Future<List<WishlistItemModel>> addWishlistItem(WishlistItemModel item) async {
    _wishlistItems.removeWhere(
      (WishlistItemModel current) => current.id == item.id,
    );
    _wishlistItems.insert(0, item);
    return getWishlistItems();
  }

  @override
  Future<List<WishlistItemModel>> removeWishlistItem(String productId) async {
    _wishlistItems.removeWhere(
      (WishlistItemModel item) => item.id == productId,
    );
    return getWishlistItems();
  }

  @override
  Future<List<WishlistRecommendationModel>>
  getWishlistRecommendations() async {
    return List<WishlistRecommendationModel>.from(
      _wishlistRecommendations,
      growable: false,
    );
  }
}

const List<WishlistItemModel> _initialWishlistItems = <WishlistItemModel>[
  WishlistItemModel(
    id: 'basic_tshirt',
    name: 'Basic T-shirt',
    imagePath: 'assets/catagories/men/men1.png',
    price: 49,
  ),
  WishlistItemModel(
    id: 'cotton_tshirt',
    name: 'Cotton T-shirt',
    imagePath: 'assets/catagories/men/men2.png',
    price: 69,
  ),
  WishlistItemModel(
    id: 'long_sleeved_tshirt',
    name: 'Long-sleeved T-shirt',
    imagePath: 'assets/catagories/women/women1.jpg',
    price: 49,
  ),
];

const List<WishlistRecommendationModel> _wishlistRecommendations =
    <WishlistRecommendationModel>[
      WishlistRecommendationModel(
        id: 'wishlist_reco_1',
        name: 'Cotton T-shirt Text',
        imagePath: 'assets/catagories/men/men4.png',
        price: 49,
        soldLabel: 'Sold (50 Products)',
      ),
      WishlistRecommendationModel(
        id: 'wishlist_reco_2',
        name: 'Slit Denim Skirt',
        imagePath: 'assets/catagories/bags/bag1.jpeg',
        price: 89,
        originalPrice: 129,
        soldLabel: 'Sold (35 Products)',
      ),
      WishlistRecommendationModel(
        id: 'wishlist_reco_3',
        name: 'Embroidered T-shirt',
        imagePath: 'assets/catagories/kids/kid1.jpeg',
        price: 39,
        soldLabel: 'Sold (48 Products)',
      ),
      WishlistRecommendationModel(
        id: 'wishlist_reco_4',
        name: 'Coat With Belt',
        imagePath: 'assets/catagories/women/women4.jpg',
        price: 19,
        originalPrice: 49,
        soldLabel: 'Sold (22 Products)',
      ),
    ];