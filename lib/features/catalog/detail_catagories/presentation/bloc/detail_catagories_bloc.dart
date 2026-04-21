import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/detail_catagories_content.dart';
import '../../domain/entities/detail_catagories_product.dart';
import '../../domain/usecases/get_detail_catagories_content_usecase.dart';
import 'detail_catagories_event.dart';
import 'detail_catagories_state.dart';

class DetailCatagoriesBloc
    extends Bloc<DetailCatagoriesEvent, DetailCatagoriesState> {
  DetailCatagoriesBloc({
    required GetDetailCatagoriesContentUseCase getContentUseCase,
  }) : _getContentUseCase = getContentUseCase,
       super(const DetailCatagoriesState()) {
    on<DetailCatagoriesStarted>(_onStarted);
    on<DetailCatagoriesReloadRequested>(_onReloadRequested);
    on<DetailCatagoriesCategoryChanged>(_onCategoryChanged);
    on<DetailCatagoriesSheetToggled>(_onSheetToggled);
  }

  final GetDetailCatagoriesContentUseCase _getContentUseCase;

  List<DetailCatagoriesProduct> _allProducts =
      const <DetailCatagoriesProduct>[];
  String _categoryTitle = 'MEN';

  Future<void> _onStarted(
    DetailCatagoriesStarted event,
    Emitter<DetailCatagoriesState> emit,
  ) async {
    _categoryTitle = event.categoryTitle;
    await _load(emit);
  }

  Future<void> _onReloadRequested(
    DetailCatagoriesReloadRequested event,
    Emitter<DetailCatagoriesState> emit,
  ) async {
    await _load(emit);
  }

  void _onCategoryChanged(
    DetailCatagoriesCategoryChanged event,
    Emitter<DetailCatagoriesState> emit,
  ) {
    if (event.category == state.selectedCategory) {
      emit(state.copyWith(isCategorySheetOpen: false));
      return;
    }

    _applyCategory(category: event.category, emit: emit);
  }

  void _onSheetToggled(
    DetailCatagoriesSheetToggled event,
    Emitter<DetailCatagoriesState> emit,
  ) {
    emit(state.copyWith(isCategorySheetOpen: event.isOpen));
  }

  Future<void> _load(Emitter<DetailCatagoriesState> emit) async {
    emit(
      state.copyWith(
        status: DetailCatagoriesStatus.loading,
        clearErrorMessage: true,
      ),
    );

    try {
      final DetailCatagoriesContent content = await _getContentUseCase(
        _categoryTitle,
      );
      _allProducts = content.products;

      final String initialCategory = content.categories.isNotEmpty
          ? content.categories.first
          : 'All Product';

      emit(
        state.copyWith(
          status: DetailCatagoriesStatus.success,
          categories: content.categories,
          selectedCategory: initialCategory,
          heroImagePath: content.heroImagePath,
          isCategorySheetOpen: false,
          clearErrorMessage: true,
        ),
      );

      _applyCategory(category: initialCategory, emit: emit);
    } catch (_) {
      emit(
        state.copyWith(
          status: DetailCatagoriesStatus.failure,
          errorMessage: 'Unable to load category details. Please try again.',
          isCategorySheetOpen: false,
        ),
      );
    }
  }

  void _applyCategory({
    required String category,
    required Emitter<DetailCatagoriesState> emit,
  }) {
    final List<DetailCatagoriesProduct> filteredProducts =
        category == 'All Product'
        ? _allProducts
        : _allProducts
              .where(
                (DetailCatagoriesProduct product) => product.type == category,
              )
              .toList(growable: false);

    emit(
      state.copyWith(
        status: DetailCatagoriesStatus.success,
        selectedCategory: category,
        products: filteredProducts,
        isCategorySheetOpen: false,
        clearErrorMessage: true,
      ),
    );
  }
}
