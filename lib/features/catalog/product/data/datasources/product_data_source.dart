import '../models/product_detail_model.dart';

abstract class ProductDataSource {
  Future<ProductDetailModel> getProductDetail({
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
