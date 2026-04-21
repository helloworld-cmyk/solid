import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/category_item.dart';
import '../../domain/usecases/get_catagories_usecase.dart';
import 'catagories_event.dart';
import 'catagories_state.dart';

class CatagoriesBloc extends Bloc<CatagoriesEvent, CatagoriesState> {
  CatagoriesBloc({required GetCatagoriesUseCase getCatagoriesUseCase})
    : _getCatagoriesUseCase = getCatagoriesUseCase,
      super(const CatagoriesState()) {
    on<CatagoriesStarted>(_onStarted);
    on<CatagoriesReloadRequested>(_onReloadRequested);
  }

  final GetCatagoriesUseCase _getCatagoriesUseCase;

  Future<void> _onStarted(
    CatagoriesStarted event,
    Emitter<CatagoriesState> emit,
  ) async {
    if (!state.isInitial) {
      return;
    }
    await _load(emit);
  }

  Future<void> _onReloadRequested(
    CatagoriesReloadRequested event,
    Emitter<CatagoriesState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _load(Emitter<CatagoriesState> emit) async {
    emit(
      state.copyWith(status: CatagoriesStatus.loading, clearErrorMessage: true),
    );

    try {
      final List<CategoryItem> items = await _getCatagoriesUseCase();
      emit(
        state.copyWith(
          status: CatagoriesStatus.success,
          items: items,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: CatagoriesStatus.failure,
          errorMessage: 'Unable to load categories. Please try again.',
        ),
      );
    }
  }
}
