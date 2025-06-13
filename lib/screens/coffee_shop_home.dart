import 'package:coffee_app_new/gen/assets.gen.dart';
import 'package:coffee_app_new/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/coffee_product.dart';
import '../widgets/product_card.dart';
import '../widgets/category_tab.dart';
import '../widgets/bottom_navigation.dart';
import 'coffee_detail_screen.dart';

class CoffeeShopHome extends StatefulWidget {
  const CoffeeShopHome({super.key});

  @override
  State<CoffeeShopHome> createState() => _CoffeeShopHomeState();
}

class _CoffeeShopHomeState extends State<CoffeeShopHome> {
  String activeCategory = "All Coffee";
  String activeBottomTab = "home";
  List<CoffeeProduct> products = CoffeeProduct.getSampleProducts();

  final categories = ["All Coffee", "Machiato", "Latte", "Americano"];

  void handleAddToCart(int productId) {
    snackBar(context, title: 'Added product $productId to cart');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    afterBuildCreated(() async {
      setStatusBarColor(splashBgColor );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Header Section
                Container(
                  height: 280,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF111111), Color(0xFF313131)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Location & Profile
                      Positioned(
                        top: 28,
                        left: 24,
                        right: 24,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Location",
                                  style: TextStyle(
                                    color: Color(0xFFA2A2A2),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.12,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Text(
                                      "Bilzen, Tanjungbalai",
                                      style: TextStyle(
                                        color: Color(0xFFD8D8D8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: const Color(0xFFD8D8D8),
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4A4A4A),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Search Bar
                      Positioned(
                        top: 100,
                        left: 24,
                        right: 24,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 52,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2A2A2A),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: TextField(
                                        style: const TextStyle(color: Colors.white),
                                        decoration: const InputDecoration(
                                          hintText: "Search coffee",
                                          hintStyle: TextStyle(
                                            color: Color(0xFFA2A2A2),
                                            fontSize: 14,
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: const Color(0xFFC67C4E),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.tune,
                                color: Colors.white,
                                size: 20,
                              ),
                            ).onTap((){
                              snackBar(context, title: 'Show Setting');
                            }),
                          ],
                        ),
                      ),

                      // Promo Banner
                      Positioned(
                        bottom: -70,
                        left: 24,
                        right: 24,
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image:   DecorationImage(
                              image: AssetImage(
                                Assets.images.imagePage21.path
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFED5151),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    "Promo",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Buy one get\none FREE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    height: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Category & Products Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 80, 24, 120),
                  child: Column(
                    children: [
                      // Category Tabs
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories.map((category) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CategoryTab(
                                label: category,
                                isActive: activeCategory == category,
                                onTap: () {
                                  setState(() {
                                    activeCategory = category;
                                    snackBar(context, title: 'Category Tapped :$category');
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Product Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 156 / 238,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: products[index],
                            onAddToCart: () => handleAddToCart(products[index].id),
                            onTap: () {
                              CoffeeDetailScreen(  product: products[index]).launch(context);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:  BottomNavigationWidget(
              activeTab: activeBottomTab,
              onTabChanged: (tab) {
                setState(() {
                  activeBottomTab = tab;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
