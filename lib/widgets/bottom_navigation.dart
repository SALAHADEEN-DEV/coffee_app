import 'package:coffee_app_new/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  final String activeTab;
  final Function(String)? onTabChanged;

  const BottomNavigationWidget({
    super.key,
    this.activeTab = "home",
    this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {"id": "home", "icon": Icons.home_filled, "label": "Home"},
      {"id": "favorites", "icon": Icons.favorite_outline, "label": "Favorites"},
      {"id": "cart", "icon": Icons.shopping_bag_outlined, "label": "Cart"},
      {
        "id": "notifications",
        "icon": Icons.notifications_outlined,
        "label": "Notifications",
      },
    ];

    return Container(
      height: 99,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabs.map((tab) {
          final isActive = activeTab == tab["id"];

          return GestureDetector(
            onTap: () => onTabChanged?.call(tab["id"] as String),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  tab["icon"] as IconData,
                  color: isActive ? primaryColor : secondarySystemBgColor,
                  size: 24,
                ),
                const SizedBox(height: 6),
                if (isActive)
                  Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
