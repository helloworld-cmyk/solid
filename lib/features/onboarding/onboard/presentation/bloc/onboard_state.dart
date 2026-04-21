import '../../domain/entities/onboard_page.dart';

class OnboardState {
  const OnboardState({
    required this.pages,
    required this.pagePosition,
    required this.shouldNavigateToLogin,
  });

  const OnboardState.initial({required this.pages})
    : pagePosition = 0,
      shouldNavigateToLogin = false;

  final List<OnboardPage> pages;
  final double pagePosition;
  final bool shouldNavigateToLogin;

  OnboardState copyWith({
    List<OnboardPage>? pages,
    double? pagePosition,
    bool? shouldNavigateToLogin,
  }) {
    return OnboardState(
      pages: pages ?? this.pages,
      pagePosition: pagePosition ?? this.pagePosition,
      shouldNavigateToLogin:
          shouldNavigateToLogin ?? this.shouldNavigateToLogin,
    );
  }
}
