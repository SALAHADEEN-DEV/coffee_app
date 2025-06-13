import 'package:flutter/material.dart';
import '../models/coffee_product.dart';
import 'delivery_tracking_screen.dart';

class OrderScreen extends StatefulWidget {
  final CoffeeProduct product;
  final int quantity;

  const OrderScreen({
    super.key,
    required this.product,
    this.quantity = 1,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String deliveryType = "Deliver";
  int productQuantity = 1;
  String paymentMethod = "Cash/Wallet";

  @override
  void initState() {
    super.initState();
    productQuantity = widget.quantity;
  }

  double get productPrice => 4.53;
  double get originalDeliveryFee => 2.0;
  double get discountedDeliveryFee => 1.0;
  double get totalPrice => (productPrice * productQuantity) + discountedDeliveryFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Column(
        children: [

          // Header
          Container(
            height: 44,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // Back Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF2A2A2A),
                      size: 16,
                    ),
                  ),
                ),

                const Expanded(
                  child: Text(
                    "Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF242424),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Spacer to balance the back button
                const SizedBox(width: 44),
              ],
            ),
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),

                  // Delivery Type Toggle
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEDED),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        _buildDeliveryTypeButton("Deliver", true),
                        _buildDeliveryTypeButton("Pick Up", false),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Delivery Address Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Delivery Address",
                          style: TextStyle(
                            color: Color(0xFF242424),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Jl. Kpg Sutoyo",
                          style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
                          style: TextStyle(
                            color: Color(0xFFA2A2A2),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _buildActionButton(
                              "Edit Address",
                              Icons.edit_outlined,
                              () {},
                            ),
                            const SizedBox(width: 8),
                            _buildActionButton(
                              "Add Note",
                              Icons.note_outlined,
                              () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Divider
                  Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    color: const Color(0xFFE3E3E3),
                  ),

                  const SizedBox(height: 16),

                  // Product Details
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        // Product Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            widget.product.imageUrl,
                            width: 54,
                            height: 54,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF8B4513),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.local_cafe,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Product Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: const TextStyle(
                                  color: Color(0xFF242424),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.product.description,
                                style: const TextStyle(
                                  color: Color(0xFFA2A2A2),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Quantity Controls
                        Row(
                          children: [
                            _buildQuantityButton(
                              Icons.remove,
                              () {
                                if (productQuantity > 1) {
                                  setState(() {
                                    productQuantity--;
                                  });
                                }
                              },
                            ),
                            Container(
                              width: 40,
                              alignment: Alignment.center,
                              child: Text(
                                productQuantity.toString(),
                                style: const TextStyle(
                                  color: Color(0xFF2A2A2A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            _buildQuantityButton(
                              Icons.add,
                              () {
                                setState(() {
                                  productQuantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Section Divider
                  Container(
                    height: 4,
                    color: const Color(0xFFF9F2ED),
                  ),

                  const SizedBox(height: 16),

                  // Discount Section
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFEDEDED)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.local_offer_outlined,
                          color: Color(0xFFC67C4E),
                          size: 20,
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Text(
                            "1 Discount is Applies",
                            style: TextStyle(
                              color: Color(0xFF313131),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF2A2A2A),
                          size: 16,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Section Divider
                  Container(
                    height: 4,
                    color: const Color(0xFFF9F2ED),
                  ),

                  const SizedBox(height: 16),

                  // Payment Summary
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Payment Summary",
                          style: TextStyle(
                            color: Color(0xFF242424),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Price",
                              style: TextStyle(
                                color: Color(0xFF313131),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "\$ ${(productPrice * productQuantity).toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Delivery Fee",
                              style: TextStyle(
                                color: Color(0xFF313131),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ ${originalDeliveryFee.toStringAsFixed(1)}",
                                  style: const TextStyle(
                                    color: Color(0xFF2A2A2A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "\$ ${discountedDeliveryFee.toStringAsFixed(1)}",
                                  style: const TextStyle(
                                    color: Color(0xFF242424),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
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

          // Bottom Payment Section
          Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 46),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                // Payment Method
                Row(
                  children: [
                    const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Color(0xFFC67C4E),
                      size: 20,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Cash/Wallet",
                            style: TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\$ ${totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Color(0xFFC67C4E),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF2A2A2A),
                      size: 24,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Order Button
                GestureDetector(
                  onTap: () {
                    // Navigate to delivery tracking screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeliveryTrackingScreen(
                          product: widget.product,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        "Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Home Indicator
          Container(
            height: 34,
            padding: const EdgeInsets.only(bottom: 8),
            color: Colors.white,
            child: Center(
              child: Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFF242424),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryTypeButton(String title, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            deliveryType = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFFEDEDED),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF242424),
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFA2A2A2)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: const Color(0xFF313131),
              size: 14,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFF313131),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFF9F2ED)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF2A2A2A),
          size: 16,
        ),
      ),
    );
  }
}
