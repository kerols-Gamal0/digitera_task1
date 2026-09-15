import 'package:digitera_task1/features/category/data/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, super.key});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.antiAlias,
    child: Stack(
      fit: StackFit.expand,
      children: [
        category.image == null
            ? const ColoredBox(color: Color(0xffdfe8e7))
            : Image.network(
                category.image!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const ColoredBox(
                  color: Color(0xffdfe8e7),
                  child: Icon(Icons.category_outlined, size: 42),
                ),
              ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Color(0xcc102a2a)],
            ),
          ),
        ),
        Positioned(
          left: 14,
          right: 14,
          bottom: 14,
          child: Text(
            category.name ?? 'Category',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
