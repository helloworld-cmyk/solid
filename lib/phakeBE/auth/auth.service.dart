import '../crypto/crypto.interface.dart';
import '../database/database.interface.dart';

enum AuthSignInFailure { userNotFound, invalidPassword, unknown }

class AuthSignInResult {
  const AuthSignInResult._({
    required this.isSuccess,
    required this.message,
    this.failure,
  });

  const AuthSignInResult.success([String message = 'Sign in successfully'])
    : this._(isSuccess: true, message: message);

  const AuthSignInResult.failure({
    required AuthSignInFailure type,
    required String message,
  }) : this._(isSuccess: false, message: message, failure: type);

  final bool isSuccess;
  final String message;
  final AuthSignInFailure? failure;
}

enum AuthSignUpFailure { emailAlreadyInUse, unknown }

class AuthSignUpResult {
  const AuthSignUpResult._({
    required this.isSuccess,
    required this.message,
    this.failure,
  });

  const AuthSignUpResult.success([String message = 'Sign up successfully'])
    : this._(isSuccess: true, message: message);

  const AuthSignUpResult.failure({
    required AuthSignUpFailure type,
    required String message,
  }) : this._(isSuccess: false, message: message, failure: type);

  final bool isSuccess;
  final String message;
  final AuthSignUpFailure? failure;
}

class AuthService {
  final AuthDatabase database;
  final PasswordCrypto crypto;

  AuthService({required this.database, required this.crypto});

  Future<bool> signIn(String email, String password) async {
    final result = await signInWithResult(email: email, password: password);
    return result.isSuccess;
  }

  Future<AuthSignInResult> signInWithResult({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 900));

    final normalizedEmail = email.trim().toLowerCase();
    final user = database.findUserByEmail(normalizedEmail);

    if (user == null) {
      return const AuthSignInResult.failure(
        type: AuthSignInFailure.userNotFound,
        message: 'Account not found for this email',
      );
    }

    if (!crypto.verifyPassword(
      plainTextPassword: password,
      passwordHash: user.passwordHash,
    )) {
      return const AuthSignInResult.failure(
        type: AuthSignInFailure.invalidPassword,
        message: 'Email or password is incorrect',
      );
    }

    return AuthSignInResult.success('Welcome back, ${user.firstName}');
  }

  Future<AuthSignUpResult> signUpWithResult({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final normalizedEmail = email.trim().toLowerCase();

    final existingUser = database.findUserByEmail(normalizedEmail);
    if (existingUser != null) {
      return const AuthSignUpResult.failure(
        type: AuthSignUpFailure.emailAlreadyInUse,
        message: 'This email is already registered',
      );
    }

    final newUser = DbUserRecord(
      id: database.nextId(),
      email: normalizedEmail,
      passwordHash: crypto.hashPassword(password),
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );

    database.createUser(newUser);

    return const AuthSignUpResult.success('Account created successfully');
  }
}
