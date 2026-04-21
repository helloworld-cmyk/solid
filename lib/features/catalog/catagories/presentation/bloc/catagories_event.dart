sealed class CatagoriesEvent {
  const CatagoriesEvent();
}

final class CatagoriesStarted extends CatagoriesEvent {
  const CatagoriesStarted();
}

final class CatagoriesReloadRequested extends CatagoriesEvent {
  const CatagoriesReloadRequested();
}
