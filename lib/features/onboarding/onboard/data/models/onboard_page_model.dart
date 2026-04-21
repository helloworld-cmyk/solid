import '../../domain/entities/onboard_page.dart';

class OnboardPageModel {
  const OnboardPageModel({
    required this.assetPath,
    required this.title,
    required this.dotColorValue,
  });

  final String assetPath;
  final String title;
  final int dotColorValue;

  OnboardPage toEntity() {
    return OnboardPage(
      assetPath: assetPath,
      title: title,
      dotColorValue: dotColorValue,
    );
  }
}
