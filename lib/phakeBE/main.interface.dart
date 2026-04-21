import 'auth/auth_repository.dart';
import 'auth/auth.service.dart' show AuthSignInResult, AuthSignUpResult;

abstract class PhakeBEInterface {
	AuthRepository get auth;

	Future<AuthSignInResult> signInWithResult({
		required String email,
		required String password,
	});

	Future<AuthSignUpResult> signUpWithResult({
		required String email,
		required String password,
		required String firstName,
		required String lastName,
		required String phoneNumber,
	});

	void dispose();
}

