import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    required this.controller,
    required this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Find your next favorite',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 6),
        Text(
          'Curated products for every lifestyle.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 18),
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: const InputDecoration(
            hintText: 'Search products',
            prefixIcon: Icon(Icons.search_rounded),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Popular products',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ],
    ),
  );
}
