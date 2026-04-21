import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/home_feed.dart';
import '../../domain/usecases/get_home_feed_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required GetHomeFeedUseCase getHomeFeedUseCase})
    : _getHomeFeedUseCase = getHomeFeedUseCase,
      super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeReloadRequested>(_onReloadRequested);
  }

  final GetHomeFeedUseCase _getHomeFeedUseCase;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    if (!state.isInitial) {
      return;
    }
    await _loadFeed(emit);
  }

  Future<void> _onReloadRequested(
    HomeReloadRequested event,
    Emitter<HomeState> emit,
  ) async {
    await _loadFeed(emit);
  }

  Future<void> _loadFeed(Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading, clearErrorMessage: true));

    try {
      final HomeFeed feed = await _getHomeFeedUseCase();
      emit(
        state.copyWith(
          status: HomeStatus.success,
          feed: feed,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: 'Unable to load home feed. Please try again.',
        ),
      );
    }
  }
}
