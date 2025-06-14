import 'package:coffee_app_new/utils/colors.dart';
import 'package:flutter/material.dart';

import '../models/coffee_product.dart';
import 'star_rating.dart';

class ProductCard extends StatelessWidget {
  final CoffeeProduct product;
  final VoidCallback? onAddToCart;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onAddToCart,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 156,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Rating
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    product.imageUrl,
                    width: 160,
                    height: 140,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 160,
                        height: 140,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B4513),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.local_cafe,
                          color: Colors.white,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 51,
                    height: 28,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(17, 17, 17, 0.3),
                          Color.fromRGBO(49, 49, 49, 0.3),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(24),
                      ),
                    ),
                    child: StarRating(rating: product.rating),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Product Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    color: secondary4BgColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.description,
                  style: const TextStyle(
                    color: secondarySystemBgColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),

                // Price and Add Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.price,
                      style: const TextStyle(
                        color: secondary2BgColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: onAddToCart,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
