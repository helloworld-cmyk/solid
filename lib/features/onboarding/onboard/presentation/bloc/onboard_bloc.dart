import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/onboard_next_action.dart';
import '../../domain/entities/onboard_page.dart';
import '../../domain/usecases/get_onboard_pages_usecase.dart';
import '../../domain/usecases/resolve_onboard_next_action_usecase.dart';
import 'onboard_state.dart';

class OnboardBloc extends Cubit<OnboardState> {
  factory OnboardBloc({
    required ResolveOnboardNextActionUseCase resolveOnboardNextActionUseCase,
    required GetOnboardPagesUseCase getOnboardPagesUseCase,
    PageController? pageController,
  }) {
    final List<OnboardPage> pages = List<OnboardPage>.unmodifiable(
      getOnboardPagesUseCase(),
    );

    return OnboardBloc._(
      resolveOnboardNextActionUseCase: resolveOnboardNextActionUseCase,
      pages: pages,
      pageController: pageController,
    );
  }

  OnboardBloc._({
    required ResolveOnboardNextActionUseCase resolveOnboardNextActionUseCase,
    required List<OnboardPage> pages,
    PageController? pageController,
  }) : _resolveOnboardNextActionUseCase = resolveOnboardNextActionUseCase,
       _pages = pages,
       pageController = pageController ?? PageController(),
       super(OnboardState.initial(pages: pages));

  final ResolveOnboardNextActionUseCase _resolveOnboardNextActionUseCase;
  final List<OnboardPage> _pages;
  final PageController pageController;

  int _currentIndex = 0;
  bool _started = false;

  int get _totalPages => _pages.length;

  void start() {
    if (_started) {
      return;
    }

    _started = true;
    pageController.addListener(_handlePageScroll);
    _emitLatestPagePosition();
  }

  void _handlePageScroll() {
    _emitLatestPagePosition();
  }

  void _emitLatestPagePosition() {
    final double pagePosition;
    if (pageController.hasClients) {
      pagePosition = pageController.page ?? _currentIndex.toDouble();
    } else {
      pagePosition = _currentIndex.toDouble();
    }

    if (isClosed || pagePosition == state.pagePosition) {
      return;
    }

    emit(state.copyWith(pagePosition: pagePosition));
  }

  void onPageChanged(int index) {
    _currentIndex = index;

    if (!isClosed) {
      emit(state.copyWith(pagePosition: index.toDouble()));
    }
  }

  Future<void> goToNextPage() async {
    if (_totalPages == 0) {
      if (!isClosed) {
        emit(state.copyWith(shouldNavigateToLogin: true));
      }
      return;
    }

    final OnboardNextAction action = _resolveOnboardNextActionUseCase(
      currentIndex: _currentIndex,
      totalPages: _totalPages,
    );

    if (action is OnboardNavigateToLogin) {
      if (!isClosed) {
        emit(state.copyWith(shouldNavigateToLogin: true));
      }
      return;
    }

    if (action is OnboardAnimateToPage) {
      await pageController.animateToPage(
        action.pageIndex,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubicEmphasized,
      );
    }
  }

  void consumeLoginNavigation() {
    if (!state.shouldNavigateToLogin) {
      return;
    }

    emit(state.copyWith(shouldNavigateToLogin: false));
  }

  @override
  Future<void> close() {
    pageController.removeListener(_handlePageScroll);
    pageController.dispose();
    return super.close();
  }
}
