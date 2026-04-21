import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/wait_splash_delay_usecase.dart';
import 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc({required WaitSplashDelayUseCase waitSplashDelayUseCase})
    : _waitSplashDelayUseCase = waitSplashDelayUseCase,
      super(const SplashState.initial());

  final WaitSplashDelayUseCase _waitSplashDelayUseCase;
  final Duration _animationPeriod = const Duration(milliseconds: 2400);
  final Duration _frameInterval = const Duration(milliseconds: 16);
  bool _started = false;
  Stopwatch? _animationStopwatch;
  Timer? _animationTimer;

  void start() {
    if (_started) {
      return;
    }

    _started = true;
    _animationStopwatch = Stopwatch()..start();
    _animationTimer = Timer.periodic(_frameInterval, (_) {
      final int elapsedMilliseconds =
          _animationStopwatch?.elapsedMilliseconds ?? 0;
      final double period = _animationPeriod.inMilliseconds.toDouble();
      final double progress = (elapsedMilliseconds % period) / period;

      if (!isClosed) {
        emit(state.copyWith(animationProgress: progress));
      }
    });

    unawaited(_navigateToOnboardAfterDelay());
  }

  Future<void> _navigateToOnboardAfterDelay() async {
    await _waitSplashDelayUseCase();

    if (!isClosed) {
      emit(state.copyWith(shouldNavigateToOnboard: true));
    }
  }

  void consumeNavigation() {
    if (!state.shouldNavigateToOnboard) {
      return;
    }

    emit(state.copyWith(shouldNavigateToOnboard: false));
  }

  @override
  Future<void> close() {
    _animationTimer?.cancel();
    _animationStopwatch?.stop();
    return super.close();
  }
}
