import 'package:flutter/material.dart';

import '../../domain/entities/search_filter.dart';

enum SearchFilterStatus { initial, loading, success, failure }

class SearchFilterState {
  const SearchFilterState({
    this.status = SearchFilterStatus.initial,
    this.filter,
    this.expandedTitles = const <String>[],
    this.selectedCategoryItem = '',
    this.selectedColorValue = 0xFFFFFFFF,
    this.selectedSize = '',
    this.priceValues = const RangeValues(0, 0),
    this.errorMessage,
  });

  final SearchFilterStatus status;
  final SearchFilter? filter;
  final List<String> expandedTitles;
  final String selectedCategoryItem;
  final int selectedColorValue;
  final String selectedSize;
  final RangeValues priceValues;
  final String? errorMessage;

  bool get isInitial => status == SearchFilterStatus.initial;
  bool get isLoading => status == SearchFilterStatus.loading;
  bool get isSuccess => status == SearchFilterStatus.success;
  bool get isFailure => status == SearchFilterStatus.failure;

  SearchFilterState copyWith({
    SearchFilterStatus? status,
    SearchFilter? filter,
    bool keepFilter = true,
    List<String>? expandedTitles,
    String? selectedCategoryItem,
    int? selectedColorValue,
    String? selectedSize,
    RangeValues? priceValues,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return SearchFilterState(
      status: status ?? this.status,
      filter: keepFilter ? (filter ?? this.filter) : filter,
      expandedTitles: expandedTitles ?? this.expandedTitles,
      selectedCategoryItem: selectedCategoryItem ?? this.selectedCategoryItem,
      selectedColorValue: selectedColorValue ?? this.selectedColorValue,
      selectedSize: selectedSize ?? this.selectedSize,
      priceValues: priceValues ?? this.priceValues,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}
