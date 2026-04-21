sealed class WishlistEvent {
  const WishlistEvent();
}

final class WishlistStarted extends WishlistEvent {
  const WishlistStarted();
}

final class WishlistItemAdded extends WishlistEvent {
  const WishlistItemAdded({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    this.isAsset = true,
  });

  final String id;
  final String name;
  final String imagePath;
  final double price;
  final bool isAsset;
}

final class WishlistItemRemoved extends WishlistEvent {
  const WishlistItemRemoved(this.productId);

  final String productId;
}