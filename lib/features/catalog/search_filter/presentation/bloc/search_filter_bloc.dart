import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/search_filter.dart';
import '../../domain/usecases/build_search_filter_usecase.dart';
import 'search_filter_event.dart';
import 'search_filter_state.dart';

class SearchFilterBloc extends Bloc<SearchFilterEvent, SearchFilterState> {
  SearchFilterBloc({required BuildSearchFilterUseCase buildSearchFilterUseCase})
    : _buildSearchFilterUseCase = buildSearchFilterUseCase,
      super(const SearchFilterState()) {
    on<SearchFilterStarted>(_onStarted);
    on<SearchFilterReloadRequested>(_onReloadRequested);
    on<SearchFilterGroupSelected>(_onGroupSelected);
    on<SearchFilterItemSelected>(_onItemSelected);
    on<SearchFilterColorSelected>(_onColorSelected);
    on<SearchFilterSizeSelected>(_onSizeSelected);
    on<SearchFilterPriceRangeChanged>(_onPriceRangeChanged);
  }

  final BuildSearchFilterUseCase _buildSearchFilterUseCase;

  Future<void> _onStarted(
    SearchFilterStarted event,
    Emitter<SearchFilterState> emit,
  ) async {
    if (!state.isInitial) {
      return;
    }

    await _loadFilter(emit);
  }

  Future<void> _onReloadRequested(
    SearchFilterReloadRequested event,
    Emitter<SearchFilterState> emit,
  ) async {
    await _loadFilter(emit);
  }

  void _onGroupSelected(
    SearchFilterGroupSelected event,
    Emitter<SearchFilterState> emit,
  ) {
    final SearchFilter? filter = state.filter;
    if (filter == null) {
      return;
    }

    final bool isExistingGroup = filter.categoryGroups.any(
      (SearchFilterCategoryGroup group) => group.title == event.title,
    );
    if (!isExistingGroup) {
      return;
    }

    final List<String> updatedExpandedTitles = List<String>.from(
      state.expandedTitles,
    );

    if (updatedExpandedTitles.contains(event.title)) {
      updatedExpandedTitles.remove(event.title);
    } else {
      updatedExpandedTitles.add(event.title);
    }

    emit(state.copyWith(expandedTitles: updatedExpandedTitles));
  }

  void _onItemSelected(
    SearchFilterItemSelected event,
    Emitter<SearchFilterState> emit,
  ) {
    emit(state.copyWith(selectedCategoryItem: event.item));
  }

  void _onColorSelected(
    SearchFilterColorSelected event,
    Emitter<SearchFilterState> emit,
  ) {
    emit(state.copyWith(selectedColorValue: event.colorValue));
  }

  void _onSizeSelected(
    SearchFilterSizeSelected event,
    Emitter<SearchFilterState> emit,
  ) {
    emit(state.copyWith(selectedSize: event.size));
  }

  void _onPriceRangeChanged(
    SearchFilterPriceRangeChanged event,
    Emitter<SearchFilterState> emit,
  ) {
    emit(state.copyWith(priceValues: event.values));
  }

  Future<void> _loadFilter(Emitter<SearchFilterState> emit) async {
    emit(
      state.copyWith(
        status: SearchFilterStatus.loading,
        clearErrorMessage: true,
      ),
    );

    try {
      final SearchFilter filter = await _buildSearchFilterUseCase();

      final String selectedCategoryItem =
          filter.categoryGroups.isNotEmpty &&
              filter.categoryGroups.first.items.isNotEmpty
          ? filter.categoryGroups.first.items.first
          : '';
      final int selectedColorValue = filter.colorValues.isNotEmpty
          ? filter.colorValues.first
          : 0xFFFFFFFF;
      final String selectedSize = filter.sizes.isNotEmpty
          ? filter.sizes.first
          : '';

      emit(
        state.copyWith(
          status: SearchFilterStatus.success,
          filter: filter,
          expandedTitles: const <String>[],
          selectedCategoryItem: selectedCategoryItem,
          selectedColorValue: selectedColorValue,
          selectedSize: selectedSize,
          priceValues: RangeValues(filter.minPrice, filter.maxPrice),
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: SearchFilterStatus.failure,
          errorMessage: 'Unable to load filter options. Please try again.',
        ),
      );
    }
  }
}
