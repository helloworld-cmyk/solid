class Review {
  const Review({
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
}
