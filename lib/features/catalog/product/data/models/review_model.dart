import '../../domain/entities/review.dart';

class ReviewModel {
  const ReviewModel({
    required this.userName,
    required this.avatarPath,
    required this.rating,
    required this.date,
    required this.comment,
  });

  final String userName;
  final String avatarPath;
  final double rating;
  final String date;
  final String comment;

  Review toEntity() {
    return Review(
      userName: userName,
      avatarPath: avatarPath,
      rating: rating,
      date: date,
      comment: comment,
    );
  }
}
