import 'package:coffee_app_new/common.dart';
import 'package:coffee_app_new/gen/assets.gen.dart';
import 'package:coffee_app_new/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/coffee_product.dart';

class DeliveryTrackingScreen extends StatefulWidget {
  final CoffeeProduct product;

  const DeliveryTrackingScreen({super.key, required this.product});

  @override
  State<DeliveryTrackingScreen> createState() => _DeliveryTrackingScreenState();
}

class _DeliveryTrackingScreenState extends State<DeliveryTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map Background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
            child: Stack(
              children: [
                // Simulated Map Image
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.images.imagePage53.path),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.grey,
                        BlendMode.saturation,
                      ),
                    ),
                  ),
                ),

                // Map Overlay for better readability
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white.withOpacity(0.1),
                ),

                // Delivery Route
                Positioned(
                  left: 82,
                  top: 169,
                  child: CustomPaint(
                    size: const Size(171, 143),
                    painter: DeliveryRoutePainter(),
                  ),
                ),

                // Starting Point Pin
                Positioned(
                  left: 66,
                  top: 211,
                  child:
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 16,
                        ),
                      ).onTap(() {
                        snackBar(context, title: "Delivery Location Clicked");
                      }),
                ),

                // Driver Icon on Route
                Positioned(
                  left: 233,
                  top: 311,
                  child:
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.motorcycle,
                          color: primaryColor,
                          size: 24,
                        ),
                      ).onTap(() {
                        snackBar(context, title: "Driver Location Clicked");
                      }),
                ),
              ],
            ),
          ),

          // Header Controls
          Positioned(
            top: 68,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                GestureDetector(
                  onTap: () => finish(context),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 18,
                      top: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: secondary3BgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: splashBgColor,
                      size: 24,
                    ),
                  ),
                ),

                // GPS/Current Location Button
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: secondary3BgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.gps_fixed,
                    color: splashBgColor,
                    size: 24,
                  ),
                ).onTap(() {
                  snackBar(context, title: "Current Location Clicked");
                }),
              ],
            ),
          ),

          // Bottom Sheet with Delivery Details
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 322,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  // Handle
                  Container(
                    width: 45,
                    height: 5,
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3E3E3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Time and Destination
                  Column(
                    children: [
                      const Text(
                        "10 minutes left",
                        style: TextStyle(
                          color: secondary4BgColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Delivery to ",
                              style: TextStyle(
                                color: secondarySystemBgColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "Jl. Kpg Sutoyo",
                              style: TextStyle(
                                color: splashBgColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Progress Bar
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        _buildProgressSegment(true),
                        _buildProgressSegment(true),
                        _buildProgressSegment(true),
                        _buildProgressSegment(false),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Delivery Status Card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE3E3E3)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE3E3E3)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.motorcycle,
                            color: primaryColor,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivered your order",
                                style: TextStyle(
                                  color: secondary4BgColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "We will deliver your goods to you in the shortest possible time.",
                                style: TextStyle(
                                  color: secondarySystemBgColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Driver Information
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        // Driver Profile
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            Assets.images.imagePage51.path,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4A5568),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Driver Details
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Brooklyn Simmons",
                                style: TextStyle(
                                  color: secondary4BgColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Personal Courier",
                                style: TextStyle(
                                  color: secondarySystemBgColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Call Button
                        GestureDetector(
                          onTap: () {
                            launchCall('967770009325');
                            snackBar(
                              context,
                              title: 'Calling Brooklyn Simmons...',
                            );
                          },
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFE3E3E3),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.phone,
                              color: splashBgColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSegment(bool isActive) {
    return Expanded(
      child: Container(
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF4CAF50) : const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class DeliveryRoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = primaryColor
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Starting from top-right, going down and left to simulate the delivery route
    path.moveTo(size.width * 0.95, 0);
    path.lineTo(size.width * 0.95, size.height * 0.15);
    path.lineTo(size.width * 0.85, size.height * 0.25);
    path.lineTo(size.width * 0.2, size.height * 0.35);
    path.lineTo(size.width * 0.2, size.height * 0.55);
    path.lineTo(size.width * 0.05, size.height * 0.6);
    path.lineTo(size.width * 0.08, size.height * 0.85);
    path.lineTo(0, size.height * 0.9);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
