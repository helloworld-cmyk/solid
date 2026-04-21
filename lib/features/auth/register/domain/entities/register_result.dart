enum RegisterFailureType { emailAlreadyInUse, unknown }

class RegisterResult {
  const RegisterResult.success({required this.message})
    : isSuccess = true,
      failure = null;

  const RegisterResult.failure({required this.failure, required this.message})
    : isSuccess = false;

  final bool isSuccess;
  final String message;
  final RegisterFailureType? failure;
}
