import '../../domain/entities/register_result.dart';

enum RegisterSubmissionStatus { idle, submitting, success, failure }

class RegisterState {
  const RegisterState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.isPasswordObscured = true,
    this.isConfirmPasswordObscured = true,
    this.showValidationErrors = false,
    this.status = RegisterSubmissionStatus.idle,
    this.feedbackMessage,
    this.failure,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final bool isPasswordObscured;
  final bool isConfirmPasswordObscured;
  final bool showValidationErrors;
  final RegisterSubmissionStatus status;
  final String? feedbackMessage;
  final RegisterFailureType? failure;

  bool get isSubmitting => status == RegisterSubmissionStatus.submitting;
  bool get isSuccess => status == RegisterSubmissionStatus.success;
  bool get isFailure => status == RegisterSubmissionStatus.failure;

  String get normalizedEmail => email.trim().toLowerCase();
  String get normalizedPhoneNumber => phoneNumber.trim();

  bool get isFirstNameEmpty => firstName.trim().isEmpty;
  bool get isLastNameEmpty => lastName.trim().isEmpty;
  bool get isEmailEmpty => normalizedEmail.isEmpty;
  bool get isPhoneNumberEmpty => normalizedPhoneNumber.isEmpty;
  bool get isPasswordEmpty => password.isEmpty;
  bool get isConfirmPasswordEmpty => confirmPassword.isEmpty;

  bool get isEmailValid {
    if (isEmailEmpty) {
      return false;
    }

    final RegExp emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(normalizedEmail);
  }

  bool get isPhoneNumberValid {
    if (isPhoneNumberEmpty) {
      return false;
    }

    final String digits = normalizedPhoneNumber.replaceAll(RegExp(r'\D'), '');
    return digits.length >= 8;
  }

  bool get isPasswordValid => password.length >= 6;

  bool get doPasswordsMatch => password == confirmPassword;

  bool get canSubmit {
    return !isFirstNameEmpty &&
        !isLastNameEmpty &&
        isEmailValid &&
        isPhoneNumberValid &&
        isPasswordValid &&
        doPasswordsMatch &&
        !isSubmitting;
  }

  String? get firstNameError {
    if (!showValidationErrors) {
      return null;
    }

    return isFirstNameEmpty ? 'Please enter first name' : null;
  }

  String? get lastNameError {
    if (!showValidationErrors) {
      return null;
    }

    return isLastNameEmpty ? 'Please enter last name' : null;
  }

  String? get emailError {
    if (!showValidationErrors) {
      return null;
    }

    if (isEmailEmpty) {
      return 'Please enter email';
    }

    if (!isEmailValid) {
      return 'Invalid email format';
    }

    if (failure == RegisterFailureType.emailAlreadyInUse) {
      return 'Email already in use';
    }

    return null;
  }

  String? get phoneNumberError {
    if (!showValidationErrors) {
      return null;
    }

    if (isPhoneNumberEmpty) {
      return 'Please enter phone number';
    }

    if (!isPhoneNumberValid) {
      return 'Invalid phone number';
    }

    return null;
  }

  String? get passwordError {
    if (!showValidationErrors) {
      return null;
    }

    if (isPasswordEmpty) {
      return 'Please enter password';
    }

    if (!isPasswordValid) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  String? get confirmPasswordError {
    if (!showValidationErrors) {
      return null;
    }

    if (isConfirmPasswordEmpty) {
      return 'Please confirm password';
    }

    if (!doPasswordsMatch) {
      return 'Passwords do not match';
    }

    return null;
  }

  String? get validationMessage {
    if (isFirstNameEmpty) {
      return 'Please enter your first name';
    }

    if (isLastNameEmpty) {
      return 'Please enter your last name';
    }

    if (isEmailEmpty) {
      return 'Please enter your email';
    }

    if (!isEmailValid) {
      return 'Please enter a valid email';
    }

    if (isPhoneNumberEmpty) {
      return 'Please enter your phone number';
    }

    if (!isPhoneNumberValid) {
      return 'Please enter a valid phone number';
    }

    if (isPasswordEmpty) {
      return 'Please enter your password';
    }

    if (!isPasswordValid) {
      return 'Password must be at least 6 characters';
    }

    if (isConfirmPasswordEmpty) {
      return 'Please confirm your password';
    }

    if (!doPasswordsMatch) {
      return 'Passwords do not match';
    }

    return null;
  }

  RegisterState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    bool? isPasswordObscured,
    bool? isConfirmPasswordObscured,
    bool? showValidationErrors,
    RegisterSubmissionStatus? status,
    String? feedbackMessage,
    RegisterFailureType? failure,
    bool clearFeedbackMessage = false,
    bool clearFailure = false,
  }) {
    return RegisterState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isConfirmPasswordObscured:
          isConfirmPasswordObscured ?? this.isConfirmPasswordObscured,
      showValidationErrors: showValidationErrors ?? this.showValidationErrors,
      status: status ?? this.status,
      feedbackMessage: clearFeedbackMessage
          ? null
          : feedbackMessage ?? this.feedbackMessage,
      failure: clearFailure ? null : failure ?? this.failure,
    );
  }
}
