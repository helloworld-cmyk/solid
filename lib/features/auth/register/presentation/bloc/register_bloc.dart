import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/register_result.dart';
import '../../domain/usecases/sign_up_with_email_usecase.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required SignUpWithEmailUseCase signUpWithEmailUseCase})
    : _signUpWithEmailUseCase = signUpWithEmailUseCase,
      super(const RegisterState()) {
    on<RegisterFirstNameChanged>(_onFirstNameChanged);
    on<RegisterLastNameChanged>(_onLastNameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPhoneNumberChanged>(_onPhoneNumberChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegisterPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<RegisterConfirmPasswordVisibilityToggled>(
      _onConfirmPasswordVisibilityToggled,
    );
    on<RegisterSubmitted>(_onSubmitted);
    on<RegisterFeedbackConsumed>(_onFeedbackConsumed);
  }

  final SignUpWithEmailUseCase _signUpWithEmailUseCase;

  void _onFirstNameChanged(
    RegisterFirstNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        firstName: event.value,
        status: RegisterSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );
  }

  void _onLastNameChanged(
    RegisterLastNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        lastName: event.value,
        status: RegisterSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );
  }

  void _onEmailChanged(RegisterEmailChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        email: event.value,
        status: RegisterSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );
  }

  void _onPhoneNumberChanged(
    RegisterPhoneNumberChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        phoneNumber: event.value,
        status: RegisterSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.value,
        status: RegisterSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );
  }

  void _onConfirmPasswordChanged(
    RegisterConfirmPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        confirmPassword: event.value,
        status: RegisterSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );
  }

  void _onPasswordVisibilityToggled(
    RegisterPasswordVisibilityToggled event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  void _onConfirmPasswordVisibilityToggled(
    RegisterConfirmPasswordVisibilityToggled event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        isConfirmPasswordObscured: !state.isConfirmPasswordObscured,
      ),
    );
  }

  Future<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    final RegisterState validatedState = state.copyWith(
      showValidationErrors: true,
      status: RegisterSubmissionStatus.idle,
      clearFeedbackMessage: true,
      clearFailure: true,
    );
    emit(validatedState);

    if (!validatedState.canSubmit) {
      emit(
        validatedState.copyWith(
          status: RegisterSubmissionStatus.failure,
          feedbackMessage:
              validatedState.validationMessage ?? 'Please check your input',
        ),
      );
      return;
    }

    emit(
      validatedState.copyWith(
        status: RegisterSubmissionStatus.submitting,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );

    try {
      final RegisterResult response = await _signUpWithEmailUseCase(
        email: validatedState.normalizedEmail,
        password: validatedState.password,
        firstName: validatedState.firstName.trim(),
        lastName: validatedState.lastName.trim(),
        phoneNumber: validatedState.normalizedPhoneNumber,
      );

      emit(
        validatedState.copyWith(
          status: response.isSuccess
              ? RegisterSubmissionStatus.success
              : RegisterSubmissionStatus.failure,
          feedbackMessage: response.message,
          failure: response.failure,
          clearFailure: response.isSuccess,
        ),
      );
    } catch (_) {
      emit(
        validatedState.copyWith(
          status: RegisterSubmissionStatus.failure,
          feedbackMessage: 'Unexpected error, please try again',
          failure: RegisterFailureType.unknown,
        ),
      );
    }
  }

  void _onFeedbackConsumed(
    RegisterFeedbackConsumed event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        status: RegisterSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailure: true,
      ),
    );
  }
}
