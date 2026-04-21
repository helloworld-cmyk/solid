import '../../domain/entities/product_detail.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl({required ProductDataSource dataSource})
    : _dataSource = dataSource;

  final ProductDataSource _dataSource;

  @override
  Future<ProductDetail> getProductDetail({
    String? image,
    String? title,
    double? price,
  }) async {
    final ProductDetail data = (await _dataSource.getProductDetail(
      image: image,
      title: title,
      price: price,
    )).toEntity();
    return data;
  }

  @override
  Future<void> submitReview({
    required String productId,
    required String review,
    required String name,
    required String email,
    required int rating,
    required bool saveDetails,
  }) {
    return _dataSource.submitReview(
      productId: productId,
      review: review,
      name: name,
      email: email,
      rating: rating,
      saveDetails: saveDetails,
    );
  }
}
