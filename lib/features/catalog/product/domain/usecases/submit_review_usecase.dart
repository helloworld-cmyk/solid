import '../repositories/product_repository.dart';

class SubmitReviewUseCase {
  const SubmitReviewUseCase({required ProductRepository repository})
    : _repository = repository;

  final ProductRepository _repository;

  Future<void> call(SubmitReviewParams params) {
    if (params.rating < 1 || params.rating > 5) {
      throw ArgumentError.value(params.rating, 'rating', 'Must be from 1 to 5');
    }

    return _repository.submitReview(
      productId: params.productId,
      review: params.review.trim(),
      name: params.name.trim(),
      email: params.email.trim(),
      rating: params.rating,
      saveDetails: params.saveDetails,
    );
  }
}

class SubmitReviewParams {
  const SubmitReviewParams({
    required this.productId,
    required this.review,
    required this.name,
    required this.email,
    required this.rating,
    required this.saveDetails,
  });

  final String productId;
  final String review;
  final String name;
  final String email;
  final int rating;
  final bool saveDetails;
}
