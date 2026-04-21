import '../entities/onboard_next_action.dart';

class ResolveOnboardNextActionUseCase {
  const ResolveOnboardNextActionUseCase();

  OnboardNextAction call({required int currentIndex, required int totalPages}) {
    final bool isLastPage = currentIndex >= totalPages - 1;
    if (isLastPage) {
      return const OnboardNavigateToLogin();
    }

    return OnboardAnimateToPage(pageIndex: currentIndex + 1);
  }
}
