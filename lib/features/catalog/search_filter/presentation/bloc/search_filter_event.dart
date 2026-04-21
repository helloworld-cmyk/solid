import 'package:flutter/material.dart';

sealed class SearchFilterEvent {
  const SearchFilterEvent();
}

final class SearchFilterStarted extends SearchFilterEvent {
  const SearchFilterStarted();
}

final class SearchFilterReloadRequested extends SearchFilterEvent {
  const SearchFilterReloadRequested();
}

final class SearchFilterGroupSelected extends SearchFilterEvent {
  const SearchFilterGroupSelected(this.title);

  final String title;
}

final class SearchFilterItemSelected extends SearchFilterEvent {
  const SearchFilterItemSelected(this.item);

  final String item;
}

final class SearchFilterColorSelected extends SearchFilterEvent {
  const SearchFilterColorSelected(this.colorValue);

  final int colorValue;
}

final class SearchFilterSizeSelected extends SearchFilterEvent {
  const SearchFilterSizeSelected(this.size);

  final String size;
}

final class SearchFilterPriceRangeChanged extends SearchFilterEvent {
  const SearchFilterPriceRangeChanged(this.values);

  final RangeValues values;
}