import '../entities/product_detail.dart';

abstract class ProductRepository {
  Future<ProductDetail> getProductDetail({
    String? image,
    String? title,
    double? price,
  });

  Future<void> submitReview({
    required String productId,
    required String review,
    required String name,
    required String email,
    required int rating,
    required bool saveDetails,
  });
}
