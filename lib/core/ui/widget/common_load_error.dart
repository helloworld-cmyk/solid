import 'package:flutter/material.dart';

class CommonLoadError extends StatelessWidget {
  const CommonLoadError({
    super.key,
    required this.message,
    required this.onRetry,
    this.retryLabel = 'Retry',
    this.icon = Icons.error_outline,
    this.iconColor = Colors.redAccent,
  });

  final String message;
  final VoidCallback onRetry;
  final String retryLabel;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 40, color: iconColor),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            FilledButton(onPressed: onRetry, child: Text(retryLabel)),
          ],
        ),
      ),
    );
  }
}
