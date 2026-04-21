import 'package:flutter/material.dart';
import 'package:solid/core/ui/widget/widgets.dart';

class SearchLoadError extends StatelessWidget {
  const SearchLoadError({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return CommonLoadError(
      message: 'Unable to load search content. Please try again.',
      onRetry: onRetry,
    );
  }
}
