enum LoginFailureType { userNotFound, invalidPassword, unknown }

class LoginResult {
  const LoginResult.success({required this.message})
    : isSuccess = true,
      failure = null;

  const LoginResult.failure({required this.failure, required this.message})
    : isSuccess = false;

  final bool isSuccess;
  final String message;
  final LoginFailureType? failure;
}
