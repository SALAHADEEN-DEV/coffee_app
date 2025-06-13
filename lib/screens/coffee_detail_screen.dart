import 'package:coffee_app_new/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/coffee_product.dart';
import 'order_screen.dart';

class CoffeeDetailScreen extends StatefulWidget {
  final CoffeeProduct product;

  const CoffeeDetailScreen({super.key, required this.product});

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  String selectedSize = "M";
  bool isFavorite = false;
  bool showFullDescription = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    afterBuildCreated(() async {
      setStatusBarColor(primaryColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (status, _) async {
        setStatusBarColor(splashBgColor);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        body: Column(
          children: [
            // Header
            Container(
              height: 44,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () {
                      finish(context);
                      setStatusBarColor(splashBgColor);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFF2A2A2A),
                        size: 20,
                      ),
                    ),
                  ),

                  // Title
                  const Text(
                    "Detail",
                    style: TextStyle(
                      color: Color(0xFF242424),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  // Favorite Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        color: const Color(0xFF2A2A2A),
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ).paddingTop(20),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    // Coffee Image
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 202,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          widget.product.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF8B4513),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.local_cafe,
                                color: Colors.white,
                                size: 60,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Product Details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left side - Product info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product name and type
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.product.name,
                                      style: const TextStyle(
                                        color: Color(0xFF242424),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      "Ice/Hot",
                                      style: TextStyle(
                                        color: Color(0xFFA2A2A2),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // Rating
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xFFFBBE21),
                                      size: 20,
                                    ),
                                    const SizedBox(width: 4),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: widget.product.rating
                                                .toString(),
                                            style: const TextStyle(
                                              color: Color(0xFF2A2A2A),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: " (230)",
                                            style: TextStyle(
                                              color: Color(0xFFA2A2A2),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Right side - Feature badges
                          Column(
                            children: [
                              Row(
                                children: [
                                  _buildFeatureBadge(Icons.delivery_dining),
                                  const SizedBox(width: 12),
                                  _buildFeatureBadge(Icons.coffee_outlined),
                                  const SizedBox(width: 12),
                                  _buildFeatureBadge(
                                    Icons.local_drink_outlined,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Divider
                    Container(
                      width: 295,
                      height: 1,
                      margin: const EdgeInsets.only(
                        left: 24,
                        top: 16,
                        bottom: 16,
                      ),
                      color: const Color(0xFFE3E3E3),
                    ),

                    // Description Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text:
                                      "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ",
                                  style: TextStyle(
                                    color: Color(0xFFA2A2A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                                ),
                                TextSpan(
                                  text: "Read More",
                                  style: const TextStyle(
                                    color: Color(0xFFC67C4E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  // Add tap gesture here if needed
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Size Selection
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Size",
                            style: TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              _buildSizeButton("S"),
                              const SizedBox(width: 16),
                              _buildSizeButton("M"),
                              const SizedBox(width: 16),
                              _buildSizeButton("L"),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 120), // Space for bottom section
                  ],
                ),
              ),
            ),

            // Bottom Section with Price and Buy Button
            Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 46),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  // Price Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Price",
                        style: TextStyle(
                          color: Color(0xFF909090),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.product.price,
                        style: const TextStyle(
                          color: Color(0xFFC67C4E),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 34),

                  // Buy Now Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to order screen
                        OrderScreen(
                          product: widget.product,
                          quantity: 1,
                        ).launch(context);
                      },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureBadge(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(237, 237, 237, 0.35),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 32,
        height: 32,
        padding: const EdgeInsets.all(6),
        child: Icon(icon, color: primaryColor, size: 20),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    final isSelected = selectedSize == size;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
          snackBar(context, title: 'Selected Size : $size');
        });
      },
      child: Container(
        width: 96,
        height: 41,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? primaryColor : const Color(0xFFE3E3E3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: isSelected ? primaryColor : const Color(0xFF242424),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
