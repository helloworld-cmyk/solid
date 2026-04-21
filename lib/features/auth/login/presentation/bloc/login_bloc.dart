import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/login_result.dart';
import '../../domain/usecases/sign_in_with_email_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required SignInWithEmailUseCase signInWithEmailUseCase})
    : _signInWithEmailUseCase = signInWithEmailUseCase,
      super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginRememberMeToggled>(_onRememberMeToggled);
    on<LoginPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginFeedbackConsumed>(_onFeedbackConsumed);
  }

  final SignInWithEmailUseCase _signInWithEmailUseCase;

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.value,
        status: LoginSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: event.value,
        status: LoginSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );
  }

  void _onRememberMeToggled(
    LoginRememberMeToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isRememberMe: !state.isRememberMe));
  }

  void _onPasswordVisibilityToggled(
    LoginPasswordVisibilityToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final LoginState validatedState = state.copyWith(
      showValidationErrors: true,
      status: LoginSubmissionStatus.idle,
      clearFeedbackMessage: true,
      clearFailure: true,
    );
    emit(validatedState);

    if (!validatedState.canSubmit) {
      emit(
        validatedState.copyWith(
          status: LoginSubmissionStatus.failure,
          feedbackMessage:
              validatedState.validationMessage ?? 'Please check your input',
        ),
      );
      return;
    }

    emit(
      validatedState.copyWith(
        status: LoginSubmissionStatus.submitting,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );

    try {
      final LoginResult response = await _signInWithEmailUseCase(
        email: validatedState.normalizedEmail,
        password: validatedState.password,
      );

      emit(
        validatedState.copyWith(
          status: response.isSuccess
              ? LoginSubmissionStatus.success
              : LoginSubmissionStatus.failure,
          feedbackMessage: response.message,
          failure: response.failure,
          clearFailure: response.isSuccess,
        ),
      );
    } catch (_) {
      emit(
        validatedState.copyWith(
          status: LoginSubmissionStatus.failure,
          feedbackMessage: 'Unexpected error, please try again',
          failure: LoginFailureType.unknown,
        ),
      );
    }
  }

  void _onFeedbackConsumed(
    LoginFeedbackConsumed event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        status: LoginSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );
  }
}
