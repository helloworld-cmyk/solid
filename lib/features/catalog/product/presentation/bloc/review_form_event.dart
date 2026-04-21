sealed class ReviewFormEvent {
  const ReviewFormEvent();
}

final class ReviewRatingChanged extends ReviewFormEvent {
  const ReviewRatingChanged(this.rating);

  final int rating;
}

final class ReviewSaveDetailsChanged extends ReviewFormEvent {
  const ReviewSaveDetailsChanged(this.value);

  final bool value;
}

final class ReviewFormEdited extends ReviewFormEvent {
  const ReviewFormEdited();
}

final class ReviewSubmitted extends ReviewFormEvent {
  const ReviewSubmitted({required this.productId});

  final String productId;
}
