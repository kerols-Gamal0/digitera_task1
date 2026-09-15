import 'package:flutter/material.dart';

class AppNavigation extends StatelessWidget {
  const AppNavigation({
    required this.selectedIndex,
    this.onDestinationSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected ?? (_) {},
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.storefront_outlined),
          selectedIcon: Icon(Icons.storefront),
          label: 'Products',
        ),
        NavigationDestination(
          icon: Icon(Icons.grid_view_outlined),
          selectedIcon: Icon(Icons.grid_view_rounded),
          label: 'Categories',
        ),
      ],
    );
  }
}
