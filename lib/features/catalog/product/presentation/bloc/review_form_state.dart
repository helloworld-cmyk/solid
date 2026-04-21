class ReviewFormState {
  const ReviewFormState({
    this.rating = 0,
    this.saveDetails = false,
    this.isSubmitting = false,
    this.successMessage,
    this.ratingError,
    this.failureMessage,
  });

  static const Object _unset = Object();

  final int rating;
  final bool saveDetails;
  final bool isSubmitting;
  final String? successMessage;
  final String? ratingError;
  final String? failureMessage;

  ReviewFormState copyWith({
    int? rating,
    bool? saveDetails,
    bool? isSubmitting,
    Object? successMessage = _unset,
    Object? ratingError = _unset,
    Object? failureMessage = _unset,
  }) {
    return ReviewFormState(
      rating: rating ?? this.rating,
      saveDetails: saveDetails ?? this.saveDetails,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      successMessage: identical(successMessage, _unset)
          ? this.successMessage
          : successMessage as String?,
      ratingError: identical(ratingError, _unset)
          ? this.ratingError
          : ratingError as String?,
      failureMessage: identical(failureMessage, _unset)
          ? this.failureMessage
          : failureMessage as String?,
    );
  }
}
