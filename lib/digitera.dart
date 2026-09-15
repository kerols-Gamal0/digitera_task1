import 'package:digitera_task1/core/routes/app_navigation.dart';
import 'package:digitera_task1/features/category/presentation/ui/category_screen.dart';
import 'package:digitera_task1/features/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [HomePage(), CategoryPage()],
      ),
      bottomNavigationBar: AppNavigation(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}
