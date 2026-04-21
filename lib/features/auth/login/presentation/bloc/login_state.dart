import '../../domain/entities/login_result.dart';

enum LoginSubmissionStatus { idle, submitting, success, failure }

class LoginState {
  const LoginState({
    this.email = '',
    this.password = '',
    this.isRememberMe = true,
    this.isPasswordObscured = true,
    this.showValidationErrors = false,
    this.status = LoginSubmissionStatus.idle,
    this.feedbackMessage,
    this.failure,
  });

  final String email;
  final String password;
  final bool isRememberMe;
  final bool isPasswordObscured;
  final bool showValidationErrors;
  final LoginSubmissionStatus status;
  final String? feedbackMessage;
  final LoginFailureType? failure;

  bool get isSubmitting => status == LoginSubmissionStatus.submitting;
  bool get isSuccess => status == LoginSubmissionStatus.success;
  bool get isFailure => status == LoginSubmissionStatus.failure;

  String get normalizedEmail => email.trim().toLowerCase();

  bool get isEmailEmpty => normalizedEmail.isEmpty;

  bool get isEmailValid {
    if (isEmailEmpty) {
      return false;
    }

    final RegExp emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(normalizedEmail);
  }

  bool get isPasswordEmpty => password.trim().isEmpty;

  bool get canSubmit => isEmailValid && !isPasswordEmpty && !isSubmitting;

  String? get emailError {
    if (!showValidationErrors) {
      return null;
    }

    if (isEmailEmpty) {
      return 'Please enter your email';
    }

    if (!isEmailValid) {
      return 'Invalid email format';
    }

    if (failure == LoginFailureType.userNotFound) {
      return 'Email does not exist';
    }

    return null;
  }

  String? get passwordError {
    if (!showValidationErrors) {
      return null;
    }

    if (isPasswordEmpty) {
      return 'Please enter your password';
    }

    if (failure == LoginFailureType.invalidPassword) {
      return 'Incorrect password';
    }

    return null;
  }

  String? get validationMessage {
    if (isEmailEmpty) {
      return 'Please enter your email';
    }

    if (!isEmailValid) {
      return 'Please enter a valid email';
    }

    if (isPasswordEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? isRememberMe,
    bool? isPasswordObscured,
    bool? showValidationErrors,
    LoginSubmissionStatus? status,
    String? feedbackMessage,
    LoginFailureType? failure,
    bool clearFeedbackMessage = false,
    bool clearFailure = false,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      showValidationErrors: showValidationErrors ?? this.showValidationErrors,
      status: status ?? this.status,
      feedbackMessage: clearFeedbackMessage
          ? null
          : feedbackMessage ?? this.feedbackMessage,
      failure: clearFailure ? null : failure ?? this.failure,
    );
  }
}
