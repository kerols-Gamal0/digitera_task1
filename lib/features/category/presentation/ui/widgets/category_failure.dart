import 'package:flutter/material.dart';

class CategoryFailure extends StatelessWidget {
  const CategoryFailure({
    required this.message,
    required this.onRetry,
    super.key,
  });
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.cloud_off_rounded, size: 52, color: Colors.grey),
        const SizedBox(height: 12),
        Text(message),
        const SizedBox(height: 14),
        FilledButton(onPressed: onRetry, child: const Text('Try again')),
      ],
    ),
  );
}
