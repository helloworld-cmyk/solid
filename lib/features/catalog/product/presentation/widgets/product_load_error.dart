import 'package:flutter/material.dart';
import 'package:solid/core/ui/widget/widgets.dart';

class ProductLoadError extends StatelessWidget {
  const ProductLoadError({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return CommonLoadError(
      message: 'Unable to load product detail. Please try again.',
      onRetry: onRetry,
    );
  }
}
