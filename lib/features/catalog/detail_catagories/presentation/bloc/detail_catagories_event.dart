sealed class DetailCatagoriesEvent {
  const DetailCatagoriesEvent();
}

final class DetailCatagoriesStarted extends DetailCatagoriesEvent {
  const DetailCatagoriesStarted({required this.categoryTitle});

  final String categoryTitle;
}

final class DetailCatagoriesReloadRequested extends DetailCatagoriesEvent {
  const DetailCatagoriesReloadRequested();
}

final class DetailCatagoriesCategoryChanged extends DetailCatagoriesEvent {
  const DetailCatagoriesCategoryChanged(this.category);

  final String category;
}

final class DetailCatagoriesSheetToggled extends DetailCatagoriesEvent {
  const DetailCatagoriesSheetToggled({required this.isOpen});

  final bool isOpen;
}
