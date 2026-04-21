sealed class HomeEvent {
  const HomeEvent();
}

final class HomeStarted extends HomeEvent {
  const HomeStarted();
}

final class HomeReloadRequested extends HomeEvent {
  const HomeReloadRequested();
}
