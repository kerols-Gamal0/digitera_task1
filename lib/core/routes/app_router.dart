import 'package:digitera_task1/core/routes/app_routes.dart';
import 'package:digitera_task1/digitera.dart';
import 'package:digitera_task1/features/category/presentation/ui/category_screen.dart';
import 'package:digitera_task1/features/splash/presentation/ui/splash_screen.dart';
import 'package:flutter/material.dart';

abstract final class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute<void>(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case AppRoutes.categories:
        return MaterialPageRoute<void>(
          builder: (_) => const CategoryPage(),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          builder: (_) => const AppScaffold(),
          settings: settings,
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
