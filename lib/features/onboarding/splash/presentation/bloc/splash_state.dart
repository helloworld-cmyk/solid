class SplashState {
  const SplashState({
    required this.animationProgress,
    required this.shouldNavigateToOnboard,
  });

  const SplashState.initial()
    : animationProgress = 0,
      shouldNavigateToOnboard = false;

  final double animationProgress;

  final bool shouldNavigateToOnboard;

  SplashState copyWith({
    double? animationProgress,
    bool? shouldNavigateToOnboard,
  }) {
    return SplashState(
      animationProgress: animationProgress ?? this.animationProgress,
      shouldNavigateToOnboard:
          shouldNavigateToOnboard ?? this.shouldNavigateToOnboard,
    );
  }
}
