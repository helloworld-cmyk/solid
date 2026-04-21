abstract class OnboardNextAction {
  const OnboardNextAction();
}

class OnboardAnimateToPage extends OnboardNextAction {
  const OnboardAnimateToPage({required this.pageIndex});

  final int pageIndex;
}

class OnboardNavigateToLogin extends OnboardNextAction {
  const OnboardNavigateToLogin();
}
