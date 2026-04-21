import '../entities/product_detail.dart';
import '../repositories/product_repository.dart';

class GetProductDetailUseCase {
  const GetProductDetailUseCase({required ProductRepository repository})
    : _repository = repository;

  final ProductRepository _repository;

  Future<ProductDetail> call({String? image, String? title, double? price}) {
    return _repository.getProductDetail(
      image: image,
      title: title,
      price: price,
    );
  }
}
