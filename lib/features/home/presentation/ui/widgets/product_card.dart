import 'package:digitera_task1/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final image = product.images?.isNotEmpty == true
        ? product.images!.first
        : null;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: const Color(0xffeef1f4),
                  child: image == null
                      ? const Icon(
                          Icons.image_outlined,
                          size: 42,
                          color: Colors.grey,
                        )
                      : Image.network(
                          image,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const Icon(
                            Icons.image_not_supported_outlined,
                            size: 42,
                            color: Colors.grey,
                          ),
                        ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withValues(alpha: .9),
                    radius: 17,
                    child: const Icon(Icons.favorite_border, size: 18),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category?.name ?? 'Featured',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  product.title ?? 'Untitled product',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 9),
                Text(
                  '\$${product.price ?? 0}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
