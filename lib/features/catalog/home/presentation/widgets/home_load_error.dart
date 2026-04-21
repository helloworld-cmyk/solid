import 'package:flutter/material.dart';
import 'package:solid/core/ui/widget/widgets.dart';

class HomeLoadError extends StatelessWidget {
  const HomeLoadError({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return CommonLoadError(message: message, onRetry: onRetry);
  }
}
